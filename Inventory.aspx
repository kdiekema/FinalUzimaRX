<%@ Page Title="Inventory" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="UzimaRX.Inventory" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Current Inventory</h2>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Add Inventory" />
    </p>
    <p>
        Search by Drug Name: <asp:TextBox ID="InventorySearch" runat="server"></asp:TextBox>
        <asp:Button ID="InventorySearchBtn" runat="server" Text="Search" OnClick="InventorySearchBtn_Click"/>
        <asp:GridView ID="InventoryGridview" runat="server" AllowPaging="True" AllowSorting="False" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="Id" ForeColor="Black" OnSelectedIndexChanged="InventoryGridview_SelectedIndexChanged" PageSize="15" Width="95%" NavigateUrl="Dispense.aspx?Id={0}&Name={1}&ExpirationDate={2}">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Inventory ID" Visible="false" />
                <asp:BoundField DataField="DrugName" HeaderText="Drug Name" SortExpression="DrugName" />              
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                <asp:BoundField DataField="LocationName" HeaderText="Location Name" SortExpression="LocationName" />
                <asp:BoundField DataField="DateOrdered" HeaderText="Date Ordered" DataFormatString="{0:dd/MM/yyyy}" SortExpression="DateOrdered" />
                <asp:BoundField DataField="ExpirationDate" HeaderText="Expiration Date" DataFormatString="{0:dd/MM/yyyy}" SortExpression="ExpirationDate" />
                <asp:HyperLinkField Text="Dispense" DataNavigateURLFields="Id" DataNavigateUrlFormatString="~\Dispense.aspx?Id={0}" target="_blank"/>
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
    </p>
    </asp:Content>
