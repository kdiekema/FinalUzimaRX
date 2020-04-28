<%@ Page Title="Receive Order" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReceiveOrder.aspx.cs" Inherits="UzimaRX.ReceiveOrder" EnableEventValidation="false"%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Orders just Received</h2>

    <asp:GridView ID="ReceiveOrderGridview" runat="server" OnPageIndexChanging="ReceiveOrderGridview_PageIndexChanging" AllowPaging="true" AllowSorting="False" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="Id" ForeColor="Black" PageSize="15" Width="95%">
        <Columns>
                <asp:BoundField DataField="Id" HeaderText="Inventory ID" >
                    <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
                <asp:BoundField DataField="DrugName" HeaderText="Drug Name" SortExpression="DrugName" >
                    <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" >
                    <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
                <asp:BoundField DataField="DateOrdered" HeaderText="Date Ordered" DataFormatString="{0:dd/MM/yyyy}" SortExpression="DateOrdered" >
                    <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
                <asp:TemplateField HeaderText="Current Location">
                    <ItemTemplate>
                        <asp:DropDownList ID="ddlSupp" runat="server" DataSourceID="SqlDataSource1" DataTextField="LocationName" DataValueField="LocationName" Height="31px">
                             <asp:ListItem Selected="True" Value="None">- Select Supplier -</asp:ListItem>
                        </asp:DropDownList> 
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT LocationName FROM UzimaLocations"></asp:SqlDataSource>
                    </ItemTemplate>
                    <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
                    </asp:TemplateField>
                <asp:TemplateField HeaderText="Expiration Date" >
                    <ItemTemplate>
                        <asp:TextBox ID="txtExpire" runat="server" CssClass="form-control txtbox"></asp:TextBox>
                    </ItemTemplate>
                    <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:TemplateField>
                <asp:TemplateField HeaderText="Receive Order">
                    <ItemTemplate>
                        <asp:Button Id="ReceiveOrderBtn" CssClass="btn btn-default" runat="server" OnClick="ReceiveOrderBtn_Click" Text="Receive Order" />
                    </ItemTemplate>
                    <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
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
    <asp:Button ID="ReceiveOrderDownload" runat="server" Text="Download Orders to be Received" OnClick="ReceiveOrderDownload_Click" />
</asp:Content>
