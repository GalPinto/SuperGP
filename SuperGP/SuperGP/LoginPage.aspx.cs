using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.OleDb;

public partial class LoginPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btn_signup_Click(object sender, EventArgs e)
    {
        Response.Redirect("SignUp.aspx");
    }
    protected void btn_signin_Click(object sender, EventArgs e)
    {
        DataSet ds = sql_db.chkData("SELECT * FROM Costumer WHERE Username='" + txt_username.Text + "' AND Password='" + txt_password.Text + "'");
        if (ds.Tables[0].Rows.Count > 0)
        {
            lbl_output.Text = "Hello " + ds.Tables[0].Rows[0]["FirstName"] + " " + ds.Tables[0].Rows[0]["LastName"];
            Session["login"] = true;
            Session["username"] = ds.Tables[0].Rows[0]["Username"].ToString();
            Session["name"] = ds.Tables[0].Rows[0]["FirstName"].ToString() + " " + ds.Tables[0].Rows[0]["LastName"].ToString();
            Response.Redirect("Homepage.aspx");
        }
        else
            lbl_output.Text = "Wrong username or password.";
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
