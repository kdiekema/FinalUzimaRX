<%@ Page Title="Locations" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Locations.aspx.cs" Inherits="UzimaRX.Locations" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" DataKeyNames="LocationName, Address" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataSourceID="SqlDataSource1" ForeColor="Black" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="95%">
        <Columns>
            <asp:BoundField DataField="LocationName" HeaderText="LocationName" SortExpression="LocationName">
             <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
                </asp:BoundField>
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" >
                 <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
                </asp:BoundField>
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" >
                 <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
                </asp:BoundField>
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" >
                 <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
                </asp:BoundField>
            <asp:BoundField DataField="Supplier" HeaderText="Supplier" SortExpression="Supplier" >
                 <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
                </asp:BoundField>
            <asp:CommandField ShowDeleteButton="True" HeaderText="Update" ShowEditButton="True" >
                 <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
                </asp:CommandField>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [LocationName], [Address], [Phone], [Type], [Supplier] FROM [UzimaLocations]" UpdateCommand="UPDATE [UzimaLocations] SET [LocationName] = @LocationName, [Address] = @Address, [Phone] = @Phone, [Type] = @Type, [Supplier] = @Supplier WHERE [LocationName] = @original_LocationName AND [Address] = @original_Address" OldValuesParameterFormatString="original_{0}" DeleteCommand="DELETE FROM [UzimaLocations] where [LocationName] = @original_LocationName AND [Address] = @original_Address">
         <DeleteParameters>
              <asp:Parameter Name="original_LocationName" Type="String" />
              <asp:Parameter Name="original_Address" Type="String" />
          </DeleteParameters>
         <UpdateParameters>
              <asp:Parameter Name="LocationName" Type="String" />
              <asp:Parameter Name="Address" Type="String" />
              <asp:Parameter Name="Phone" Type="String" />
              <asp:Parameter Name="Type" Type="String" />
              <asp:Parameter Name="Supplier" Type="String" />
          </UpdateParameters>
    </asp:SqlDataSource>
    <asp:Button ID="DownloadLocations" runat="server" Text="Download Locations" OnClick="DownloadLocations_Click" />
    <br />


      <asp:Button CssClass="btn btn-default" ID="btn_Clinic" runat="server" Text="Add Clinic" OnClick="BtnClinic" />
    <asp:Button CssClass="btn btn-default" ID="btn_Hospital" runat="server" Text="Add Hospital" OnClick="BtnHospital" />
    <asp:Button CssClass="btn btn-default" ID="btn_Supplier" runat="server" Text="Add Supplier" OnClick="BtnSupplier" />
</asp:Content>
