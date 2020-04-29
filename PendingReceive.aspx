<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PendingReceive.aspx.cs" Inherits="UzimaRX.PendingReceive" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br /><br />
    <p>

        <asp:GridView ID="GridView1" width=95% runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataSourceID="SqlDataSource1" ForeColor="Black">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="DrugName" HeaderText="DrugName" SortExpression="DrugName" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                <asp:BoundField DataField="DateOrdered" HeaderText="DateOrdered" SortExpression="DateOrdered" />
                <asp:BoundField DataField="CurrentLocationId" HeaderText="CurrentLocationId" SortExpression="CurrentLocationId" />
                <asp:BoundField DataField="ExpirationDate" HeaderText="ExpirationDate" SortExpression="ExpirationDate" />
            <asp:HyperLinkField Text="Recieve" ItemStyle-CssClass="center" DataNavigateURLFields="Id" DataNavigateUrlFormatString="~\Receive.aspx?Id={0}" target="_blank" />

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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="Select [UzimaInventory].[Id], [DrugName], [Status], [DateOrdered], [CurrentLocationId], [ExpirationDate] From[UzimaDrug], [UzimaInventory], [UzimaStatus] Where[UzimaDrug].[Id] = [UzimaInventory].[DrugId] AND [UzimaStatus].[Id] = [UzimaInventory].[StatusId] AND [StatusID] = 2"></asp:SqlDataSource>

    </p>
    <p>

    </p>
</asp:Content>

