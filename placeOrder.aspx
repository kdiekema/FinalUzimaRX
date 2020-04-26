<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlaceOrder.aspx.cs" Inherits="UzimaRX.PlaceOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Place Order</title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Order an Item</h1>
        <div>
            <asp:GridView ID="PlaceOrderGridview" runat="server" AllowPaging="true" OnPageIndexChanging="PlaceOrderGridview_PageIndexChanging" PageSize="15" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                <Columns>
                    <asp:BoundField DataField="Barcode" HeaderText="Barcode" SortExpression="Barcode" >
                        <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
                    <asp:BoundField DataField="DrugName" HeaderText="DrugName" SortExpression="DrugName" >
                        <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
                    <asp:BoundField DataField="BrandName" HeaderText="BrandName" SortExpression="BrandName" >
                        <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
                    <asp:BoundField DataField="ApplicationNumber" HeaderText="ApplicationNumber" SortExpression="ApplicationNumber" >
                        <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
                    <asp:BoundField DataField="Manufacturer" HeaderText="Manufacturer" SortExpression="Manufacturer" >
                        <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
                    <asp:BoundField DataField="ManufacturerLocation" HeaderText="ManufacturerLocation" SortExpression="ManufacturerLocation" >
                        <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
                    <asp:BoundField DataField="ApprovalNumber" HeaderText="ApprovalNumber" SortExpression="ApprovalNumber" >
                        <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
                    <asp:BoundField DataField="Schedule" HeaderText="Schedule" SortExpression="Schedule" >
                        <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
                    <asp:BoundField DataField="License" HeaderText="License" SortExpression="License" >
                        <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
                    <asp:BoundField DataField="Ingredients" HeaderText="Ingredients" SortExpression="Ingredients" >
                        <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
                    <asp:BoundField DataField="PackSize" HeaderText="PackSize" SortExpression="PackSize" >
                        <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
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

            Order Quantity <asp:TextBox ID="OrderQuantity" runat="server"></asp:TextBox>
            <asp:Button ID="OrderBtn" runat="server" Text="Order" OnClick="OrderBtn_Click" />

        </div>
    </form>
</body>
</html>
