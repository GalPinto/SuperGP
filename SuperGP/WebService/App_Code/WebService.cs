using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService
{

    public WebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string Purchase(string CCNumber,string CVV, string ExpirationDate,string amount,string ID)
    {
        DataSet ds = sql_db.chkData("SELECT * FROM Cards WHERE CCNumber='" + CCNumber + "' AND CVV='" + CVV + "' AND ExpirationDate='" + ExpirationDate + "' AND ID='" + ID + "' "); // find card
        if (ds.Tables[0].Rows.Count > 0)
            if ((double.Parse(ds.Tables[0].Rows[0]["AmountToPay"].ToString()) + double.Parse(amount)) < double.Parse(ds.Tables[0].Rows[0]["CardLimit"].ToString())) // check card limit
            {
                sql_db.udi("UPDATE Cards SET AmountToPay=AmountToPay+" + amount + " WHERE CCNumber='" + CCNumber + "' AND CVV='" + CVV + "' AND ExpirationDate='" + ExpirationDate + "' AND ID='" + ID + "'");
                return "";
            }
            else
            {
                return "Card Limit Cannot Complete Purchase.";
            }
        else
        {

            return "Card Not Found.";
        }
    }
}
