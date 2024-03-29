﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminSide.aspx.cs" Inherits="AdminSide" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SuperGP - Admin Side</title>
    <link href="Styles/Styles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .GridViewEditRow input[type=text] {width:130px;} /* size textboxes */

        
.myButton {
    background-color:#44c767;
    border:1px solid #18ab29;
    display:inline-block;
    cursor:pointer;
    color:#ffffff;
    font-family:arial;
    font-size:17px;
    padding:16px 31px;
    text-decoration:none;
    text-shadow:0px 1px 0px #2f6627;
}
.myButton:hover {
    background-color:#5cbf2a;
}
.myButton:active {
    position:relative;
    top:1px;
}
.button1 {
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    padding: 12px 28px;
    font-size: 16px;
    background-color: #4CAF50;
}

.button1:hover {
    background-color: #4CAF50; /* Green */
    color: white;
}

.button2 {
    padding: 8px 4px;
    border-radius: 8px;
    background-color: #e7e7e7; color: black;
    width:160px;
}
.button2:hover {
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Panel ID="Panel1" runat="server" Height="69px" Style="z-index: 100; left: 0px;
            position: absolute; top: 0px" Width="100%" BackImageUrl="Images/bar-image.jpg">
            <asp:LinkButton ID="LinkButton1" runat="server" Style="z-index: 100; left: 22px;
                position: absolute; top: 23px" OnClick="LinkButton1_Click" Font-Bold="True" Font-Underline="False" ForeColor="Green">Sign Up</asp:LinkButton>
            &nbsp;&nbsp;
            <asp:Label ID="lbl_or" runat="server" ForeColor="Gray" Style="z-index: 101; left: 85px;
                position: absolute; top: 23px;" Text="or"></asp:Label>
            <asp:LinkButton ID="LinkButton2" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButton2_Click" Style="z-index: 103; left: 110px;
                position: absolute; top: 23px" EnableViewState="False">Login</asp:LinkButton>
            <asp:LinkButton ID="LinkButton3" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButton3_Click" Style="z-index: 103; left: 22px;
                position: absolute; top: 23px">Sign Out</asp:LinkButton>
            <asp:LinkButton ID="LinkButton4" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButton4_Click" Style="z-index: 103; left: 90%;
                position: absolute; top: 23px">Update User Info</asp:LinkButton>
            <asp:LinkButton ID="LinkButton8" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButton8_Click" Style="z-index: 103; left: 86.5%;
                position: absolute; top: 23px">My Cart</asp:LinkButton>
            <asp:LinkButton ID="LinkButton7" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButton7_Click" Style="z-index: 103; left: 82%;
                position: absolute; top: 23px">My Orders</asp:LinkButton>
            <asp:LinkButton ID="LinkButton5" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButton5_Click" Style="z-index: 103; left: 48%;
                position: absolute; top: 23px">Products</asp:LinkButton>
        <asp:LinkButton ID="LinkButton6" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButton6_Click" Style="z-index: 103; left: 40%;
                position: absolute; top: 23px">Home Page</asp:LinkButton>
            <asp:Label ID="lbl_signed" runat="server" ForeColor="Gray" Style="z-index: 101;
            left: 97px; position: absolute; top: 23px" Text="Welcome "></asp:Label>
        </asp:Panel>
    </div>
        <asp:GridView ID="GridView3" runat="server" OnRowDeleted="Page_Load" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" CellPadding="4" DataKeyNames="Username,Message" DataSourceID="AccessDataSource3" EnableModelValidation="True" ForeColor="#333333" GridLines="None" style="z-index: 1; left: 11px; top: 156px; position: absolute; height: 139px; width: 193px" OnRowUpdated="Page_Load">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" SortExpression="Username" />
                <asp:BoundField DataField="Message" HeaderText="Message" ReadOnly="True" SortExpression="Message" />
                <asp:BoundField DataField="Response" HeaderText="Response" SortExpression="Response" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        </asp:GridView>
        <asp:AccessDataSource ID="AccessDataSource3" runat="server" DataFile="~/App_Data/DatabaseCostumers.mdb" DeleteCommand="DELETE FROM [Messages] WHERE [Username] = ? AND [Message] = ?" InsertCommand="INSERT INTO [Messages] ([Username], [Message], [Response]) VALUES (?, ?, ?)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Messages]" UpdateCommand="UPDATE [Messages] SET [Response] = ? WHERE [Username] = ? AND [Message] = ?">
            <DeleteParameters>
                <asp:Parameter Name="original_Username" Type="String" />
                <asp:Parameter Name="original_Message" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="Message" Type="String" />
                <asp:Parameter Name="Response" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Response" Type="String" />
                <asp:Parameter Name="original_Username" Type="String" />
                <asp:Parameter Name="original_Message" Type="String" />
            </UpdateParameters>
        </asp:AccessDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" CellPadding="4" DataKeyNames="Username" DataSourceID="AccessDataSource1" EnableModelValidation="True" ForeColor="#333333" GridLines="None" style="z-index: 1; left: 7px; top: 150px; position: absolute; height: 139px; max-width:1000px">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle CssClass="GridViewEditRow" />
            <Columns>
                <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" SortExpression="Username" />
                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="Admin" HeaderText="Admin" SortExpression="Admin" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        </asp:GridView>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" ConflictDetection="CompareAllValues" DataFile="~/App_Data/DatabaseCostumers.mdb" DeleteCommand="DELETE FROM [Costumer] WHERE [Username] = ? AND (([Password] = ?) OR ([Password] IS NULL AND ? IS NULL)) AND (([FirstName] = ?) OR ([FirstName] IS NULL AND ? IS NULL)) AND (([LastName] = ?) OR ([LastName] IS NULL AND ? IS NULL)) AND (([Email] = ?) OR ([Email] IS NULL AND ? IS NULL)) AND (([ID] = ?) OR ([ID] IS NULL AND ? IS NULL)) AND (([Gender] = ?) OR ([Gender] IS NULL AND ? IS NULL)) AND (([City] = ?) OR ([City] IS NULL AND ? IS NULL)) AND (([Admin] = ?) OR ([Admin] IS NULL AND ? IS NULL))" InsertCommand="INSERT INTO [Costumer] ([Username], [Password], [FirstName], [LastName], [Email], [ID], [Gender], [City], [Admin]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Costumer]" UpdateCommand="UPDATE [Costumer] SET [Password] = ?, [FirstName] = ?, [LastName] = ?, [Email] = ?, [ID] = ?, [Gender] = ?, [City] = ?, [Admin] = ? WHERE [Username] = ? AND (([Password] = ?) OR ([Password] IS NULL AND ? IS NULL)) AND (([FirstName] = ?) OR ([FirstName] IS NULL AND ? IS NULL)) AND (([LastName] = ?) OR ([LastName] IS NULL AND ? IS NULL)) AND (([Email] = ?) OR ([Email] IS NULL AND ? IS NULL)) AND (([ID] = ?) OR ([ID] IS NULL AND ? IS NULL)) AND (([Gender] = ?) OR ([Gender] IS NULL AND ? IS NULL)) AND (([City] = ?) OR ([City] IS NULL AND ? IS NULL)) AND (([Admin] = ?) OR ([Admin] IS NULL AND ? IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Username" Type="String" />
                <asp:Parameter Name="original_Password" Type="String" />
                <asp:Parameter Name="original_Password" Type="String" />
                <asp:Parameter Name="original_FirstName" Type="String" />
                <asp:Parameter Name="original_FirstName" Type="String" />
                <asp:Parameter Name="original_LastName" Type="String" />
                <asp:Parameter Name="original_LastName" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_ID" Type="String" />
                <asp:Parameter Name="original_ID" Type="String" />
                <asp:Parameter Name="original_Gender" Type="String" />
                <asp:Parameter Name="original_Gender" Type="String" />
                <asp:Parameter Name="original_City" Type="String" />
                <asp:Parameter Name="original_City" Type="String" />
                <asp:Parameter Name="original_Admin" Type="String" />
                <asp:Parameter Name="original_Admin" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="ID" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Admin" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="ID" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Admin" Type="String" />
                <asp:Parameter Name="original_Username" Type="String" />
                <asp:Parameter Name="original_Password" Type="String" />
                <asp:Parameter Name="original_Password" Type="String" />
                <asp:Parameter Name="original_FirstName" Type="String" />
                <asp:Parameter Name="original_FirstName" Type="String" />
                <asp:Parameter Name="original_LastName" Type="String" />
                <asp:Parameter Name="original_LastName" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_ID" Type="String" />
                <asp:Parameter Name="original_ID" Type="String" />
                <asp:Parameter Name="original_Gender" Type="String" />
                <asp:Parameter Name="original_Gender" Type="String" />
                <asp:Parameter Name="original_City" Type="String" />
                <asp:Parameter Name="original_City" Type="String" />
                <asp:Parameter Name="original_Admin" Type="String" />
                <asp:Parameter Name="original_Admin" Type="String" />
            </UpdateParameters>
        </asp:AccessDataSource>

        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="AccessDataSource2" EnableModelValidation="True" ForeColor="#333333" GridLines="None" style="z-index: 1; left: 7px; top: 150px; position: absolute; height: 139px; max-width:1000px" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" InsertVisible="False" />
                <asp:BoundField DataField="CarProducer" HeaderText="CarProducer" SortExpression="CarProducer" />
                <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:BoundField DataField="InStock" HeaderText="InStock" SortExpression="InStock" />
                <asp:BoundField DataField="Details" HeaderText="Details" SortExpression="Details" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        </asp:GridView>
        <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/DatabaseCostumers.mdb" DeleteCommand="DELETE FROM [Cars] WHERE [ID] = ?" InsertCommand="INSERT INTO [Cars] ([ID], [CarProducer], [Model], [Image], [Price], [InStock], [Details]) VALUES (?, ?, ?, ?, ?, ?, ?)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Cars]" UpdateCommand="UPDATE [Cars] SET [CarProducer] = ?, [Model] = ?, [Image] = ?, [Price] = ?, [InStock] = ?, [Details] = ? WHERE [ID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="original_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ID" Type="Int32" />
                <asp:Parameter Name="CarProducer" Type="String" />
                <asp:Parameter Name="Model" Type="String" />
                <asp:Parameter Name="Image" Type="String" />
                <asp:Parameter Name="Price" Type="String" />
                <asp:Parameter Name="InStock" Type="String" />
                <asp:Parameter Name="Details" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CarProducer" Type="String" />
                <asp:Parameter Name="Model" Type="String" />
                <asp:Parameter Name="Image" Type="String" />
                <asp:Parameter Name="Price" Type="String" />
                <asp:Parameter Name="InStock" Type="String" />
                <asp:Parameter Name="Details" Type="String" />
                <asp:Parameter Name="original_ID" Type="Int32" />
            </UpdateParameters>
        </asp:AccessDataSource>
        <asp:Button ID="btn_users" CssClass="myButton" runat="server" OnClick="btn_users_Click" style="z-index: 1; left: 970px; top: 85px; position: absolute" Text="Go To Users" />
        <asp:Button ID="btn_products" CssClass="myButton" runat="server" OnClick="btn_products_Click" style="z-index: 1; left: 970px; top: 85px; position: absolute" Text="Go To Products" />
        <asp:Button ID="btn_notifications" CssClass="myButton" runat="server" OnClick="btn_notifications_Click" style="z-index: 1; left: 1170px; top: 85px; position: absolute" Text="Notifications(0)" />
        <asp:Label ID="lbl_products" runat="server" style="z-index: 1; left: 253px; top: 100px; position: absolute" Text="Products:"></asp:Label>
        <asp:Label ID="lbl_users" runat="server" style="z-index: 1; left: 253px; top: 100px; position: absolute" Text="Users:"></asp:Label>

        <asp:Button ID="btn_addproduct" CssClass="myButton" runat="server" OnClick="btn_addproduct_Click" style="z-index: 1; left: 770px; top: 85px; position: absolute" Text="Add Product" />

        <div>
            <asp:Panel ID="p1"  runat="server" Visible="false" Height="330" Width="300" BackColor="Silver" BorderColor="Gray" BorderWidth="4" Style="position: absolute; left:700px; top:150px;z-index:3">
                <asp:Label ID="lbl_carproducer" runat="server" style="left:10px;top:20px;position:absolute" Text="Car Producer:"></asp:Label>
                <asp:TextBox ID="txt_carproducer" runat="server" style="left:115px;top:20px;position:absolute"></asp:TextBox>
                <asp:Label ID="lbl_model" runat="server" style="left:35px;top:60px;position:absolute" Text="Model:"></asp:Label>
                <asp:TextBox ID="txt_model" runat="server" style="left:115px;top:60px;position:absolute"></asp:TextBox>
                <asp:Label ID="lbl_image" runat="server" style="left:35px;top:100px;position:absolute" Text="Image:"></asp:Label>
                <asp:FileUpload ID="btn_image" CssClass="button2" runat="server" style="left:115px;top:90px;position:absolute" Text="Browse"/>
                <asp:Label ID="lbl_price" runat="server" style="left:38px;top:140px;position:absolute" Text="Price:"></asp:Label>
                <asp:TextBox ID="txt_price" runat="server" style="left:115px;top:140px;position:absolute"></asp:TextBox>
                <asp:Label ID="lbl_instock" runat="server" style="left:30px;top:180px;position:absolute" Text="In Stock:"></asp:Label>
                <asp:TextBox ID="txt_instock" runat="server" style="left:115px;top:180px;position:absolute"></asp:TextBox>
                <asp:Label ID="lbl_details" runat="server" style="left:30px;top:220px;position:absolute" Text="Details:"></asp:Label>
                <asp:TextBox ID="txt_details" runat="server" style="left:115px;top:220px;position:absolute"></asp:TextBox>
                <asp:Button ID="btn_send" CssClass="button1" runat="server" style="left:20px;top:260px; position:absolute" Text="Send" OnClick="btn_send_Click" />
                <asp:Button ID="btn_cancel" CssClass="button1" runat="server" style="left:160px;top:260px; position:absolute" Text="Cancel" OnClick="btn_cancel_Click"/>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
