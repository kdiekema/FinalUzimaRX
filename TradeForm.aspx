<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TradeForm.aspx.cs" Inherits="UzimaRX.TradeForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h3>Post a drug to trade or Request a drug you need</h3>

    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="TradeID" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="50px" Width="80%">
        <Fields>
            <asp:BoundField DataField="TradeID" HeaderText="TradeID" InsertVisible="False" ReadOnly="True" SortExpression="TradeID" />
            <asp:BoundField DataField="TraderName" HeaderText="Trader Name" SortExpression="TraderName" />
            <asp:CheckBoxField DataField="Have" HeaderText="Have" SortExpression="Have" />
            <asp:CheckBoxField DataField="Need" HeaderText="Need" SortExpression="Need" />
            <asp:BoundField DataField="DrugName" HeaderText="Drug Name" SortExpression="DrugName" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            <asp:BoundField DataField="TraderLocation" HeaderText="Trader Location (ex: Gaborone)" SortExpression="TraderLocation" />
            <asp:BoundField DataField="ContactInformation" HeaderText="Contact Information (phone number)" SortExpression="ContactInformation" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [UzimaTrades]"></asp:SqlDataSource>

</asp:Content>
