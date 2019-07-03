<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SuperGP - My Cart</title>
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
                ForeColor="Green" OnClick="LinkButton4_Click" Style="z-index: 103; left:90%;
                position: absolute; top: 23px">Update User Info</asp:LinkButton>
            <asp:LinkButton ID="LinkButton7" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButton7_Click" Style="z-index: 103; left: 85.5%;
                position: absolute; top: 23px">My Orders</asp:LinkButton>
        <asp:LinkButton ID="LinkButton8" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButton8_Click" Style="z-index: 103; left: 81%;
                position: absolute; top: 23px">Admin Side</asp:LinkButton>
            <asp:LinkButton ID="LinkButton5" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButton5_Click" Style="z-index: 103; left: 48%;
                position: absolute; top: 23px">Products</asp:LinkButton>
        <asp:LinkButton ID="LinkButton6" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButton6_Click" Style="z-index: 103; left: 40%;
                position: absolute; top: 23px">Home Page</asp:LinkButton>
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
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" style="z-index: 1; left: 413px; top: 83px; position: absolute; height: 139px; width: 193px" AutoGenerateColumns="False" DataKeyNames="Car" DataSourceID="DatabaseCostumers" OnRowDataBound="GridView1_RowDataBound" OnRowDeleted="GridView1_RowDeleted" OnRowDeleting="GridView1_RowDeleting">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="Car" HeaderText="Car" ReadOnly="True" SortExpression="Car" />
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
        <asp:AccessDataSource ID="DatabaseCostumers" runat="server" ConflictDetection="CompareAllValues" DataFile="~/App_Data/DatabaseCostumers.mdb" DeleteCommand="DELETE FROM [Cart] WHERE [Car] = ? AND (([Quantity] = ?) OR ([Quantity] IS NULL AND ? IS NULL)) AND (([TotalPrice] = ?) OR ([TotalPrice] IS NULL AND ? IS NULL))" InsertCommand="INSERT INTO [Cart] ([Car], [Quantity], [TotalPrice]) VALUES (?, ?, ?)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Car], [Quantity], [TotalPrice] FROM [Cart] WHERE ([Username] = ?)" UpdateCommand="UPDATE [Cart] SET [Quantity] = ?, [TotalPrice] = ? WHERE [Car] = ? AND (([Quantity] = ?) OR ([Quantity] IS NULL AND ? IS NULL)) AND (([TotalPrice] = ?) OR ([TotalPrice] IS NULL AND ? IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Car" Type="String" />
                <asp:Parameter Name="original_Quantity" Type="String" />
                <asp:Parameter Name="original_Quantity" Type="String" />
                <asp:Parameter Name="original_TotalPrice" Type="String" />
                <asp:Parameter Name="original_TotalPrice" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Car" Type="String" />
                <asp:Parameter Name="Quantity" Type="String" />
                <asp:Parameter Name="TotalPrice" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="Username" SessionField="username" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Quantity" Type="String" />
                <asp:Parameter Name="TotalPrice" Type="String" />
                <asp:Parameter Name="original_Car" Type="String" />
                <asp:Parameter Name="original_Quantity" Type="String" />
                <asp:Parameter Name="original_Quantity" Type="String" />
                <asp:Parameter Name="original_TotalPrice" Type="String" />
                <asp:Parameter Name="original_TotalPrice" Type="String" />
            </UpdateParameters>
        </asp:AccessDataSource>
        <asp:Label ID="l1" runat="server" style="z-index: 1; left: 528px; top: 80px; position: absolute" Text="Your Cart is Empty" Visible="False"></asp:Label>
        <asp:Button ID="btn1" runat="server" OnClick="btn1_Click" style="z-index: 1; left: 743px; top: 240px; position: absolute" Text="Complete Purchase" Visible="False" />
        <asp:Label ID="l2" runat="server" style="z-index: 1; left: 750px; top: 200px; position: absolute" Text="" Visible="False"></asp:Label>
        <asp:Panel ID="pnl_payment" runat="server" style="z-index: 1; left: 640px; top: 287px; position: absolute; height: 196px; width: 294px" Visible="false" BackColor="Silver" BorderColor="Gray" BorderWidth="4">
            <asp:Label ID="lbl_ccnumber" runat="server" style="z-index: 1; left: 10px; top: 10px; position: absolute; height: 10px; width: 160px" Text="Credit Card Number:"></asp:Label>
            <asp:Label ID="lbl_cvv" runat="server" style="z-index: 1; left: 60px; top: 35px; position: absolute; height: 10px; width: 160px" Text="CVV:"></asp:Label>
            <asp:Label ID="lbl_exdate" runat="server" style="z-index: 1; left: 20px; top: 60px; position: absolute; height: 10px; width: 160px" Text="Expiration Date:"></asp:Label>
            <asp:Label ID="lbl_id" runat="server" style="z-index: 1; left: 70px; top: 85px; position: absolute; height: 10px; width: 160px" Text="ID:"></asp:Label>
            <asp:TextBox ID ="txt_ccnumber" runat="server" style="z-index: 1; left: 180px; top: 10px; position: absolute; height: 10px; width: 100px"></asp:TextBox>
            <asp:TextBox ID ="txt_cvv" runat="server" style="z-index: 1; left: 180px; top: 35px; position: absolute; height: 10px; width: 100px"></asp:TextBox>
            <asp:TextBox ID ="txt_exdate" runat="server" style="z-index: 1; left: 180px; top: 60px; position: absolute; height: 10px; width: 100px"></asp:TextBox>
            <asp:TextBox ID ="txt_id" runat="server" style="z-index: 1; left: 180px; top: 85px; position: absolute; height: 10px; width: 100px"></asp:TextBox>
            <asp:Button ID ="btn_payment" runat="server" style="z-index: 1; left: 20px; top: 122px; position: absolute; width:100px" Text="Submit" OnClick="btn_payment_Click"/>
            <asp:Button ID ="btn_cancel" runat="server" style="z-index: 1; left: 170px; top: 123px; position: absolute; width:100px" Text="Cancel" OnClick="btn_cancel_Click" />
            <asp:Label ID="lbl_output" runat="server" style="z-index: 1; left: 30px; top: 160px; position: absolute; height: 10px; width: 160px"></asp:Label>
        </asp:Panel>
    </form>
</body>
</html>
