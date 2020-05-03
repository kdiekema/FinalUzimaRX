<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Receive.aspx.cs" Inherits="UzimaRX.Receive" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<br /><br />
    <p>

        <asp:GridView ID="GridView1" runat="server" width="95%" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>

</p>
    <br />
    <div>
        <asp:Label ID="LblLocation" runat="server" Text="Current Location:"></asp:Label>
        <asp:DropDownList ID="ddlLocation" runat="server" DataSourceID="SqlDataSource1" DataTextField="LocationName" DataValueField="Id">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Id], [LocationName] FROM [UzimaLocations]"></asp:SqlDataSource>
   
    </div>
    <br />
    <div>
        <asp:Label ID="LblExpire" runat="server" Text="Expiration Date:"></asp:Label>
                <asp:TextBox ID="tbExpirationDate"  runat="server"></asp:TextBox>
    </div>
<br />
    <div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" class="btn btn-default" Text="Recieve" />
</div>
</asp:Content>
