<%@ Page Title="Inventory" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="UzimaRX.Inventory" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Current Inventory</h2>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Add Inventory" />
    </p>
    <p>
        Search by Drug Name: <asp:TextBox ID="InventorySearch" runat="server"></asp:TextBox>
        <asp:Button ID="InventorySearchBtn" runat="server" Text="Search" OnClick="InventorySearchBtn_Click"/>
        <asp:GridView ID="InventoryGridview" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="Id" ForeColor="Black" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="15" Width="95%">
            <Columns>
                <asp:BoundField DataField="DrugName" HeaderText="Drug Name" SortExpression="DrugName" />              
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                <asp:BoundField DataField="LocationName" HeaderText="Location Name" SortExpression="LocationName" />
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
    </p>
    </asp:Content>
