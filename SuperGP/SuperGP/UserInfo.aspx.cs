using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class UserInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LinkButton9.Visible = false;

        LinkButtonMessage.Visible = false;

        if (!IsPostBack)
        {
            lbl_message.Text = "";
            try
            {
                DataSet ds = sql_db.chkData("SELECT * FROM Costumer WHERE Username='" + Session["Username"].ToString() + "'");
                txt_password.Text = ds.Tables[0].Rows[0]["Password"].ToString();
                txt_id.Text = ds.Tables[0].Rows[0]["ID"].ToString();
                txt_email.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                txt_firstname.Text = ds.Tables[0].Rows[0]["FirstName"].ToString();
                txt_lastname.Text = ds.Tables[0].Rows[0]["LastName"].ToString();
                rdo_gender.SelectedValue = ds.Tables[0].Rows[0]["Gender"].ToString();
                ddl_city.Text = ds.Tables[0].Rows[0]["City"].ToString();

                //Check if admin
                DataSet ds1 = sql_db.chkData("SELECT * FROM Costumer WHERE Username='" + Session["username"] + "' AND Admin='yes'");
                if (ds1.Tables[0].Rows.Count > 0)
                    LinkButton9.Visible = true;

                LinkButtonMessage.Visible = true;
            }
            catch(Exception)
            {
                Response.Redirect("LoginPage.aspx");
            }
        }
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            if (txt_id.Text.Length > 0 && txt_email.Text.Length > 0 && txt_firstname.Text.Length > 0 && txt_lastname.Text.Length > 0 && txt_password.Text.Length > 0 && rdo_gender.Text.Length > 0)
            {
                if (txt_id.Text.Length == 9)
                {
                    if (checkInput())
                    {
                        sql_db.udi("UPDATE Costumer SET Costumer.Password='" + txt_password.Text + "', Costumer.FirstName='" + txt_firstname.Text + "', Costumer.LastName='" + txt_lastname.Text + "', Costumer.Email='" + txt_email.Text + "', Costumer.ID='" + txt_id.Text + "', Costumer.Gender='" + rdo_gender.Text + "', Costumer.City='" + ddl_city.Text + "' WHERE Costumer.Username='" + Session["Username"].ToString() + "'");

                        string script = "<script language='javascript'>alert('Successfully updated your user.')" + "</script>";
                        Page.RegisterStartupScript("JavaScript", script);


                        //lbl_message.Text = "Succesfully updated your user.";
                    }
                }
                else
                    lbl_message.Text = "ID needs to have 9 digits.";
            }
            else
                lbl_message.Text = "Please fill up all the fields.";
        }
        catch (Exception)
        {
            Response.Redirect("LoginPage.aspx");
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

    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Session["login"] = false;
        Session["username"] = "";
        Response.Redirect("Homepage.aspx");
    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Products.aspx");
    }

    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        Response.Redirect("HomePage.aspx");
    }
    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        Response.Redirect("MyOrders.aspx");
    }
    protected void LinkButton8_Click(object sender, EventArgs e)
    {
        Response.Redirect("Cart.aspx");
    }
    protected void LinkButton9_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminSide.aspx");
    }

    protected void LinkButtonMessage_Click(object sender, EventArgs e)
    {
        string prompt = "<script langauge='javascript'>" +
                   "var pmt = prompt('Enter the message to the Admins:');" + "storeUserInput(pmt);" + "</script>";
        Page.RegisterStartupScript("Prompt", prompt);
    }

    protected void txt_1_TextChanged(object sender, EventArgs e)
    {
        if (txt_1.Value.Length > 0)
        {
            try
            {
                string sql = "INSERT INTO Messages VALUES('" + Session["username"] + "','" + txt_1.Value + "','')";
                sql_db.udi(sql);
            }
            catch (Exception)
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