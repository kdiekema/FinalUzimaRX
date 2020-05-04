<%@ Page Title="Add Drugs" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddDrug.aspx.cs" Inherits="UzimaRX.AddDrug" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
       <h2><%: Title %></h2>


        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="50px" Width="95%" AutoGenerateInsertButton="True">
            <Fields>
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" InsertVisible="False"/>
                <asp:BoundField DataField="Barcode" HeaderText="Barcode" SortExpression="Barcode" />
                <asp:BoundField DataField="DrugName" HeaderText="DrugName" SortExpression="DrugName"/>
                <asp:BoundField DataField="BrandName" HeaderText="BrandName" SortExpression="BrandName"/>
                <asp:BoundField DataField="ApplicationNumber" HeaderText="ApplicationNumber" SortExpression="ApplicationNumber"/>
                <asp:BoundField DataField="Manufacturer" HeaderText="Manufacturer" SortExpression="Manufacturer"/>
                <asp:BoundField DataField="ManufacturerLocation" HeaderText="ManufacturerLocation" SortExpression="ManufacturerLocation"/>
                <asp:BoundField DataField="ApprovalNumber" HeaderText="ApprovalNumber" SortExpression="ApprovalNumber"/>
                <asp:BoundField DataField="Schedule" HeaderText="Schedule" SortExpression="Schedule"/>
                <asp:BoundField DataField="License" HeaderText="License" SortExpression="License"/>
                <asp:BoundField DataField="Ingredients" HeaderText="Ingredients" SortExpression="Ingredients"/>
                <asp:BoundField DataField="PackSize" HeaderText="PackSize" SortExpression="PackSize"/>
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [UzimaDrug] WHERE [Id] = @Id" InsertCommand="INSERT INTO [UzimaDrug] ([Barcode], [DrugName], [BrandName], [ApplicationNumber], [Manufacturer], [ManufacturerLocation], [ApprovalNumber], [Schedule], [License], [Ingredients], [PackSize]) VALUES (@Barcode, @DrugName, @BrandName, @ApplicationNumber, @Manufacturer, @ManufacturerLocation, @ApprovalNumber, @Schedule, @License, @Ingredients, @PackSize)" SelectCommand="SELECT * FROM [UzimaDrug]" UpdateCommand="UPDATE [UzimaDrug] SET [Barcode] = @Barcode, [DrugName] = @DrugName, [BrandName] = @BrandName, [ApplicationNumber] = @ApplicationNumber, [Manufacturer] = @Manufacturer, [ManufacturerLocation] = @ManufacturerLocation, [ApprovalNumber] = @ApprovalNumber, [Schedule] = @Schedule, [License] = @License, [Ingredients] = @Ingredients, [PackSize] = @PackSize WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Barcode" Type="String" />
                <asp:Parameter Name="DrugName" Type="String" />
                <asp:Parameter Name="BrandName" Type="String" />
                <asp:Parameter Name="ApplicationNumber" Type="String" />
                <asp:Parameter Name="Manufacturer" Type="String" />
                <asp:Parameter Name="ManufacturerLocation" Type="String" />
                <asp:Parameter Name="ApprovalNumber" Type="String" />
                <asp:Parameter Name="Schedule" Type="String" />
                <asp:Parameter Name="License" Type="String" />
                <asp:Parameter Name="Ingredients" Type="String" />
                <asp:Parameter Name="PackSize" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Barcode" Type="String" />
                <asp:Parameter Name="DrugName" Type="String" />
                <asp:Parameter Name="BrandName" Type="String" />
                <asp:Parameter Name="ApplicationNumber" Type="String" />
                <asp:Parameter Name="Manufacturer" Type="String" />
                <asp:Parameter Name="ManufacturerLocation" Type="String" />
                <asp:Parameter Name="ApprovalNumber" Type="String" />
                <asp:Parameter Name="Schedule" Type="String" />
                <asp:Parameter Name="License" Type="String" />
                <asp:Parameter Name="Ingredients" Type="String" />
                <asp:Parameter Name="PackSize" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </p>

</asp:Content>
