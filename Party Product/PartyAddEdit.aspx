<%@ Page Title="" Language="C#" MasterPageFile="~/MasterNavigation.Master" AutoEventWireup="true" CodeBehind="PartyAddEdit.aspx.cs" Inherits="Party_Product.WebForm6" ValidateRequest="true" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container text-center">
        <h3 class="text-center mt-2 mb-3">Add Party</h3>
        <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Green"></asp:Label>
        <p class="text-center">
            Party Name :
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </p>
        <div class="text-center">
            <asp:Button CssClass="btn btn-primary" ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
        </div>
    </div>
    <asp:SqlDataSource ID="SqlAddParty" runat="server" ConnectionString="<%$ ConnectionStrings:PartyProductConnectionString %>"
        InsertCommand="INSERT INTO Party (Party_Name) VALUES (@PartyName)" OnInserted="SqlAddParty_Inserted">
        <InsertParameters>
            <asp:Parameter Name="PartyName" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
