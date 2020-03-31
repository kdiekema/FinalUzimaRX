<%@ Page Title="Inventory" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="UzimaRX.Inventory" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <h3>Your application description page.</h3>
    <p>Use this area to provide additional information.</p>
</asp:Content>
    <h2>Current Inventory</h2>
    <p>&nbsp;</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="Id" DataSourceID="CapstoneDB" ForeColor="Black" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="15" Width="95%">
            <Columns>
                <asp:BoundField DataField="DrugId" HeaderText="DrugId" SortExpression="DrugId" />              
                <asp:BoundField DataField="StatusId" HeaderText="StatusId" SortExpression="StatusId" />
                <asp:BoundField DataField="CurrentLocationId" HeaderText="CurrentLocationId" SortExpression="CurrentLocationId" />
                <asp:BoundField DataField="LastModifiedBy" HeaderText="LastModifiedBy" SortExpression="LastModifiedBy" />
                <asp:BoundField DataField="DateOrdered" DataFormatString="{0:dd/MM/yyyy}" HeaderText="DateOrdered" SortExpression="DateOrdered" />
                <asp:BoundField DataField="ExpirationDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="ExpirationDate" SortExpression="ExpirationDate" />
            </Columns>
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
        <asp:SqlDataSource ID="CapstoneDB" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [UzimaInventory]"></asp:SqlDataSource>
    </p>
    </asp:Content>
