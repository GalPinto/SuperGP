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
using System.Threading;

public partial class HomePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LinkButton3.Visible = false;
        lbl_signed.Visible = false;
        LinkButton4.Visible = false;
        LinkButton6.Visible = false;
        LinkButton7.Visible = false;
        LinkButton8.Visible = false;

        LinkButtonMessage.Visible = false;
        LinkButtonMyMessages.Visible = false;

        try
        {
            if ((bool)(Session["login"]) == true)
            {
                LinkButton1.Visible = false;
                LinkButton2.Visible = false;
                lbl_or.Visible = false;
                lbl_signed.Text = "Welcome " + Session["name"].ToString();
                lbl_signed.Visible = true;
                LinkButton3.Visible = true;
                LinkButton4.Visible = true;
                LinkButton6.Visible = true;
                LinkButton7.Visible = true;

                LinkButtonMessage.Visible = true;
                LinkButtonMyMessages.Visible = true;

                //Check if admin
                DataSet ds = sql_db.chkData("SELECT * FROM Costumer WHERE Username='" + Session["username"] + "' AND Admin='yes'");
                if (ds.Tables[0].Rows.Count > 0)
                    LinkButton8.Visible = true;

                DataSet ds2 = sql_db.chkData("SELECT * FROM Messages WHERE Username='" + Session["username"].ToString() + "' AND LEN(Response)>0");
                LinkButtonMyMessages.Text = "My Messages (" + ds2.Tables[0].Rows.Count + ")";
            }
        }
        catch (Exception)
        {

        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("SignUp.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("LoginPage.aspx");
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Session["login"] = false;
        Session["username"] = "";
        Response.Redirect("Homepage.aspx");
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserInfo.aspx");
    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Products.aspx");
    }
    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        Response.Redirect("Cart.aspx");
    }
    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        Response.Redirect("MyOrders.aspx");
    }
    protected void LinkButton8_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminSide.aspx");
    }

    protected void LinkButtonMessage_Click(object sender, EventArgs e)
    {
        string prompt = "<script langauge='javascript'>" +
                   "var pmt = prompt('Enter the message to the Admins:');" + "storeUserInput(pmt);" + "</script>";
        Page.RegisterStartupScript("Prompt", prompt);
    }
    protected void LinkButtonMyMessages_Click(object sender, EventArgs e)
    {
        pnl_slider.Visible = false;
        GridView1.Visible = true;
    }

    protected void txt_1_TextChanged(object sender, EventArgs e)
    {
        if(txt_1.Value.Length > 0)
        {
            try
            {
                string sql = "INSERT INTO Messages (Username,Message,Response) VALUES('" + Session["username"] + "','" + txt_1.Value + "','')";
                sql_db.udi(sql);
            }
            catch(Exception)
            {
                string scriptError = "<script language='javascript'>alert('Cannot send the same message twice, You have to wait until the admins read your first message.')" + "</script>";
                Page.RegisterStartupScript("JavaScript", scriptError);
            }

            txt_1.Value = "";

            string scriptSuccess = "<script language='javascript'>alert('Successfully sent to admins.')" + "</script>";
            Page.RegisterStartupScript("JavaScript", scriptSuccess);
        }
        else
        {
            string script = "<script language='javascript'>alert('Cancelled your message.')" + "</script>";
            Page.RegisterStartupScript("JavaScript", script);
        }
    }
}
