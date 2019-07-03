<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginPage.aspx.cs" Inherits="LoginPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>SuperGP - Login</title>
    <link href="Styles/Styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server" defaultbutton="btn_signin">
    <div>
        <asp:Label ID="lbl_Login" runat="server" Style="z-index: 100; left: 54px; position: absolute;
            top: 85px" Text="Login"></asp:Label>
        <asp:Label ID="lbl_username" runat="server" Style="z-index: 101; left: 10px; position: absolute;
            top: 113px" Text="Username:"></asp:Label>
        <asp:Label ID="lbl_password" runat="server" Style="z-index: 102; left: 10px; position: absolute;
            top: 139px" Text="Password:"></asp:Label>
        <asp:TextBox ID="txt_username" runat="server" Style="z-index: 103; left: 90px; position: absolute;
            top: 113px"></asp:TextBox>
        <asp:TextBox ID="txt_password" TextMode="Password" runat="server" Style="z-index: 104; left: 90px; position: absolute;
            top: 139px"></asp:TextBox>
        <asp:Button ID="btn_signup" runat="server" Style="z-index: 105;
            left: 113px; position: absolute; top: 171px" Text="Sign Up" OnClick="btn_signup_Click" />
        <asp:Button ID="btn_signin" runat="server" Style="z-index: 106; left: 24px; position: absolute;
            top: 170px" Text="Sign In" OnClick="btn_signin_Click" />
        <asp:Label ID="lbl_output" runat="server" Style="z-index: 108; left: 43px; position: absolute;
            top: 216px" Text=" "></asp:Label>
    
        <asp:Panel ID="Panel1" runat="server" Height="69px" Style="z-index: 100; left: 0px;
            position: absolute; top: 0px" Width="100%" BackImageUrl="Images/bar-image.jpg">
            <asp:LinkButton ID="LinkButton5" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButton5_Click" Style="z-index: 103; left: 46%;
                position: absolute; top: 23px">Products</asp:LinkButton>

            <asp:LinkButton ID="LinkButton6" runat="server" Style="z-index: 100; left: 22px;
                position: absolute; top: 23px" OnClick="LinkButton6_Click" Font-Bold="True" Font-Underline="False" ForeColor="Green">Home Page</asp:LinkButton>
            
        </asp:Panel>

    </div>
    </form>
</body>
</html>
