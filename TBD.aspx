<%@ Page Title="To Be Destroyed" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TBD.aspx.cs" Inherits="UzimaRX.TBD" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>&nbsp;</h2>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataSourceID="SqlDataSource1" ForeColor="Black">
            <Columns>
                 <asp:CommandField ShowEditButton="True" HeaderText ="Restore"/>
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                <asp:BoundField DataField="DrugName" HeaderText="DrugName" SortExpression="DrugName" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" ReadOnly="True" SortExpression="Quantity" />
                <asp:BoundField DataField="LocationName" HeaderText="LocationName" SortExpression="LocationName" />
                <asp:BoundField DataField="ExpirationDate" HeaderText="ExpirationDate" SortExpression="ExpirationDate" />
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
WHERE UzimaStatus.id = 4
GROUP BY UzimaInventory.Id, UzimaDrug.DrugName, UzimaLocation.LocationName, UzimaInventory.ExpirationDate
ORDER BY UzimaInventory.ExpirationDate ASC" UpdateCommand="UPDATE UzimaInventory SET StatusId = 0 WHERE [ID] = @Id">         <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters></asp:SqlDataSource>
    </p>
       

</asp:Content>
