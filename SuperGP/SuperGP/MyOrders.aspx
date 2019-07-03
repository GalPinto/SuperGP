<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyOrders.aspx.cs" Inherits="MyOrders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SuperGP - My Orders</title>
    <link href="Styles/Styles.css" rel="stylesheet" type="text/css" />
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
            <asp:LinkButton ID="LinkButton6" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButton6_Click" Style="z-index: 103; left: 86.5%;
                position: absolute; top: 23px">My Cart</asp:LinkButton>
            <asp:LinkButton ID="LinkButton5" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButton5_Click" Style="z-index: 103; left: 48%;
                position: absolute; top: 23px">Products</asp:LinkButton>
        <asp:LinkButton ID="LinkButton7" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButton7_Click" Style="z-index: 103; left: 40%;
                position: absolute; top: 23px">Home Page</asp:LinkButton>
        <asp:LinkButton ID="LinkButton8" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButton8_Click" Style="z-index: 103; left: 82%;
                position: absolute; top: 23px">Admin Side</asp:LinkButton>
            <asp:Label ID="lbl_signed" runat="server" ForeColor="Gray" Style="z-index: 101;
            left: 97px; position: absolute; top: 23px" Text="Welcome "></asp:Label>

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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="DatabaseCostumers" EnableModelValidation="True" ForeColor="#333333" GridLines="None" OnRowDataBound="GridView1_RowDataBound" style="z-index: 1; left: 366px; top: 88px; position: absolute; height: 139px; width: 193px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Car" HeaderText="Car" SortExpression="Car" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:BoundField DataField="TotalPrice" HeaderText="TotalPrice" SortExpression="TotalPrice" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        </asp:GridView>
        <asp:AccessDataSource ID="DatabaseCostumers" runat="server" DataFile="~/App_Data/DatabaseCostumers.mdb" SelectCommand="SELECT [ID], [Car], [Quantity], [TotalPrice] FROM [Orders] WHERE ([Username] = ?)">
            <SelectParameters>
                <asp:SessionParameter Name="Username" SessionField="username" Type="String" />
            </SelectParameters>
        </asp:AccessDataSource>
    </form>
</body>
</html>
