using ModelDataBase.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Text;

namespace WebClient.Models
{
    public class ViewPatientModel
    {
        internal static async Task PostObjectPatient(string firstname, string lastname, string patronymic, string workPlace)
        {
            var patient = new Patient()
            {
                FirstName = firstname,
                LastName = lastname,
                Patronymic = patronymic,
                WorkPlace = workPlace,
            };

            var json = JsonConvert.SerializeObject(patient);
            var content = new StringContent(json, Encoding.UTF8, "application/json");

            using(var client =  new HttpClient())
            {
                var response = await client.PostAsync("http://localhost:8080/api/Patient", content);
            }
        }
        internal static async Task PostObjectPassport(string passportSeries, string passportNumber)
        {
            var passport = new Passport()
            {
                NumberPassport = passportNumber,
                SeriesPassport = passportSeries
            };
            var json = JsonConvert.SerializeObject(passport);
            var content = new StringContent(json, Encoding.UTF8, "application/json");

            using (var client = new HttpClient())
            {
                var response = await client.PostAsync("http://localhost:8080/api/Passport", content);
            }
        }
        internal static async Task PostObjectInsuransePolicy(string insuranseNumber, string insuranseExperation)
        {
            var f = DateTime.Parse(insuranseExperation);
            var insuransePolicy = new InsuransePolicy()
            {
                DateOfExpiration = DateTime.Parse(insuranseExperation),
                Number = insuranseNumber,
            };
            var json = JsonConvert.SerializeObject(insuransePolicy);
            var content = new StringContent(json, Encoding.UTF8, "application/json");

            using (var client = new HttpClient())
            {
                var response = await client.PostAsync("http://localhost:8080/api/InsuransePolicy", content);
            }
        }
        internal static async Task PostObjectInsuranseCompany(string insuranseCompanyTitle)
        {
            var insuranseCompany = new InsuranseCompany()
            {
                Title = insuranseCompanyTitle
            };
            var json = JsonConvert.SerializeObject(insuranseCompany);
            var content = new StringContent(json, Encoding.UTF8, "application/json");

            using (var client = new HttpClient())
            {
                var response = await client.PostAsync("http://localhost:8080/api/InsuranseCompany", content);
            }
        }
    }
}