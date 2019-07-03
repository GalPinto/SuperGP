using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            LinkButton3.Visible = false;
            lbl_signed.Visible = false;
            LinkButton4.Visible = false;
            LinkButton8.Visible = false;

            LinkButtonMessage.Visible = false;

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

                    LinkButtonMessage.Visible = true;

                    //Check if admin
                    DataSet ds1 = sql_db.chkData("SELECT * FROM Costumer WHERE Username='" + Session["username"] + "' AND Admin='yes'");
                    if (ds1.Tables[0].Rows.Count > 0)
                        LinkButton8.Visible = true;
                }
            }
            catch (Exception)
            {
                Response.Redirect("LoginPage.aspx");
            }

            DataSet ds = sql_db.chkData("SELECT * FROM Cart WHERE Username='" + Session["username"].ToString() + "'");
            if (ds.Tables[0].Rows.Count == 0)
            {
                l1.Visible = true;
            }
            else
            {
                l2.Visible = true;
                btn1.Visible = true;
                int sum = 0;
                for (int i = 0; i < GridView1.Rows.Count; i++)
                    if (GridView1.Rows[i].RowType != DataControlRowType.Header)
                        sum += int.Parse(GridView1.Rows[i].Cells[3].Text.ToString());
                l2.Text = "Total: $" + sum;
            }
            try
            {
                if (bool.Parse(Request.QueryString["sent"].ToString()) == true)
                {
                    string scriptError = "<script language='javascript'>alert('Payment Completed Successfully.')" + "</script>";
                    Page.RegisterStartupScript("JavaScript", scriptError);
                }
            }
            catch { }
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
        Response.Redirect("HomePage.aspx");
    }
    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        Response.Redirect("MyOrders.aspx");
    }
    public void GridView1_RowDataBound(Object sender, GridViewRowEventArgs e)
    {
        /*
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            switch (e.Row.Cells[1].Text)
            {
                case "1": e.Row.Cells[1].Text = "Lamborghini Gallardo";
                    break;
                case "2": e.Row.Cells[1].Text = "Ferrari California";
                    break;
                case "3": e.Row.Cells[1].Text = "Porsche 911";
                    break;
                case "4": e.Row.Cells[1].Text = "Mercedes AMG GTR";
                    break;
                case "5": e.Row.Cells[1].Text = "Bugatti Chrion";
                    break;
                case "6": e.Row.Cells[1].Text = "Nissan GTR";
                    break;
            }
        }*/
    }

    protected void btn1_Click(object sender, EventArgs e)
    {
        pnl_payment.Visible = true;
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

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        TableCell cell1 = GridView1.Rows[e.RowIndex].Cells[1];
        TableCell cell2 = GridView1.Rows[e.RowIndex].Cells[2];
        sql_db.udi("UPDATE Cars SET Cars.InStock=Cars.InStock+" + cell2.Text.ToString() + " WHERE Cars.[CarProducer]='" + cell1.Text.ToString().Split(' ')[0] + "' AND Cars.Model='" + cell1.Text.ToString().Split(' ')[1] + "'");
    }

    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        Response.Redirect("Cart.aspx");
    }

    protected void btn_cancel_Click(object sender, EventArgs e)
    {
        txt_ccnumber.Text = "";
        txt_cvv.Text = "";
        txt_exdate.Text = "";
        txt_id.Text = "";
        lbl_output.Text = "";
        pnl_payment.Visible = false;
    }

    protected void btn_payment_Click(object sender, EventArgs e)
    {
        Service.WebService s = new Service.WebService();
        string request = s.Purchase(txt_ccnumber.Text, txt_cvv.Text, txt_exdate.Text, l2.Text.Split('$')[1], txt_id.Text);
        if (request.Length == 0)
        {
            DataSet ds = sql_db.chkData("SELECT * FROM Cart WHERE Username='" + Session["username"].ToString() + "'");
            sql_db.udi("DELETE FROM Cart WHERE Username='" + Session["username"].ToString() + "'");
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                sql_db.udi("INSERT INTO Orders (Car,Quantity,TotalPrice,Username) VALUES('" + ds.Tables[0].Rows[i]["Car"].ToString() + "','" + ds.Tables[0].Rows[i]["Quantity"].ToString() + "','" + ds.Tables[0].Rows[i]["TotalPrice"].ToString() + "','" + ds.Tables[0].Rows[i]["Username"].ToString() + "')");
            }
            //SendEmail("smtp.gmail.com", "Receipt", "Your Order Has Successfully Executed.", "galpinto0@gmail.com");
            Response.Redirect("Cart.aspx?sent=true");
        }
        else
            lbl_output.Text = request;
    }
}