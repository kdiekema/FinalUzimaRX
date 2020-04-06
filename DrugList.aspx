<%@ Page Title="Pharmaceuticals" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DrugList.aspx.cs" Inherits="UzimaRX.DurgList" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>

    Search by Drug Name: <asp:TextBox ID="DrugListSearch" runat="server"></asp:TextBox>
    <asp:Button ID="DrugListSearchBtn" runat="server" Text="Search" OnClick="InventorySearchBtn_Click"/>
    <asp:Button ID="btnAll" runat="server" Text="Show All" OnClick="show_all_click" />
    <asp:Button ID="btnClear" runat="server" Text="Clear Search" OnClick="btn_clear_click" />

    <asp:GridView ID="DrugListGridView" runat="server" AllowPaging="True" PageSize="15" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="Id" ForeColor="Black" Width="1181px">
        <Columns>
            <asp:BoundField DataField="Barcode" HeaderText="Barcode" SortExpression="Barcode" />
            <asp:BoundField DataField="DrugName" HeaderText="Drug Name" SortExpression="DrugName" />
            <asp:BoundField DataField="BrandName" HeaderText="Brand Name" SortExpression="BrandName" />
            <asp:BoundField DataField="ApplicationNumber" HeaderText="Application Number" SortExpression="ApplicationNumber" />
            <asp:BoundField DataField="Manufacturer" HeaderText="Manufacturer" SortExpression="Manufacturer" />
            <asp:BoundField DataField="ManufacturerLocation" HeaderText="Manufacturer Location" SortExpression="ManufacturerLocation" />
            <asp:BoundField DataField="ApprovalNumber" HeaderText="Approval Number" SortExpression="ApprovalNumber" />
            <asp:BoundField DataField="Schedule" HeaderText="Schedule" SortExpression="Schedule" />
            <asp:BoundField DataField="License" HeaderText="License" SortExpression="License" />
            <asp:BoundField DataField="Ingredients" HeaderText="Ingredients" SortExpression="Ingredients" />
            <asp:BoundField DataField="PackSize" HeaderText="PackSize" SortExpression="PackSize" />
            <asp:HyperLinkField Text="Order" DataNavigateURLFields="Id" DataNavigateUrlFormatString="~\PlaceOrder.aspx?Id={0}" target="_blank"/>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="Gray" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>

</asp:Content>

