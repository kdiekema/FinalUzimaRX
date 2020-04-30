<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UzimaRX._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />

     <div class="row" style="background-color: #808080; color:white; padding: 3px; margin: 5px; border-radius: 10px;" >
        <div class="col-md-6">
            <h2>Expired drugs</h2>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Width="95%">
                <Columns>
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT UzimaDrug.DrugName, COUNT(UzimaInventory.DrugId) AS Quantity, UzimaLocations.LocationName, UzimaInventory.ExpirationDate
FROM UzimaInventory
JOIN UzimaDrug ON UzimaDrug.id = UzimaInventory.DrugID
JOIN UzimaLocations ON UzimaInventory.CurrentLocationID = UzimaLocations.id
JOIN UzimaStatus ON UzimaStatus.id = UzimaInventory.StatusId
WHERE UzimaInventory.ExpirationDate&lt;= GETDATE() AND UzimaStatus.id = 0
GROUP BY UzimaDrug.DrugName, UzimaLocations.LocationName, UzimaInventory.ExpirationDate
ORDER BY UzimaInventory.ExpirationDate ASC
"></asp:SqlDataSource>
            <br />
            <a class="linkblue" target="_blank" href="../expired"> Complete expired drugs list</a>
            <br />
        </div>
        <div class="col-md-6">
            <h2>Expiring -&nbsp; next 60 days</h2>
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Width="95%">
                <Columns>
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT UzimaDrug.DrugName, COUNT(UzimaInventory.DrugId) AS Quantity, UzimaLocations.LocationName, UzimaInventory.ExpirationDate
FROM UzimaInventory
JOIN UzimaDrug ON UzimaDrug.id = UzimaInventory.DrugID
JOIN UzimaLocations ON UzimaInventory.CurrentLocationID = UzimaLocations.id
JOIN UzimaStatus ON UzimaStatus.id = UzimaInventory.StatusId
WHERE  (UzimaInventory.ExpirationDate BETWEEN GetDate() AND Dateadd(dd, +60, GETDATE())) AND UzimaStatus.id = 0
GROUP BY UzimaDrug.DrugName, UzimaLocations.LocationName, UzimaInventory.ExpirationDate
ORDER BY UzimaInventory.ExpirationDate ASC
                "></asp:SqlDataSource>
            <br />
          <a class="linkblue" target="_blank" href="../expiring"> Complete expriring drugs list </a>

            <br />

        </div>
    </div>
      <br />
         <br />

     <div class="row">
        <div class="col-md-4">
            <h4 class ="Gray">SquareSpace</h4>
            <p class="Gray">
                The UzimaRx Square Space was created to tell Rapula and UzimaRx&#39;s story and has functionality for customer ordering<p /> <p>
                <a class="btn btn-default" target="_blank" href="https://pilanepharm.squarespace.com">SquareSpace »</a>
            </p>
        </div>
        <div class="col-md-4">
            <h4 class="Gray">Dispensed Table</h4>
            <p class="Gray">
                This table shows drugs that have previously been dispensed 
            </p>
            <p>
                <a class="btn btn-default" target="_blank" href="../Dispensed">Go to table &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h4 class="Gray">To be destroyed table&nbsp;&nbsp;&nbsp; </h4>
            <p class="Gray">
                This table shows drugs that have expired and are waiting to be destroyed</p>
            <p>
                <a class="btn btn-default" target="_blank" href="../tbd">Go to table &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
