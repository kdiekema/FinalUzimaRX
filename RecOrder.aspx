<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RecOrder.aspx.cs" Inherits="UzimaRX.RecOrder" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <br />

    <asp:GridView ID="GridView1" runat="server" DataKeyNames="Id" AllowPaging="True" Width="95%" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataSourceID="recorders" ForeColor="Black">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id">
                    <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
            <asp:BoundField DataField="DrugName" HeaderText="DrugName" ReadOnly="True" SortExpression="DrugName" >
                    <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
            <asp:BoundField DataField="Status" HeaderText="Status" ReadOnly="True" SortExpression="Status" >
                    <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
            <asp:BoundField DataField="DateOrdered" HeaderText="DateOrdered" ReadOnly="True" SortExpression="DateOrdered" >
                    <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
            <asp:BoundField DataField="CurrentLocationId" HeaderText="CurrentLocationId" SortExpression="CurrentLocationId" >
                    <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="CurrentLocation">
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
            <asp:BoundField DataField="ExpirationDate" HeaderText="ExpirationDate" SortExpression="ExpirationDate" >
                    <ControlStyle CssClass="center" />
            <HeaderStyle CssClass="center" />
            <ItemStyle CssClass="center" />
            </asp:BoundField>
            <asp:CommandField HeaderText="ReceiveOrder" ButtonType="Button" UpdateText="Receive Order" ShowEditButton="True" >
                    <ControlStyle CssClass="center" />
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
        <SortedAscendingHeaderStyle BackColor="Gray" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <asp:SqlDataSource ID="recorders" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="Select [UzimaInventory].[Id], [DrugName], [Status], [DateOrdered], [CurrentLocationId], [ExpirationDate]From[UzimaDrug], [UzimaInventory], [UzimaStatus] Where[UzimaDrug].[Id] = [UzimaInventory].[DrugId] AND [UzimaStatus].[Id] = [UzimaInventory].[StatusId] AND [StatusID] = 2" UpdateCommand="UPDATE [UzimaInventory] SET [StatusId] = '0', [ExpirationDate] = @ExpirationDate, [CurrentLocationId] = @CurrentLocation WHERE [Id] = @original_Id" OldValuesParameterFormatString="original_{0}">
        <DeleteParameters>
              <asp:Parameter Name="original_Id" Type="String" />
          </DeleteParameters>
        <UpdateParameters>
              <asp:Parameter Name="ExpirationDate" Type="String" />
              <asp:Parameter Name="Status" Type="String" />
          </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
