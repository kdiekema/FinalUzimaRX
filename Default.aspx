<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UzimaRX._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
   <div class="row">
        <div class="col-md-2">
          <a class="link" href="../dispensed"> Dispensed </a>
        </div>
        <div class="col-md-2">
          <a class="link" href="../tbd"> To be destroyed
        </div>
        <div class="col-md-2">
          <a class="link" href="../pending"> Pending   </a>
        </div>
    </div>
     <div class="row">
        <div class="col-md-6">
            <h3>Expired drugs</h3>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                <Columns>
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT UzimaDrug.DrugName, COUNT(UzimaInventory.DrugId) AS Quantity, UzimaLocation.LocationName, UzimaInventory.ExpirationDate
FROM UzimaInventory
JOIN UzimaDrug ON UzimaDrug.id = UzimaInventory.DrugID
JOIN UzimaLocation ON UzimaInventory.CurrentLocationID = UzimaLocation.id
JOIN UzimaStatus ON UzimaStatus.id = UzimaInventory.StatusId
WHERE UzimaInventory.ExpirationDate&lt;= GETDATE() AND UzimaStatus.id = 0
GROUP BY UzimaDrug.DrugName, UzimaLocation.LocationName, UzimaInventory.ExpirationDate
ORDER BY UzimaInventory.ExpirationDate ASC
"></asp:SqlDataSource>
            <br />
            <a class="link" target="_blank" href="../expired"> Complete expired drugs list</a>
        </div>
        <div class="col-md-6">
            <h3>Expiring -&nbsp; next 60 days</h3>
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                <Columns>
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT UzimaDrug.DrugName, COUNT(UzimaInventory.DrugId) AS Quantity, UzimaLocation.LocationName, UzimaInventory.ExpirationDate
FROM UzimaInventory
JOIN UzimaDrug ON UzimaDrug.id = UzimaInventory.DrugID
JOIN UzimaLocation ON UzimaInventory.CurrentLocationID = UzimaLocation.id
JOIN UzimaStatus ON UzimaStatus.id = UzimaInventory.StatusId
WHERE  (UzimaInventory.ExpirationDate BETWEEN GetDate() AND Dateadd(dd, +60, GETDATE())) AND UzimaStatus.id = 0
GROUP BY UzimaDrug.DrugName, UzimaLocation.LocationName, UzimaInventory.ExpirationDate
ORDER BY UzimaInventory.ExpirationDate ASC
                "></asp:SqlDataSource>
            <br />
          <a class="link" target="_blank" href="../expiring"> Complete expriring drugs list </a>

        </div>
    </div>

</asp:Content>
