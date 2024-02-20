using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace WebServer
{
    internal class Settings
    {
        internal static async Task SendResponse(HttpListenerResponse response, string content, string contentType = "application/json", HttpStatusCode statusCode = HttpStatusCode.OK)
        {
            byte[] buffer = Encoding.UTF8.GetBytes(content);
            response.ContentLength64 = buffer.Length;
            response.ContentType = contentType;

            await response.OutputStream.WriteAsync(buffer, 0, buffer.Length);
            response.Close();
        }
        internal static void Log(string message, ConsoleColor color = ConsoleColor.Green, HttpStatusCode code = HttpStatusCode.OK)
        {
            Console.ForegroundColor = color;
            Console.WriteLine($"[{DateTime.Now}] - {message} ({code})");
        }
    }
}
