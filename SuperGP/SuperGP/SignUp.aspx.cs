using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.OleDb;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lbl_message.Text = "";
        DataSet ds = sql_db.chkData("SELECT * FROM Cities");

        ddl_city.DataSource = ds.Tables[0];

        ddl_city.DataTextField = ds.Tables[0].Columns["CityName"].ToString();
        ddl_city.DataValueField = ds.Tables[0].Columns["CityName"].ToString();


        ddl_city.DataBind();

    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            if (txt_id.Text.Length > 0 && txt_email.Text.Length > 0 && txt_firstname.Text.Length > 0 && txt_lastname.Text.Length > 0 && txt_password.Text.Length > 0 && txt_username.Text.Length > 0 && rdo_gender.Text.Length > 0)
            {
                if (txt_id.Text.Length == 9)
                {
                    if (checkInput())
                    {
                        /* OleDbConnection connection = new OleDbConnection();
                        connection.ConnectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=D:\GalPinto\WebProject\211564265\App_Data\DatabaseCostumers.mdb;Persist Security Info=False;";

                        connection.Open();

                        OleDbCommand command = new OleDbCommand();
                        command.Connection = connection;
                        command.CommandText = " INSERT INTO Costumer VALUES('" + txt_username.Text + "','" + txt_password.Text + "','" + txt_firstname.Text + "','" + txt_lastname.Text + "','" + txt_email.Text + "','" + txt_id.Text + "','" + rdo_gender.Text + "','" + ddl_city.Text + "')";
                        command.ExecuteNonQuery();
                        lbl_message.Text = "Succesfully signed up to the site.";

                        connection.Close();
                         */

                        sql_db.udi("INSERT INTO Costumer VALUES('" + txt_username.Text + "','" + txt_password.Text + "','" + txt_firstname.Text + "','" + txt_lastname.Text + "','" + txt_email.Text + "','" + txt_id.Text + "','" + rdo_gender.Text + "','" + ddl_city.Text + "','no')");
                        lbl_message.Text = "Succesfully signed up to the site.";
                    }
                }
                else
                    lbl_message.Text = "ID needs to have 9 digits.";
            }
            else
                lbl_message.Text = "Please fill up all the fields.";
        }
        catch(Exception)
        {
            lbl_message.Text = "Username taken.";
        }
    }

    private bool checkInput()
    {
        string id = txt_id.Text;
        foreach (char c in id)
        {
            if (c < '0' || c > '9')
            {
                lbl_message.Text = "Invalid ID.";
                return false;
            }
        }

        string email = txt_email.Text;
        if (email.IndexOf("@") <= 0 || email.IndexOf("@") >= email.Length - 1)
        {
            lbl_message.Text = "Invalid email adress.";
            return false;
        }
        return true;
    }

    protected void btn_signin_Click(object sender, EventArgs e)
    {
        Response.Redirect("LoginPage.aspx");
    }

    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Products.aspx");
    }

    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        Response.Redirect("HomePage.aspx");
    }


   
}
