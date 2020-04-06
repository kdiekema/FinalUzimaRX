<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pending.aspx.cs" Inherits="UzimaRX.Pending" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataSourceID="SqlDataSource1" ForeColor="Black" DataKeyNames="ID">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" ReadOnly="True" />
                <asp:BoundField DataField="DrugName" HeaderText="DrugName" SortExpression="DrugName" />
                <asp:BoundField DataField="Dateordered" HeaderText="Dateordered" SortExpression="Dateordered" />
                <asp:BoundField DataField="Manufacturer" HeaderText="Manufacturer" SortExpression="Manufacturer" />
                <asp:BoundField DataField="ManufacturerLocation" HeaderText="ManufacturerLocation" SortExpression="ManufacturerLocation" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" ReadOnly="True" SortExpression="Quantity" />
                <asp:BoundField DataField="LocationName" HeaderText="LocationName" SortExpression="LocationName" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT UzimaInventory.ID, UzimaDrug.DrugName, UzimaInventory.Dateordered, UzimaDrug.Manufacturer, UzimaDrug.ManufacturerLocation, COUNT(UzimaInventory.DrugId) AS Quantity, UzimaLocation.LocationName
FROM UzimaInventory
JOIN UzimaDrug ON UzimaDrug.id = UzimaInventory.DrugID
JOIN UzimaLocation ON UzimaInventory.CurrentLocationID = UzimaLocation.id
JOIN UzimaStatus ON UzimaStatus.id = UzimaInventory.StatusId
WHERE UzimaStatus.id = 3
GROUP BY UzimaInventory.Id, UzimaDrug.DrugName, UzimaInventory.DateOrdered, UzimaLocation.LocationName, UzimaInventory.ExpirationDate, UzimaDrug.Manufacturer, UzimaDrug.ManufacturerLocation
ORDER BY UzimaInventory.ExpirationDate ASC" UpdateCommand="UPDATE UzimaInventory SET StatusId = 4 WHERE [ID] = @Id">         <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters></asp:SqlDataSource>
    </p>
</asp:Content>
