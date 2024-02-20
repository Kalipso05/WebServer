using ModelDataBase.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace WebServer
{
    internal class InsuransePolicyRequest
    {
        internal static async Task HandlePostInsuransePolicy(HttpListenerResponse response, HttpListenerRequest request)
        {
            try
            {
                string contentBody;
                using (var reader = new StreamReader(request.InputStream, request.ContentEncoding))
                {
                    contentBody = await reader.ReadToEndAsync();
                }
                var insuransePolicy = JsonConvert.DeserializeObject<InsuransePolicy>(contentBody);
                if (insuransePolicy == null)
                {
                    await Settings.SendResponse(response, "Были отправлены неверные данные", statusCode: HttpStatusCode.BadRequest);
                    Settings.Log("При POST запросе были отправлены неверные данные", ConsoleColor.DarkRed, HttpStatusCode.BadRequest);
                    return;
                }

                using (var db = new dbModel())
                {
                    db.InsuransePolicy.Add(insuransePolicy);
                    await db.SaveChangesAsync();
                    await Settings.SendResponse(response, "В базу данных добавлены данные полиса");
                    Settings.Log("POST запрос на добавление полиса выполнен");
                }
            }
            catch (Exception e)
            {
                Settings.Log($"Ошибка: {e.Message}", ConsoleColor.DarkRed, HttpStatusCode.BadRequest);
            }
        }
    }
}
