<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="HomePage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>SuperGP</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="Styles/Styles.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-color:White">
    <form id="form1" runat="server">
        
        <asp:Panel ID="pnl_slider" runat="server" style="margin: auto; width: 65%;">
        <div id="slider" class="container" style="position: absolute; top: 69px;">
  <div id="myCarousel" class="carousel slide" data-ride`="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">

      <div class="item active">
        <img src="images/lambo2.jpg" alt="Lamborghini Gallardo" style="width:100%">
        <div class="carousel-caption">
          <h3>Lamborghini Gallardo</h3>
          <p>The brand new Lamborghini Gallardo 2014</p>
        </div>
      </div>

      <div class="item">
        <img src="images/ferrari1.jpg" alt="Ferrari California" style="width:100%;">
        <div class="carousel-caption">
          <h3>Ferrari California</h3>
          <p>2013 Collection</p>
        </div>
      </div>
    
      <div class="item">
        <img src="images/porsche.jpg" alt="Porsche 911" style="width:100%;">
        <div class="carousel-caption">
          <h3>Porsche 911</h3>
          <p>The Gem of the Porsche Industry</p>
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
            </asp:Panel>



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
            <asp:LinkButton ID="LinkButton7" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButton7_Click" Style="z-index: 103; left: 82%;
                position: absolute; top: 23px">My Orders</asp:LinkButton>
            <asp:LinkButton ID="LinkButton8" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButton8_Click" Style="z-index: 103; left: 77%;
                position: absolute; top: 23px">Admin Side</asp:LinkButton>
            <asp:LinkButton ID="LinkButton5" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButton5_Click" Style="z-index: 103;margin: auto; left: 46%;
                position:inherit; top: 23px">Products</asp:LinkButton>
            <asp:Label ID="lbl_signed" runat="server" ForeColor="Gray" Style="z-index: 101;
            left: 97px; position: absolute; top: 23px" Text="Welcome "></asp:Label>

            <asp:HiddenField ID="txt_1" runat="server" Value="" OnValueChanged="txt_1_TextChanged"></asp:HiddenField>
            <asp:LinkButton ID="LinkButtonMessage" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButtonMessage_Click" Style="z-index: 103; left: 275px;
                position: absolute; top: 23px">Message Admins</asp:LinkButton>
            <script type="text/javascript">
                function storeUserInput(value) {
                    document.getElementById("<%=txt_1.ClientID%>").value = value;
                    __doPostBack("txt_1", "TextChanged");
                }
            </script>
            
            <asp:LinkButton ID="LinkButtonMyMessages" runat="server" Font-Bold="True" Font-Underline="False"
                ForeColor="Green" OnClick="LinkButtonMyMessages_Click" Style="z-index: 103; left: 410px;
                position: absolute; top: 23px">My Messages</asp:LinkButton>

        </asp:Panel>
    
    </div>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" EnableModelValidation="True"  style="z-index: 1; left: 11px; top: 156px; position: absolute; height: 139px; width: 193px" Visible="False" DataKeyNames="TicketID" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="Message" HeaderText="Message" SortExpression="Message" />
                <asp:BoundField DataField="Response" HeaderText="Response" SortExpression="Response" />
                <asp:BoundField DataField="TicketID" HeaderText="TicketID" InsertVisible="False" ReadOnly="True" SortExpression="TicketID" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        </asp:GridView>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/DatabaseCostumers.mdb" SelectCommand="SELECT [Message], [Response], [TicketID] FROM [Messages] WHERE ([Username] = ?)" DeleteCommand="DELETE FROM [Messages] WHERE [TicketID] = ?" InsertCommand="INSERT INTO [Messages] ([Message], [Response], [TicketID]) VALUES (?, ?, ?)" UpdateCommand="UPDATE [Messages] SET [Message] = ?, [Response] = ? WHERE [TicketID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="TicketID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Message" Type="String" />
                <asp:Parameter Name="Response" Type="String" />
                <asp:Parameter Name="TicketID" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="Username" SessionField="username" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Message" Type="String" />
                <asp:Parameter Name="Response" Type="String" />
                <asp:Parameter Name="TicketID" Type="Int32" />
            </UpdateParameters>
        </asp:AccessDataSource>

    </form>
</body>
</html>
