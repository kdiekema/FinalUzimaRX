<%@ Page Title="Expired drugs" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Expired.aspx.cs" Inherits="UzimaRX.Expired" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="95%" AllowPaging="True" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
        <Columns>
             <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" >
                 <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
            <asp:BoundField DataField="DrugName" HeaderText="DrugName" SortExpression="DrugName" >
                <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" ReadOnly="True" SortExpression="Quantity" >
                <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
            <asp:BoundField DataField="LocationName" HeaderText="LocationName" SortExpression="LocationName" >
                <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
            <asp:BoundField DataField="ExpirationDate" HeaderText="ExpirationDate" SortExpression="ExpirationDate" >
                <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
             <asp:CommandField ShowEditButton="True" HeaderText ="Destroy" EditText="Destroy Drug"  >
                <ControlStyle CssClass="center" />
                                    <ControlStyle ForeColor ="MediumBlue" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT UzimaInventory.Id, UzimaDrug.DrugName, COUNT(UzimaInventory.DrugId) AS Quantity, UzimaLocation.LocationName, UzimaInventory.ExpirationDate
FROM UzimaInventory
JOIN UzimaDrug ON UzimaDrug.id = UzimaInventory.DrugID
JOIN UzimaLocation ON UzimaInventory.CurrentLocationID = UzimaLocation.id
JOIN UzimaStatus ON UzimaStatus.id = UzimaInventory.StatusId
WHERE UzimaInventory.ExpirationDate&lt;= GETDATE() AND UzimaStatus.id = 0
GROUP BY UzimaInventory.Id, UzimaDrug.DrugName, UzimaLocation.LocationName, UzimaInventory.ExpirationDate
ORDER BY UzimaInventory.ExpirationDate ASC" UpdateCommand="UPDATE [UzimaInventory] SET [StatusId] = 4 WHERE [Id] = @Id">
         <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
</asp:SqlDataSource>
    <br />


</asp:Content>
