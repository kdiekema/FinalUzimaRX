<%@ Page Title="Trade Forum" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="trade.aspx.cs" Inherits="UzimaRX.WebForm1" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    &nbsp;&nbsp;&nbsp;
     <a class="btn btn-default" target="_blank" href="../TradeForm"> Request or Trade a Drug &raquo;</a>
    <br />
    <br />

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="TradeID" DataSourceID="SqlDataSource1" ForeColor="Black" Width="95%" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="TradeID" HeaderText="TradeID" InsertVisible="False" ReadOnly="True" SortExpression="TradeID" >
                <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
            <asp:BoundField DataField="TraderName" HeaderText="TraderName" SortExpression="TraderName" >
                <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
            <asp:CheckBoxField DataField="Have" HeaderText="Have" SortExpression="Have" >
                <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:CheckBoxField>
            <asp:CheckBoxField DataField="Need" HeaderText="Need" SortExpression="Need" >
                <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:CheckBoxField>
            <asp:BoundField DataField="DrugName" HeaderText="DrugName" SortExpression="DrugName" >
                <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" >
                <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
            <asp:BoundField DataField="TraderLocation" HeaderText="TraderLocation" SortExpression="TraderLocation" >
                <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
            <asp:BoundField DataField="ContactInformation" HeaderText="ContactInformation" SortExpression="ContactInformation" >
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [UzimaTrades]" DeleteCommand="DELETE FROM [UzimaTrades] WHERE [TradeID] = @TradeID" InsertCommand="INSERT INTO [UzimaTrades] ([TraderName], [Have], [Need], [DrugName], [Quantity], [TraderLocation], [ContactInformation]) VALUES (@TraderName, @Have, @Need, @DrugName, @Quantity, @TraderLocation, @ContactInformation)" UpdateCommand="UPDATE [UzimaTrades] SET [TraderName] = @TraderName, [Have] = @Have, [Need] = @Need, [DrugName] = @DrugName, [Quantity] = @Quantity, [TraderLocation] = @TraderLocation, [ContactInformation] = @ContactInformation WHERE [TradeID] = @TradeID">
        <DeleteParameters>
            <asp:Parameter Name="TradeID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TraderName" Type="String" />
            <asp:Parameter Name="Have" Type="Boolean" />
            <asp:Parameter Name="Need" Type="Boolean" />
            <asp:Parameter Name="DrugName" Type="String" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="TraderLocation" Type="String" />
            <asp:Parameter Name="ContactInformation" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TraderName" Type="String" />
            <asp:Parameter Name="Have" Type="Boolean" />
            <asp:Parameter Name="Need" Type="Boolean" />
            <asp:Parameter Name="DrugName" Type="String" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="TraderLocation" Type="String" />
            <asp:Parameter Name="ContactInformation" Type="String" />
            <asp:Parameter Name="TradeID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <br />

</asp:Content>



