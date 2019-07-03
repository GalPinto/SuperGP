<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserInfo.aspx.cs" Inherits="UserInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SuperGP - User Info</title>
    <link href="Styles/Styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 449px">
        <asp:Label ID="lbl_firstname" runat="server" Style="z-index: 100; left: 18px; position: absolute;
            top: 170px" Text="First Name:"></asp:Label>
        <asp:Label ID="lbl_lastname" runat="server" Style="z-index: 101; left: 17px; position: absolute;
            top: 205px" Text="Last Name:"></asp:Label>
        <asp:Label ID="lbl_register" runat="server" Style="z-index: 102; left: 87px; position: absolute;
            top: 90px" Text="Update User Info"></asp:Label>
        <asp:TextBox ID="txt_firstname" runat="server" Style="z-index: 103; left: 104px;
            position: absolute; top: 170px"></asp:TextBox>
        <asp:TextBox ID="txt_lastname" runat="server" Style="z-index: 104; left: 104px; position: absolute;
            top: 204px"></asp:TextBox>
        <asp:Label ID="lbl_email" runat="server" Style="z-index: 105; left: 16px; position: absolute;
            top: 237px; height: 16px;" Text="Email:"></asp:Label>
        <asp:Label ID="txb_id" runat="server" Style="z-index: 106; left: 16px; position: absolute;
            top: 271px" Text="ID Number:"></asp:Label>
        <asp:TextBox ID="txt_email" runat="server" Style="z-index: 107; left: 104px; position: absolute;
            top: 236px"></asp:TextBox>
        <asp:TextBox ID="txt_id" runat="server" Style="z-index: 108;
            left: 104px; position: absolute; top: 271px"></asp:TextBox>
    
    
        <asp:RadioButtonList ID="rdo_gender" runat="server" Style="z-index: 109; left: 105px;
            position: absolute; top: 306px">
            <asp:ListItem>Male</asp:ListItem>
            <asp:ListItem>Female</asp:ListItem>
        </asp:RadioButtonList>
        <asp:Label ID="lbl_gender" runat="server" Style="z-index: 110; left: 17px; position: absolute;
            top: 307px" Text="Gender:"></asp:Label>
        &nbsp;
        <asp:DropDownList ID="ddl_city" runat="server" Style="z-index: 111; left: 105px;
            position: absolute; top: 373px">
            <asp:ListItem>Ashdod</asp:ListItem>
            <asp:ListItem>Tel Aviv</asp:ListItem>
            <asp:ListItem>Haifa</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="lbl_city" runat="server" Style="z-index: 112; left: 17px; position: absolute;
            top: 376px" Text="City:"></asp:Label>
        <asp:Label ID="lbl_password" runat="server" Style="z-index: 115; left: 20px; position: absolute;
            top: 137px" Text="Password:"></asp:Label>
        <asp:TextBox ID="txt_password" runat="server" Style="z-index: 116;
            left: 105px; position: absolute; top: 137px"></asp:TextBox>
        <asp:Button  ID="btn_submit" runat="server" Style="z-index: 117;
            left: 110px; position: absolute; top: 409px" Text="Update" OnClick="btn_submit_Click" />
        <asp:Label ID="lbl_message" runat="server" Style="z-index: 119; left: 39px; position: absolute;
            top: 451px" Text="Message"></asp:Label>


        <asp:Panel ID="Panel1" runat="server" Height="69px" Style="z-index: 100; left: 0px;
            position: absolute; top: 0px" Width="100%" BackImageUrl="Images/bar-image.jpg">
            <asp:LinkButton ID="LinkButton3" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButton3_Click" Style="z-index: 103; left: 122px;
                position: absolute; top: 23px">Sign Out</asp:LinkButton>
            <asp:LinkButton ID="LinkButton5" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButton5_Click" Style="z-index: 103; left: 625px;
                position: absolute; top: 23px">Products</asp:LinkButton>

            <asp:LinkButton ID="LinkButton6" runat="server" Style="z-index: 100; left: 22px;
                position: absolute; top: 23px" OnClick="LinkButton6_Click" Font-Bold="True" Font-Underline="False" ForeColor="Green">Home Page</asp:LinkButton>

            <asp:LinkButton ID="LinkButton8" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButton8_Click" Style="z-index: 103; left: 1107px;
                position: absolute; top: 23px">My Cart</asp:LinkButton>
            <asp:LinkButton ID="LinkButton7" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButton7_Click" Style="z-index: 103; left: 1000px;
                position: absolute; top: 23px">My Orders</asp:LinkButton>
            <asp:LinkButton ID="LinkButton9" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButton9_Click" Style="z-index: 103; left: 900px;
                position: absolute; top: 23px">Admin Side</asp:LinkButton>

            <asp:HiddenField ID="txt_1" runat="server" Value="" OnValueChanged="txt_1_TextChanged"></asp:HiddenField>
            <asp:LinkButton ID="LinkButtonMessage" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButtonMessage_Click" Style="z-index: 103; left: 325px;
                position: absolute; top: 23px">Message Admins</asp:LinkButton>
            <script type="text/javascript">
                function storeUserInput(value) {
                    document.getElementById("<%=txt_1.ClientID%>").value = value;
                    __doPostBack("txt_1", "TextChanged");
                }
            </script>
        </asp:Panel>
        </div>
    </form>
</body>
</html>
