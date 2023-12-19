<%@ Page Title="" Language="C#" MasterPageFile="~/MasterNavigation.Master" AutoEventWireup="true" CodeBehind="ProductAddEdit.aspx.cs" Inherits="Party_Product.ProductAddEdit" %>


<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container text-center">
        <h3 class="text-center mb-3 mt-2">Add Product</h3>
        <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Green"></asp:Label>
        <p style="text-align: center">
            Product Name :
           
           

            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </p>
        <p style="text-align: center">
            <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="Button1_Click" />
        </p>
        <p style="text-align: center">
            &nbsp;
       
       
        </p>
    </div>
    <asp:SqlDataSource ID="SqlAddProduct" runat="server" ConnectionString="<%$ ConnectionStrings:PartyProductConnectionString %>"
        InsertCommand="INSERT INTO Product VALUES (@ProductName)"
        OnInserted="SqlAddParty_Inserted">
        <InsertParameters>
            <asp:Parameter Name="ProductName" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>

</asp:Content>



