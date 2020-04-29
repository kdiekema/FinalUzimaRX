<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddInventory.aspx.cs" Inherits="UzimaRX.AddInventory" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>

    Search by Drug Name: <asp:TextBox ID="AddInventorySearch" runat="server"></asp:TextBox>
    <asp:Button ID="AddInventorySearchBtn" CssClass="btn btn-default" runat="server" Text="Search" OnClick="InventorySearchBtn_Click"/>
    <asp:Button ID="btnAll" runat="server" CssClass="btn btn-default" Text="Show All" OnClick="show_all_click" />
    <asp:Button ID="btnClear" runat="server" CssClass="btn btn-default" Text="Clear Search" OnClick="btn_clear_click" />

    <asp:GridView ID="AddInventoryGridView" runat="server" AllowPaging="True" PageSize="5" AllowSorting="False" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="Id" ForeColor="Black" Width="1181px" OnPageIndexChanging ="AddInventoryGridView_PageIndexChanging">
        <PagerStyle Cssclass="pages"/>
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id">
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:BoundField>
            <asp:BoundField DataField="Barcode" HeaderText="Barcode" SortExpression="Barcode">
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:BoundField>
            <asp:BoundField DataField="DrugName" HeaderText="Drug Name" SortExpression="DrugName">
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:BoundField>
            <asp:BoundField DataField="BrandName" HeaderText="Brand Name" SortExpression="BrandName">
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:BoundField>
            <asp:BoundField DataField="ApplicationNumber" HeaderText="Application Number" SortExpression="ApplicationNumber">
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:BoundField>
            <asp:BoundField DataField="Manufacturer" HeaderText="Manufacturer" SortExpression="Manufacturer">
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:BoundField>
            <asp:BoundField DataField="ManufacturerLocation" HeaderText="Manufacturer Location" SortExpression="ManufacturerLocation">
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:BoundField>
            <asp:BoundField DataField="ApprovalNumber" HeaderText="Approval Number" SortExpression="ApprovalNumber">
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:BoundField>
            <asp:BoundField DataField="Schedule" HeaderText="Schedule" SortExpression="Schedule">
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:BoundField>
            <asp:BoundField DataField="License" HeaderText="License" SortExpression="License">
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:BoundField>
            <asp:BoundField DataField="Ingredients" HeaderText="Ingredients" SortExpression="Ingredients">
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:BoundField>
            <asp:BoundField DataField="PackSize" HeaderText="PackSize" SortExpression="PackSize">
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Add to Inventory">
                <ItemTemplate>
                    <asp:Button ID="AddInventoryBtn" CssClass="btn btn-default" runat="server" OnClick="AddInventoryBtn_Click" Text="Add to Inventory" />
                </ItemTemplate>
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:TemplateField>
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


    <h3>Inventory to be ordered</h3>

    <asp:GridView ID="AddInventory2Gridview" runat="server" AllowSorting="False" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="Id" ForeColor="Black" Width="1181px">
        <Columns>

            <asp:BoundField DataField="Id" HeaderText="Drug Id" SortExpression="Id">
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:BoundField>

            <asp:BoundField DataField="DrugName" HeaderText="Drug Name" SortExpression="DrugName">
                <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
    
    Current Location :<asp:DropDownList ID="ddlSupp" runat="server" DataSourceID="SqlDataSource1" DataTextField="LocationName" DataValueField="LocationName" Height="31px">
        <asp:ListItem Selected="True" Value="None">- Select Supplier -</asp:ListItem>
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT LocationName FROM UzimaLocations"></asp:SqlDataSource>
    <br />
    
    Expiration Date (dd-mm-yyyy) :<asp:TextBox ID="txtExpire" runat="server" CssClass="form-control txtbox"></asp:TextBox> <br />
                
    Quantity : <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control txtbox"></asp:TextBox> <br />

    <asp:Button ID="AddInventory2Btn" CssClass="btn btn-default" runat="server" OnClick="AddInventory2Btn_Click" Text="Add to Inventory" />

</asp:Content>