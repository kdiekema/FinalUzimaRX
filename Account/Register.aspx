<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="UzimaRX.Account.Register" %>


<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="MainContent">
    <h2><%: Title %></h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Create a new account</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
            </div>
        </div>
       <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
</asp:Content>


<%--<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %></h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Create a new account</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="cEmail" CssClass="col-md-2 control-label">Confirm Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="cEmail" CssClass="form-control" TextMode="Email" />
                <asp:CompareValidator ID="compEmail" runat="server" ControlToValidate="cEmail" controltocompare="Email" ErrorMessage="Emails do not match"></asp:CompareValidator>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="cEmail"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>

         <%-- <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Username" CssClass="col-md-2 control-label">Username</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Username" CssClass="form-control" TextMode="singleline" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Username"
                    CssClass="text-danger" ErrorMessage="Username is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Name" CssClass="col-md-2 control-label">Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Name" CssClass="form-control" TextMode="singleline" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Name"
                    CssClass="text-danger" ErrorMessage="Name is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>

      <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Location" CssClass="col-md-2 control-label">Main Location</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="ddlLocation" runat="server" DataSourceID="Location" DataTextField="LocationName" DataValueField="LocationName" Height="30px" Width="280px" ></asp:DropDownList>
                <asp:SqlDataSource ID="Location" runat="server" ConnectionString="<%$ ConnectionStrings:uzimarxConnectionString %>" SelectCommand="SELECT [LocationName] FROM [UzimaLocation]"></asp:SqlDataSource>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlLocation"
                    CssClass="text-danger" ErrorMessage="Location is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Role" CssClass="col-md-2 control-label">Role</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="ddlRole" runat="server" DataSourceID="Role" DataTextField="Name" DataValueField="Name" Height="30px" Width="280px"></asp:DropDownList>
                <asp:SqlDataSource ID="Role" runat="server" ConnectionString="Data Source=uzimarx.database.windows.net;Initial Catalog=uzimarx;Persist Security Info=True;User ID=uzimarx-app;Password=tyqh34@$sdlfia3dlkfPOJ23LKUwnudfn*(t789qe*4;MultipleActiveResultSets=True;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [Name] FROM [AspNetRoles]"></asp:SqlDataSource>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlRole"
                    CssClass="text-danger" ErrorMessage="Role is required." />
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
</asp:Content>--%>
