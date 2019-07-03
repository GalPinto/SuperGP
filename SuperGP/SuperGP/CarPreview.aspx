<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CarPreview.aspx.cs" Inherits="CarPreview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title>Super GP - Car Preview</title>
    <link href="Styles/Styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="Panel1" runat="server" Height="69px" Style="z-index: 100; left: 0px;
            position: absolute; top: 0px" Width="100%" BackImageUrl="Images/bar-image.jpg">
            <asp:LinkButton ID="LinkButton1" runat="server" Style="z-index: 100; left: 22px;
                position: absolute; top: 23px" OnClick="LinkButton1_Click" Font-Bold="True" Font-Underline="False" ForeColor="Green">Sign Up</asp:LinkButton>
            <asp:Label ID="lbl_or" runat="server" ForeColor="Gray" Style="z-index: 101; left: 85px;
                position: absolute; top: 23px" Text="or"></asp:Label>
            <asp:LinkButton ID="LinkButton2" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButton2_Click" Style="z-index: 103; left: 110px;
                position: absolute; top: 23px" EnableViewState="False">Login</asp:LinkButton>
            <asp:LinkButton ID="LinkButton3" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButton3_Click" Style="z-index: 103; left: 22px;
                position: absolute; top: 23px">Sign Out</asp:LinkButton>
            <asp:LinkButton ID="LinkButton4" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButton4_Click" Style="z-index: 103; left: 90%;
                position: absolute; top: 23px">Update User Info</asp:LinkButton>
            <asp:LinkButton ID="LinkButton5" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButton5_Click" Style="z-index: 103; left: 40%;
                position: absolute; top: 23px">Home Page</asp:LinkButton>
            <asp:LinkButton ID="LinkButton6" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButton6_Click" Style="z-index: 103; left: 48%;
                position: absolute; top: 23px">Products</asp:LinkButton>
            <asp:Label ID="lbl_signed" runat="server" ForeColor="Gray" Style="z-index: 101;
            left: 97px; position: absolute; top: 23px" Text="Welcome "></asp:Label>
            <asp:LinkButton ID="LinkButton8" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButton8_Click" Style="z-index: 103; left: 86.5%;
                position: absolute; top: 23px">My Cart</asp:LinkButton>
            <asp:LinkButton ID="LinkButton7" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButton7_Click" Style="z-index: 103; left: 82%;
                position: absolute; top: 23px">My Orders</asp:LinkButton>
            <asp:LinkButton ID="LinkButton9" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButton9_Click" Style="z-index: 103; left: 77%;
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
        <div>
            <asp:Panel ID="p1" runat="server" Height="800" Width="700" BackColor="Silver" BorderColor="Gray" BorderWidth="1" Style="position: absolute; left:29%; top:85px">
                <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Tabs - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#tabs" ).tabs();
  } );
  </script>
                <div id="tabs" style="position:absolute;left:80px;top:450px; height:200px;width:500px" runat="server">
  <ul>
    <li><a href="#tabs-1">Purchase</a></li>
    <li><a href="#tabs-2">Lease</a></li>
  </ul>
  <div id="tabs-1">
    <asp:Label ID="l3" runat="server"></asp:Label>
    <asp:Label ID="l4" runat="server"></asp:Label>
    <asp:TextBox ID="tx" runat="server"></asp:TextBox>
    <asp:Button ID="btn" runat="server" OnClick="btn_Click"/>
    <asp:Label ID="l5" runat="server"></asp:Label>
  </div>
  <div id="tabs-2">

  </div>
</div>
                <asp:Label id="labeloutput" style="position:absolute;left:200px;top:450px" runat="server">You have to be signed in to order this car.</asp:Label>
            </asp:Panel>
            <br />
        </div>
    </form>
</body>
</html>
