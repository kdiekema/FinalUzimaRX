<%@ Page Title="Add Clinic" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddClinic.aspx.cs" Inherits="UzimaRX.AddClinic" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
       <h2><%: Title %></h2>

<fieldset id="form1" runat="server" method="post" class="form-horizontal" defaultfocus="txtLName" defaultbutton="btnSubmit">
    <div class="col-md-12">
    <br />
    </div> 
    <div class="form-group col-md-12">
        <label class="control-label col-sm-3">Location Name:</label>
        <div class="col-sm-5">
            <asp:TextBox ID="txtLName" runat="server" CssClass="form-control txtbox"></asp:TextBox>
        </div>
        <div class="col-sm-4">
            <asp:RequiredFieldValidator ID="rfvFirstName" runat="server"
                ErrorMessage="Location Name" CssClass="text-danger" Text="Required" Display="Dynamic" ControlToValidate="txtLName">Required</asp:RequiredFieldValidator>
            </div>
    </div>

    <div class="form-group col-md-12">
        <label class="control-label col-sm-3">Supplier:</label>
        <div class="col-sm-5">
            <asp:DropDownList ID="ddlSupp" runat="server" DataSourceID="SqlDataSource1" DataTextField="LocationName" DataValueField="LocationName" Height="31px">
                <asp:ListItem Selected="True" Value="None">- Select Supplier -</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT LocationName FROM UzimaLocations I WHERE (Type = N'Supplier') OR (Type = N'Hospital')"></asp:SqlDataSource>
        </div>
          <div class="col-sm-4">
            <asp:RequiredFieldValidator ID="rfvState" runat="server" InitialValue="None"
                ErrorMessage="Supplier" CssClass="text-danger" Text="Required" Display="Dynamic" ControlToValidate="ddlSupp"></asp:RequiredFieldValidator>
       </div>
        </div>

    <div class="form-group col-md-12">
        <label class="control-label col-sm-3">Address:</label>
        <div class="col-sm-5">
            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control txtbox"></asp:TextBox>
        </div>
        <div class="col-sm-4">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                ErrorMessage="Address" CssClass="text-danger" Text="Required" Display="Dynamic" ControlToValidate="txtAddress">Required</asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="form-group col-md-12">
        <label class="control-label col-sm-3">Phone:</label>
        <div class="col-sm-5">
            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control txtbox"></asp:TextBox>
        </div>
        <div class="col-sm-4">
            <asp:RequiredFieldValidator ID="rfvPhone" runat="server"
                ErrorMessage="Phone" CssClass="text-danger" Text="Required" Display="Dynamic" ControlToValidate="txtPhone">Required</asp:RequiredFieldValidator>
           </div>
    </div>

    <div class="form-group col-md-12">
        <div class="col-sm-3"></div>
        <div class="col-sm-5">
        <asp:Button ID="btnSubmit" CssClass="btn btn-default" runat="server" Text="Submit"  OnClick="btnSubmit_Click" Width="125px" />
        <asp:Button ID="btnClear" CssClass="btn btn-default" runat="server" Text="Clear" OnClick="btnClear_Click" Width="125px" />
        </div>
        <asp:label class="col-sm-4" ID="lblSubmit" runat="server"></asp:label>
    </div>
    </fieldset>

</asp:Content>
