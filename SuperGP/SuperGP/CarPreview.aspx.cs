using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CarPreview : System.Web.UI.Page
{
    int stock;
    string carname;
    DataSet car;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            LinkButton3.Visible = false;
            lbl_signed.Visible = false;
            LinkButton4.Visible = false;
            p1.Visible = false;
            tabs.Visible = false;
            LinkButton7.Visible = false;
            LinkButton8.Visible = false;
            LinkButton9.Visible = false;

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
                    tabs.Visible = true;
                    labeloutput.Visible = false;
                    LinkButton7.Visible = true;
                    LinkButton8.Visible = true;

                    LinkButtonMessage.Visible = true;

                    //Check if admin
                    DataSet ds1 = sql_db.chkData("SELECT * FROM Costumer WHERE Username='" + Session["username"] + "' AND Admin='yes'");
                    if (ds1.Tables[0].Rows.Count > 0)
                        LinkButton9.Visible = true;
                }
            }
            catch (Exception)
            {

            }

            try
            {
                string itemID = Request.QueryString["id"];
                DataSet ds = sql_db.chkData("SELECT * FROM Cars WHERE ID=" + itemID);
                car = ds;

                p1.Visible = true;

                Image img1 = new Image();
                img1.ImageUrl = "ImagesDatabase/" + ds.Tables[0].Rows[0]["Image"];
                img1.ID = "img1";
                img1.Style.Add(HtmlTextWriterStyle.Top, "5px");
                img1.Style.Add(HtmlTextWriterStyle.Left, "50px");
                img1.Style.Add(HtmlTextWriterStyle.Position, "absolute");
                img1.Height = 277;
                img1.Width = 600;

                Label l1 = new Label();
                l1.Text = ds.Tables[0].Rows[0]["CarProducer"] + " " + ds.Tables[0].Rows[0]["Model"];
                l1.Style.Add(HtmlTextWriterStyle.Top, "300px");
                string left2 = (350 - l1.Text.Length * 4).ToString();
                l1.Style.Add(HtmlTextWriterStyle.Left, left2 + "px");
                l1.Style.Add(HtmlTextWriterStyle.Position, "absolute");

                Label l2 = new Label();
                l2.Text = "Price: " + ds.Tables[0].Rows[0]["Price"];
                l2.Style.Add(HtmlTextWriterStyle.Top, "350px");
                string left3 = (350 - l2.Text.Length * 4).ToString();
                l2.Style.Add(HtmlTextWriterStyle.Left, left3 + "px");
                l2.Style.Add(HtmlTextWriterStyle.Position, "absolute");

                Label lbl_details = new Label();
                lbl_details.Text = "Details:   " + ds.Tables[0].Rows[0]["Details"];
                lbl_details.Style.Add(HtmlTextWriterStyle.Top, "400px");
                string left_details = (470 - lbl_details.Text.Length * 4).ToString();
                lbl_details.Style.Add(HtmlTextWriterStyle.Left, left_details + "px");
                lbl_details.Style.Add(HtmlTextWriterStyle.Position, "absolute");

                l3.Style.Add(HtmlTextWriterStyle.Top, "70px");
                //string left4 = (350 - l3.Text.Length * 4).ToString();
                l3.Style.Add(HtmlTextWriterStyle.Left, "160px");
                l3.Style.Add(HtmlTextWriterStyle.Position, "absolute");

                if (int.Parse(ds.Tables[0].Rows[0]["InStock"].ToString()) > 0)
                {
                    stock = int.Parse(ds.Tables[0].Rows[0]["InStock"].ToString());
                    carname = ds.Tables[0].Rows[0]["CarProducer"].ToString() + " " + ds.Tables[0].Rows[0]["Model"].ToString();
                    //car = ds;
                    l3.Text = "Select Your Quantity: ";

                    tx.Style.Add(HtmlTextWriterStyle.Top, "70px");
                    tx.Style.Add(HtmlTextWriterStyle.Left, "310px");
                    tx.Style.Add(HtmlTextWriterStyle.Position, "absolute");
                    tx.Width = 30;

                    l4.Style.Add(HtmlTextWriterStyle.Top, "90px");
                    l4.Style.Add(HtmlTextWriterStyle.Left, "220px");
                    l4.Style.Add(HtmlTextWriterStyle.Position, "absolute");
                    l4.Font.Size = 7;
                    l4.Text = "(" + ds.Tables[0].Rows[0]["InStock"].ToString() + " left)";

                    btn.Style.Add(HtmlTextWriterStyle.Top, "130px");
                    btn.Text = "Add to Cart";
                    btn.Style.Add(HtmlTextWriterStyle.Left, "190px");
                    btn.Style.Add(HtmlTextWriterStyle.Position, "absolute");

                    l5.Style.Add(HtmlTextWriterStyle.Top, "170px");
                    l5.Style.Add(HtmlTextWriterStyle.Left, "160px");
                    l5.Style.Add(HtmlTextWriterStyle.Position, "absolute");
                    l5.Text = "";
                }
                else
                {
                    l3.Text = "Out of stock.";
                    l3.Style.Add(HtmlTextWriterStyle.Left, "200px");
                    tx.Visible = false;
                }


                p1.Controls.Add(l1);
                p1.Controls.Add(l2);
                p1.Controls.Add(lbl_details);
                p1.Controls.Add(img1);


                //form1.Controls.Add(p1);
            }
            catch (Exception)
            {
                labeloutput.Text = "404 Not Found";
                labeloutput.Style.Add(HtmlTextWriterStyle.Left, "300px");
            }
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
        Response.Redirect("HomePage.aspx");
    }
    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        Response.Redirect("Products.aspx");
    }

    protected void btn_Click(object sender, EventArgs e)
    {
        LinkButton3.Visible = false;
        lbl_signed.Visible = false;
        LinkButton4.Visible = false;
        p1.Visible = false;
        tabs.Visible = false;
        LinkButton7.Visible = false;
        LinkButton8.Visible = false;
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
                tabs.Visible = true;
                labeloutput.Visible = false;
                LinkButton7.Visible = true;
                LinkButton8.Visible = true;
            }
        }
        catch (Exception)
        {

        }

        try
        {
            string itemID = Request.QueryString["id"];
            DataSet ds = sql_db.chkData("SELECT * FROM Cars WHERE ID=" + itemID);
            car = ds;

            p1.Visible = true;

            Image img1 = new Image();
            img1.ImageUrl = "ImagesDatabase/" + ds.Tables[0].Rows[0]["Image"];
            img1.ID = "img1";
            img1.Style.Add(HtmlTextWriterStyle.Top, "5px");
            img1.Style.Add(HtmlTextWriterStyle.Left, "50px");
            img1.Style.Add(HtmlTextWriterStyle.Position, "absolute");
            img1.Height = 277;
            img1.Width = 600;

            Label l1 = new Label();
            l1.Text = ds.Tables[0].Rows[0]["CarProducer"] + " " + ds.Tables[0].Rows[0]["Model"];
            l1.Style.Add(HtmlTextWriterStyle.Top, "300px");
            string left2 = (350 - l1.Text.Length * 4).ToString();
            l1.Style.Add(HtmlTextWriterStyle.Left, left2 + "px");
            l1.Style.Add(HtmlTextWriterStyle.Position, "absolute");

            Label l2 = new Label();
            l2.Text = "Price: " + ds.Tables[0].Rows[0]["Price"];
            l2.Style.Add(HtmlTextWriterStyle.Top, "400px");
            string left3 = (350 - l2.Text.Length * 4).ToString();
            l2.Style.Add(HtmlTextWriterStyle.Left, left3 + "px");
            l2.Style.Add(HtmlTextWriterStyle.Position, "absolute");



            l3.Style.Add(HtmlTextWriterStyle.Top, "70px");
            //string left4 = (350 - l3.Text.Length * 4).ToString();
            l3.Style.Add(HtmlTextWriterStyle.Left, "160px");
            l3.Style.Add(HtmlTextWriterStyle.Position, "absolute");

            if (int.Parse(ds.Tables[0].Rows[0]["InStock"].ToString()) > 0)
            {
                stock = int.Parse(ds.Tables[0].Rows[0]["InStock"].ToString());
                carname = ds.Tables[0].Rows[0]["CarProducer"].ToString() + " " + ds.Tables[0].Rows[0]["Model"].ToString();
                //car = ds;
                l3.Text = "Select Your Quantity: ";

                tx.Style.Add(HtmlTextWriterStyle.Top, "70px");
                tx.Style.Add(HtmlTextWriterStyle.Left, "310px");
                tx.Style.Add(HtmlTextWriterStyle.Position, "absolute");
                tx.Width = 30;

                l4.Style.Add(HtmlTextWriterStyle.Top, "90px");
                l4.Style.Add(HtmlTextWriterStyle.Left, "220px");
                l4.Style.Add(HtmlTextWriterStyle.Position, "absolute");
                l4.Font.Size = 7;
                l4.Text = "(" + ds.Tables[0].Rows[0]["InStock"].ToString() + " left)";

                btn.Style.Add(HtmlTextWriterStyle.Top, "130px");
                btn.Text = "Add to Cart";
                btn.Style.Add(HtmlTextWriterStyle.Left, "190px");
                btn.Style.Add(HtmlTextWriterStyle.Position, "absolute");

                l5.Style.Add(HtmlTextWriterStyle.Top, "170px");
                l5.Style.Add(HtmlTextWriterStyle.Left, "160px");
                l5.Style.Add(HtmlTextWriterStyle.Position, "absolute");
                l5.Text = "";
            }
            else
            {
                l3.Text = "Out of stock.";
                l3.Style.Add(HtmlTextWriterStyle.Left, "200px");
                tx.Visible = false;
            }


            p1.Controls.Add(l1);
            p1.Controls.Add(l2);
            p1.Controls.Add(img1);


            //form1.Controls.Add(p1);
        }
        catch (Exception)
        {

        }

        try
        {
            car = sql_db.chkData("SELECT * FROM Cars WHERE ID=" + Request.QueryString["id"].ToString());
            string carname = car.Tables[0].Rows[0]["CarProducer"].ToString() + " " + car.Tables[0].Rows[0]["Model"].ToString();
            if (int.Parse(tx.Text) <= int.Parse(car.Tables[0].Rows[0]["InStock"].ToString()))
            {
                if (int.Parse(tx.Text) < 1)
                {
                    l5.Text = "Cannot buy less than 1 unit.";
                    l5.Style.Add(HtmlTextWriterStyle.Left, "150px");
                }
                else if (int.Parse(tx.Text) == 1)
                {
                    l5.Text = "Successfully added " + carname + " to Cart.";
                    l5.Style.Add(HtmlTextWriterStyle.Left, "120px");
                    string temp = (car.Tables[0].Rows[0]["Price"].ToString().Substring(1));
                    temp = temp.Replace(",", "");
                    DataSet carInCart = sql_db.chkData("SELECT * FROM Cart WHERE Car='" + carname + "' AND Username='"+Session["username"].ToString()+"'");
                    if (carInCart.Tables[0].Rows.Count > 0)
                    {
                        int num = (int.Parse(carInCart.Tables[0].Rows[0]["Quantity"].ToString()) + int.Parse(tx.Text));
                        sql_db.udi("UPDATE Cart SET Cart.Quantity='" + num + "', Cart.TotalPrice='" + int.Parse(temp) * num + "' WHERE Cart.Car='" + carname + "' AND Cart.Username='" + Session["username"].ToString() + "'");
                        sql_db.udi("UPDATE Cars SET Cars.InStock='" + (int.Parse(car.Tables[0].Rows[0]["InStock"].ToString()) - int.Parse(tx.Text)) + "' WHERE Cars.ID=" + car.Tables[0].Rows[0]["ID"].ToString());
                        l4.Text = "(" + (int.Parse(l4.Text.Substring(1).Split(' ')[0]) - int.Parse(tx.Text)) + " left)";
                    }
                    else
                    {
                        sql_db.udi("INSERT INTO Cart (Car,Quantity,TotalPrice,Username) VALUES('" + carname + "','" + int.Parse(tx.Text) + "','" + int.Parse(tx.Text) * int.Parse(temp) + "','" + Session["username"].ToString() + "')");
                        sql_db.udi("UPDATE Cars SET Cars.InStock='" + (int.Parse(car.Tables[0].Rows[0]["InStock"].ToString()) - int.Parse(tx.Text)) + "' WHERE Cars.ID=" + car.Tables[0].Rows[0]["ID"].ToString());
                        l4.Text = "(" + (int.Parse(l4.Text.Substring(1).Split(' ')[0]) - int.Parse(tx.Text)) + " left)";
                    }
                }
                else
                {
                    l5.Text = "Successfully added " + int.Parse(tx.Text) + " " + carname + " to Cart.";
                    l5.Style.Add(HtmlTextWriterStyle.Left, "115px");
                    string temp = (car.Tables[0].Rows[0]["Price"].ToString().Substring(1));
                    temp = temp.Replace(",", "");
                    DataSet carInCart = sql_db.chkData("SELECT * FROM Cart WHERE Car='" + carname + "' AND Username='" + Session["username"].ToString() + "'");
                    if (carInCart.Tables[0].Rows.Count > 0)
                    {
                        int num = (int.Parse(carInCart.Tables[0].Rows[0]["Quantity"].ToString()) + int.Parse(tx.Text));
                        //l5.Text = "UPDATE Cart SET Cart.Quantity='" + num + "' WHERE Cart.Car='" + car.Tables[0].Rows[0]["ID"].ToString() + "';";
                        sql_db.udi("UPDATE Cart SET Cart.Quantity='" + num + "', Cart.TotalPrice='" + int.Parse(temp) * num + "' WHERE Cart.Car='" + carname + "' AND Cart.Username='" + Session["username"].ToString() + "'");
                        sql_db.udi("UPDATE Cars SET Cars.InStock='" + (int.Parse(car.Tables[0].Rows[0]["InStock"].ToString()) - int.Parse(tx.Text)) + "' WHERE Cars.ID=" + car.Tables[0].Rows[0]["ID"].ToString());
                        l4.Text = "(" + (int.Parse(l4.Text.Substring(1).Split(' ')[0]) - int.Parse(tx.Text)) + " left)";
                    }
                    else
                    {
                        sql_db.udi("INSERT INTO Cart (Car,Quantity,TotalPrice,Username) VALUES('" + carname + "','" + int.Parse(tx.Text) + "','" + int.Parse(tx.Text) * int.Parse(temp) + "','"+ Session["username"].ToString() + "')");
                        sql_db.udi("UPDATE Cars SET Cars.InStock='" + (int.Parse(car.Tables[0].Rows[0]["InStock"].ToString()) - int.Parse(tx.Text)) + "' WHERE Cars.ID=" + car.Tables[0].Rows[0]["ID"].ToString());
                        l4.Text = "(" + (int.Parse(l4.Text.Substring(1).Split(' ')[0]) - int.Parse(tx.Text)) + " left)";
                    }
                }
            }
            else
            {
                l5.Text = "Not enough stock to make the purchase.";
            }
        }
        catch(Exception exc)
        {
            //l5.Text = "You have to type a valid integer number.";
            l5.Text = exc.Message;
        }
    }
    protected void LinkButton8_Click(object sender, EventArgs e)
    {
        Response.Redirect("Cart.aspx");
    }
    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        Response.Redirect("MyOrders.aspx");
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