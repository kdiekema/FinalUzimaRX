<%@ Page Title="Receive Order" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReceiveOrder.aspx.cs" Inherits="UzimaRX.ReceiveOrder" EnableEventValidation="false"%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Orders just Received</h2>

    <asp:GridView ID="ReceiveOrderGridview" runat="server" AllowPaging="true" AllowSorting="False" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="Id" ForeColor="Black" PageSize="15" Width="95%">
        <Columns>
                <asp:BoundField DataField="Id" HeaderText="Inventory ID" />
                <asp:BoundField DataField="DrugName" HeaderText="Drug Name" SortExpression="DrugName" />              
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                <asp:BoundField DataField="DateOrdered" HeaderText="Date Ordered" DataFormatString="{0:dd/MM/yyyy}" SortExpression="DateOrdered" />
                <asp:TemplateField HeaderText="Receive Order">
                    <ItemTemplate>
                        <asp:Button Id="ReceiveOrderBtn" runat="server" OnClick="ReceiveOrderBtn_Click" Text="Receive Order" />
                    </ItemTemplate>
                </asp:TemplateField>
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
</asp:Content>
