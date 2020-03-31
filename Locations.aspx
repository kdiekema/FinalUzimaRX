<%@ Page Title="Locations" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Locations.aspx.cs" Inherits="UzimaRX.Locations" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="Black" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="420px">
        <Columns>
            <asp:BoundField DataField="LocationName" HeaderText="LocationName" SortExpression="LocationName" />
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=uzimarx.database.windows.net;Initial Catalog=uzimarx;Persist Security Info=True;User ID=uzimarx-app;Password=tyqh34@$sdlfia3dlkfPOJ23LKUwnudfn*(t789qe*4;MultipleActiveResultSets=True;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [UzimaLocation]"></asp:SqlDataSource>
    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="LocationId" HeaderText="LocationId" SortExpression="LocationId" />
            <asp:BoundField DataField="LocationType" HeaderText="LocationType" SortExpression="LocationType" />
            <asp:BoundField DataField="Supplier" HeaderText="Supplier" SortExpression="Supplier" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [UzimaLocationType]"></asp:SqlDataSource>

    <br />

      <asp:Button ID="btn_Clinic" runat="server" Text="Add Clinic" OnClick="BtnClinic" />
    <asp:Button ID="btn_Hospital" runat="server" Text="Add Hospital" OnClick="BtnHospital" />
    <asp:Button ID="btn_Supplier" runat="server" Text="Add Supplier" OnClick="BtnSupplier" />
</asp:Content>
