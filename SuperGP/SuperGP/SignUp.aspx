<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="SignUp.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>SuperGP - Sign Up</title>
    <link href="Styles/Styles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            width: 1437px;
            height: 926px;
        }
    </style>
</head>
<body style="background-image:url('Images/8.jpg');background-size:contain">
    <form id="form1" runat="server">
    <div style="height: 814px; margin-left: 0px;">
        <asp:Label ID="lbl_firstname" runat="server" Style="z-index: 100; left: 18px; position: absolute;
            top: 170px" Text="First Name:" Font-Size="Large"></asp:Label>
        <asp:Label ID="lbl_lastname" runat="server" Style="z-index: 101; left: 17px; position: absolute;
            top: 205px" Text="Last Name:" Font-Size="Large"></asp:Label>
        <asp:Label ID="lbl_register" runat="server" Style="z-index: 102; left: 87px; position: absolute;
            top: 76px" Text="Register" Font-Size="Large" ForeColor="#003300"></asp:Label>
        <asp:TextBox ID="txt_firstname" runat="server" Style="z-index: 116;
            left: 138px; position: absolute; top: 175px"></asp:TextBox>
        <asp:TextBox ID="txt_lastname" runat="server" Style="z-index: 104; left: 137px; position: absolute;
            top: 207px"></asp:TextBox>
        <asp:Label ID="lbl_email" runat="server" Style="z-index: 105; left: 16px; position: absolute;
            top: 237px; height: 16px;" Text="Email:" Font-Size="Large"></asp:Label>
        <asp:Label ID="txb_id" runat="server" Style="z-index: 106; left: 16px; position: absolute;
            top: 271px" Text="ID Number:" Font-Size="Large"></asp:Label>
        <asp:TextBox ID="txt_email" runat="server" Style="z-index: 107; left: 138px; position: absolute;
            top: 236px"></asp:TextBox>
    
    
        <asp:RadioButtonList ID="rdo_gender" runat="server" Style="z-index: 109; left: 105px;
            position: absolute; top: 306px" Font-Size="Large">
            <asp:ListItem>Male</asp:ListItem>
            <asp:ListItem>Female</asp:ListItem>
        </asp:RadioButtonList>
        <asp:Label ID="lbl_gender" runat="server" Style="z-index: 110; left: 17px; position: absolute;
            top: 307px" Text="Gender:" Font-Size="Large"></asp:Label>
        &nbsp;
        <asp:Label ID="lbl_city" runat="server" Style="z-index: 112; left: 34px; position: absolute;
            top: 385px" Text="City:" Font-Size="Large"></asp:Label>
        <asp:Label ID="lbl_username" runat="server" Style="z-index: 113; left: 20px; position: absolute;
            top: 105px; height: 20px;" Text="Username:" Font-Size="Large"></asp:Label>
        <asp:Label ID="lbl_password" runat="server" Style="z-index: 115; left: 20px; position: absolute;
            top: 137px; height: 20px;" Text="Password:" Font-Size="Large"></asp:Label>
        <asp:TextBox ID="txt_password" runat="server" Style="z-index: 116;
            left: 138px; position: absolute; top: 141px" ></asp:TextBox>
        <asp:Label ID="lbl_message" runat="server" Style="z-index: 119; left: 37px; position: absolute;
            top: 516px" Text="Message" Font-Size="Large"></asp:Label>
        <asp:Label ID="lbl_signin" runat="server" Style="z-index: 113; left: 29px; position: absolute;
            top: 415px; right: 758px; margin-top: 5px; height: 27px;" Text="Have an account?" Font-Size="Large"></asp:Label>

        <asp:Panel ID="Panel1" runat="server" Height="69px" Style="z-index: 100; left: 0px;
            position: absolute; top: 0px" Width="100%" BackImageUrl="Images/bar-image.jpg">

            <asp:LinkButton ID="LinkButton5" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButton5_Click" Style="z-index: 103; left: 625px;
                position: absolute; top: 23px">Products</asp:LinkButton>
            <asp:LinkButton ID="LinkButton6" runat="server" Style="z-index: 100; left: 22px;
                position: absolute; top: 23px" OnClick="LinkButton6_Click" Font-Bold="True" Font-Underline="False" ForeColor="Green">Home Page</asp:LinkButton>
            
        </asp:Panel>
        <asp:TextBox ID="txt_username" runat="server" Style="z-index: 114; left: 138px; position: absolute;
            top: 109px"></asp:TextBox>
        <asp:Button  ID="btn_signin" runat="server" Style="z-index: 117;
            left: 204px; position: absolute; top: 416px" Text="Sign In" OnClick="btn_signin_Click" Font-Size="Medium" />
        <asp:TextBox ID="txt_id" runat="server" Style="z-index: 108;
            left: 137px; position: absolute; top: 267px"></asp:TextBox>
    
    
        <asp:Button  ID="btn_submit" runat="server" Style="z-index: 117;
            left: 77px; position: absolute; top: 463px; width: 90px; margin-top: 0px;" Text="Submit" OnClick="btn_submit_Click" Font-Size="Large" />
    
    
        <asp:DropDownList ID="ddl_city" runat="server" Style="z-index: 111; left: 96px;
            position: absolute; top: 385px; height: 30px; width: 90px;" Font-Size="Medium">
            <asp:ListItem>Ashdod</asp:ListItem>
            <asp:ListItem>Tel Aviv</asp:ListItem>
            <asp:ListItem>Haifa</asp:ListItem>
        </asp:DropDownList>
    
    </div>
    </form>
</body>
</html>
