using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebClient.Models;

namespace WebClient
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected async void ButtonAddPatient_Click(object sender, EventArgs e)
        {
            if (txbFirstName.Text == "" && txbLastName.Text == "" && txbPatronymic.Text == "" && txbWorkPlace.Text == "" && txbInsuranseNum.Text == "" && txbInsuranseExpiration.Text == "" && txbInsuranseCompany.Text == "" && txbPassNumber.Text == "" && txbPassSeries.Text == "")
            {
                return;
            }

            await ViewPatientModel.PostObjectPassport(txbPassSeries.Text, txbPassNumber.Text);
            await ViewPatientModel.PostObjectInsuransePolicy(txbInsuranseNum.Text, txbInsuranseExpiration.Text);
            await ViewPatientModel.PostObjectInsuranseCompany(txbInsuranseCompany.Text);
            await ViewPatientModel.PostObjectPatient(txbFirstName.Text, txbLastName.Text, txbPatronymic.Text, txbWorkPlace.Text);

            Response.Redirect(Request.RawUrl);
        }
    }
}