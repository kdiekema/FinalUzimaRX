<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RecOrders.aspx.cs" Inherits="UzimaRX.RecOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <h1>Order an Item</h1>
        <div>
            <asp:GridView ID="RecOrderGridview" runat="server" AllowPaging="true" OnPageIndexChanging="PlaceOrderGridview_PageIndexChanging" PageSize="15" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
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

              <asp:DropDownList ID="ddlSupp" runat="server" DataSourceID="SqlDataSource1" DataTextField="LocationName" DataValueField="LocationName" Height="31px">
                             <asp:ListItem Selected="True" Value="None">- Select Supplier -</asp:ListItem>
                        </asp:DropDownList> 
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT LocationName FROM UzimaLocations"></asp:SqlDataSource>
                
            Expiration <asp:TextBox ID="RecOrder" runat="server"></asp:TextBox>
            <asp:Button ID="RecBtn" runat="server" Text="Receive Order" OnClick="RecBtn_Click" />
        </div>

</asp:Content>
