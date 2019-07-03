using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Products : System.Web.UI.Page
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

                //Check if admin
                DataSet ds1 = sql_db.chkData("SELECT * FROM Costumer WHERE Username='" + Session["username"] + "' AND Admin='yes'");
                if (ds1.Tables[0].Rows.Count > 0)
                    LinkButton8.Visible = true;
            }
        }
        catch (Exception)
        {

        }

        DataSet ds = sql_db.chkData("SELECT * FROM Cars");
        //grv_Cars.DataSource = ds.Tables[0];
        //grv_Cars.DataBind();

        int numInRow = 4;
        int numPaddingX = 485;
        int numPaddingY = 250;
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {

            Panel p1 = new Panel();
            p1.BackColor = System.Drawing.Color.Silver;
            p1.BorderColor = System.Drawing.Color.Gray;
            p1.BorderWidth = 1;
            p1.ID = "p" + i.ToString();
            p1.Attributes.Add("runat", "server");
            string left = (30 + i % numInRow * numPaddingX).ToString();
            p1.Style.Add(HtmlTextWriterStyle.Left, left+"px");
            string top = (100 + (i / numInRow) * numPaddingY).ToString();
            p1.Style.Add(HtmlTextWriterStyle.Top, top + "px");
            p1.Style.Add(HtmlTextWriterStyle.Position, "absolute");
            p1.Height = 220;
            p1.Width = 400;

            ImageButton imb1 = new ImageButton();
            imb1.ImageUrl = "ImagesDatabase/" + ds.Tables[0].Rows[i]["Image"];
            imb1.ID = ds.Tables[0].Rows[i]["ID"].ToString();
            imb1.Style.Add(HtmlTextWriterStyle.Top, "5px");
            imb1.Style.Add(HtmlTextWriterStyle.Left, "5px");
            imb1.Style.Add(HtmlTextWriterStyle.Position, "absolute");
            imb1.Click += new ImageClickEventHandler(imb1_Click);

            imb1.Height = 180;
            imb1.Width = 390;

            Label l1 = new Label();
            l1.Text = ds.Tables[0].Rows[i]["CarProducer"] + " " + ds.Tables[0].Rows[i]["Model"];
            l1.Style.Add(HtmlTextWriterStyle.Top, "200px");
            string left2 = (200 - l1.Text.Length*4).ToString();
            l1.Style.Add(HtmlTextWriterStyle.Left, left2 + "px");
            l1.Style.Add(HtmlTextWriterStyle.Position, "absolute");

            p1.Controls.Add(l1);
            p1.Controls.Add(imb1);

            form1.Controls.Add(p1);
        }
    }

    protected void imb1_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton imb1 = (ImageButton)(sender);
        Response.Redirect("CarPreview.aspx?id=" + imb1.ID);
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
        Response.Redirect("HomePage.aspx");
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