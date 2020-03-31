<%@ Page Title="Add Clinic" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddClinic.aspx.cs" Inherits="UzimaRX.AddClinic" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
       <h2><%: Title %></h2>
<fieldset id="form1" runat="server" method="post" class="form-horizontal" defaultfocus="txtEmail1" defaultbutton="btnSubmit">
    <div class="col-md-12">
    <br />
    </div>
    <div class="form-group col-md-12">
        <label class="control-label col-sm-3">Location Name:</label>
        <div class="col-sm-5">
            <asp:TextBox ID="txtFName" runat="server" CssClass="form-control txtbox"></asp:TextBox>
        </div>
        <div class="col-sm-4">
            <asp:RequiredFieldValidator ID="rfvFirstName" runat="server"
                ErrorMessage="Location Name" CssClass="text-danger" Text="Required" Display="Dynamic" ControlToValidate="txtFName">Required</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="regFName" runat="server" ControlToValidate="txtFName" data-val="True"
                ValidationGroup="ValidGroup" Display="Dynamic" ValidationExpression="^[a-zA-Z]+$" ErrorMessage="Name must be in Alpha characters" />
            </div>
    </div>


    <div class="form-group col-md-12">
        <label class="control-label col-sm-3">Address:</label>
        <div class="col-sm-5">
            <asp:TextBox ID="txtLName" runat="server" CssClass="form-control txtbox"></asp:TextBox>
        </div>
        <div class="col-sm-4">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                ErrorMessage="Address" CssClass="text-danger" Text="Required" Display="Dynamic" ControlToValidate="txtLName">Required</asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator ID="regLName" runat="server" ControlToValidate="txtLName"
                ValidationGroup="ValidGroup" Display="Dynamic" ValidationExpression="^[a-zA-Z]+$" Text="Name must be in Alpha characters" />
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
  
            <asp:RegularExpressionValidator ID="revPhone" runat="server" ErrorMessage="Phone number must be XXX-XXX-XXXX form" CssClass="text-danger" Display="Dynamic"
                ValidationExpression="\d{3}-\d{3}-\d{4}" ControlToValidate="txtPhone">Phone number must be XXX-XXX-XXXX form</asp:RegularExpressionValidator>
    </div>
    </div>

    <div class="form-group col-md-12">
        <div class="col-sm-3"></div>
        <div class="col-sm-5">
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn"  OnClick="btnSubmit_Click" Width="125px" />
        <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btndesign"  OnClick="btnClear_Click" Width="125px" />
        </div>
        <asp:label class="col-sm-4" ID="lblSubmit" runat="server"></asp:label>
    </div>
    </fieldset>
</asp:Content>
