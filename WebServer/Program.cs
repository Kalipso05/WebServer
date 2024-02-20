using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace WebServer
{
    internal class Program
    {
        internal static async Task RoutedRequest(HttpListenerResponse response, HttpListenerRequest request)
        {
            var path = request.Url.AbsolutePath;
            var method = request.HttpMethod;

            if (path.StartsWith("/api") && path.TrimEnd('/') == "/api")
            {
                if (method == "GET")
                {
                    var content = File.ReadAllText(@"C:\Users\ServerPC\source\repos\WebServer\WebServer\Documentation\index.html");

                    await Settings.SendResponse(response, content, "text/html");
                    Settings.Log("GET запрос на получение документации выполнен");
                }
            }
            else if (path.StartsWith("/api/Patient"))
            {
                switch (method)
                {
                    case "GET":
                        await RegisteredPatientRequest.HandleGetPatient(response);
                        break;
                    case "POST":
                        await RegisteredPatientRequest.HandlePostPatient(response, request);
                        break;
                    case "PUT":
                        await RegisteredPatientRequest.HandlePutPatient(response, request);
                        break;
                    case "DELETE":
                        await RegisteredPatientRequest.HandleDeletePatient(response, request);
                        break;
                    default:
                        response.StatusCode = 404;
                        break;
                }
            }
            else if(path.StartsWith("/api/Passport"))
            {
                if (method == "POST")
                {
                    await PassportRequest.HandlePostPassport(response, request);
                }
            }
            else if(path.StartsWith("/api/InsuransePolicy"))
            {
                if (method == "POST")
                {
                    await InsuransePolicyRequest.HandlePostInsuransePolicy(response, request);
                }
            }
            else if(path.StartsWith("/api/InsuranseCompany"))
            {
                if(method == "POST")
                {
                    await InsuranseCompanyRequest.HandlePostInsuranseCompany(response, request);
                }
            }
            response.Close();
        }

        internal static async Task StartServer()
        {
            HttpListener listener = new HttpListener();
            listener.Prefixes.Add("http://localhost:8080/api/");
            listener.Start();
            Settings.Log("Сервер успешно запушен", ConsoleColor.DarkGray);

            while (true)
            {
                var context = await listener.GetContextAsync();
                await RoutedRequest(context.Response, context.Request);
            }
        }

        static void Main(string[] args)
        {
            Task.Run(() => StartServer()).GetAwaiter().GetResult();
        }
    }
}
