<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TradeForm.aspx.cs" Inherits="UzimaRX.TradeForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h3>Post a drug to trade or Request a drug you need</h3>

    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="TradeID" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="50px" Width="80%" AutoGenerateInsertButton="True">
        <Fields>
            <asp:BoundField DataField="TradeID" HeaderText="TradeID" InsertVisible="False" ReadOnly="True" SortExpression="TradeID" />
            <asp:BoundField DataField="TraderName" HeaderText="TraderName" SortExpression="TraderName" />
            <asp:CheckBoxField DataField="Have" HeaderText="Have" SortExpression="Have" />
            <asp:CheckBoxField DataField="Need" HeaderText="Need" SortExpression="Need" />
            <asp:BoundField DataField="DrugName" HeaderText="DrugName" SortExpression="DrugName" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            <asp:BoundField DataField="TraderLocation" HeaderText="TraderLocation" SortExpression="TraderLocation" />
            <asp:BoundField DataField="ContactInformation" HeaderText="ContactInformation" SortExpression="ContactInformation" />
        </Fields>
    </asp:DetailsView>
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

</asp:Content>
