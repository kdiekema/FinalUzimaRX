<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="UzimaRX.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <h1>Maintain Roles and Users in Roles</h1>
    
    <div class="row">
        <div class="col-sm-6">
            <h2>Roles</h2>

            <asp:GridView ID="GridView1" runat="server" DataKeyNames="Name" AutoGenerateColumns="False" Width="95%" DataSourceID="GridRoles" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" AllowSorting="True">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:CommandField HeaderText="Edit Roles" ShowDeleteButton="True" ShowEditButton="True" />
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
            <asp:SqlDataSource ID="GridRoles" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Name FROM AspNetRoles WHERE (NOT (Name = 'admin'))" UpdateCommand="UPDATE [AspNetRoles] SET [Name] = @Name WHERE [Name] = @original_Name" DeleteCommand="DELETE FROM [AspNetRoles] WHERE [Name] = @original_Name" OldValuesParameterFormatString="original_{0}">
         <UpdateParameters>
              <asp:Parameter Name="Name" Type="String" />
          </UpdateParameters>
                  <DeleteParameters>
              <asp:Parameter Name="Name" Type="String" />
          </DeleteParameters>
            </asp:SqlDataSource>
            <br />
           <div class="form-group">
                <label class="control-label">Add a role:</label>
                <br />
               <asp:TextBox ID="txtRole" runat="server"></asp:TextBox>
               <br />
               <asp:Button ID="btnNewRole" runat="server" Text="Add Roles" 
                CssClass="btn btn-default" OnClick="BtnNewRole_Click" />
               </div>
        </div>

     <div class="col-sm-6">
            <h2>Add Roles to User</h2>
            <div class="form-group">
                <label class="control-label">Select a user:</label>
                <br />
                <asp:DropDownList ID="ddlUsers" runat="server" DataSourceID="Users" Width="95%" DataTextField="Username" DataValueField="Id"></asp:DropDownList>
                <asp:SqlDataSource ID="Users" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [AspNetUsers]"></asp:SqlDataSource>
                </div>
         <div class="form-group">
                <label class="control-label">Change User Role:</label>
             <br />
             <asp:ListBox ID="ListRole" width="95%" runat="server" DataSourceID="Roles" DataTextField="Name" DataValueField="Id"></asp:ListBox>

                <asp:SqlDataSource ID="Roles" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [AspNetRoles]"></asp:SqlDataSource>
            </div>
        <div class="form-group">
                <asp:Button ID="btnAddRoles" runat="server" Text="Change Roles" 
                CssClass="btn btn-default" OnClick="BtnAddRoles_Click" />
            <asp:Label ID="Lblsbmt" style="padding:2px" runat="server" Text=""></asp:Label>
            </div>
        </div>
        </div>
</asp:Content>


