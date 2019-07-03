using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class AdminSide : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LinkButton2.Visible = false;
        btn_notifications.Visible = true;
        btn_products.Visible = false;

        try
        {
            DataSet ds = sql_db.chkData("SELECT * FROM Messages WHERE Response=''");
            btn_notifications.Text = "Notifications(" + ds.Tables[0].Rows.Count + ")";
        }
        catch(Exception)
        {

        }

        if (!Page.IsPostBack)
        {
            LinkButton3.Visible = false;
            lbl_signed.Visible = false;
            LinkButton4.Visible = false;

            btn_addproduct.Visible = false;
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

                    GridView2.Visible = false;
                    lbl_products.Visible = false;
                    btn_users.Visible = false;
                    btn_products.Visible = true;
                }
            }
            catch (Exception)
            {
                Response.Redirect("LoginPage.aspx");
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

    protected void btn_products_Click(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        lbl_users.Visible = false;
        btn_users.Visible = true;

        GridView2.Visible = true;
        lbl_products.Visible = true;
        btn_addproduct.Visible = true;
        btn_products.Visible = false;
    }

    protected void btn_users_Click(object sender, EventArgs e)
    {
        GridView1.Visible = true;
        lbl_users.Visible = true;
        btn_users.Visible = false;

        GridView2.Visible = false;
        lbl_products.Visible = false;
        btn_addproduct.Visible = false;
        btn_products.Visible = true;

        btn_products.Style.Add(HtmlTextWriterStyle.Left, "970px");
    }

    protected void btn_notifications_Click(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        lbl_users.Visible = false;
        btn_users.Visible = true;

        GridView2.Visible = false;
        lbl_products.Visible = false;
        btn_addproduct.Visible = false;
        btn_products.Visible = true;
        btn_products.Style.Add(HtmlTextWriterStyle.Left, "1170px");

        btn_notifications.Visible = false;

    }

    protected void btn_addproduct_Click(object sender, EventArgs e)
    {
        p1.Visible = true;
    }

    protected void btn_cancel_Click(object sender, EventArgs e)
    {
        p1.Visible = false;
    }


    protected void btn_send_Click(object sender, EventArgs e)
    {
        
        string uploadFolder = Request.PhysicalApplicationPath + "ImagesDatabase//";
        if (btn_image.HasFile)
        {
            string extension = Path.GetExtension(btn_image.PostedFile.FileName);
            sql_db.udi("INSERT INTO Cars ([CarProducer],Model,Price,InStock,Details) VALUES('" + txt_carproducer.Text + "','" + txt_model.Text + "','$" + txt_price.Text + "','" + txt_instock.Text + "','" + txt_details.Text + "')");
            DataSet ds = sql_db.chkData("SELECT * FROM Cars WHERE [CarProducer]='" + txt_carproducer.Text + "' AND Model='" + txt_model.Text + "'");
            string id = ds.Tables[0].Rows[0]["ID"].ToString();
            sql_db.udi("UPDATE Cars SET Cars.Image='" + id + extension + "' WHERE Cars.ID=" + id);
            btn_image.SaveAs(uploadFolder + id + extension);

            string scriptSuccess = "<script language='javascript'>alert('Successfully uploaded product.')" + "</script>";
            Page.RegisterStartupScript("JavaScript", scriptSuccess);

            GridView2.DataBind();
        }
        else
        {
            string scriptSuccess = "<script language='javascript'>alert('Select an image first.')" + "</script>";
            Page.RegisterStartupScript("JavaScript", scriptSuccess);
        }
    }
}