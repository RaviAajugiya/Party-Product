<%@ Page Title="" Language="C#" MasterPageFile="~/MasterNavigation.Master" AutoEventWireup="true" CodeBehind="History.aspx.cs" Inherits="Party_Product.WebForm9" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container">
        <p style="text-align: center">
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Invoice_id" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered" Width="80%" HorizontalAlign="Center" AllowPaging="True">
                <Columns>
                    <asp:BoundField DataField="Invoice_id" HeaderText="Invoice_id" InsertVisible="False" ReadOnly="True" SortExpression="Invoice_id" />
                    <asp:BoundField DataField="Party_Name" HeaderText="Party_Name" SortExpression="Party_Name" />
                    <asp:BoundField DataField="Product_Name" HeaderText="Product_Name" SortExpression="Product_Name" />
                    <asp:BoundField DataField="Rate" HeaderText="Rate" SortExpression="Rate" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                    <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="True" SortExpression="Total" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PartyProductConnectionString %>" SelectCommand="SELECT Invoice_id, Party_Name, Product_Name, Rate, Quantity, Rate * Quantity AS Total FROM Invoice"></asp:SqlDataSource>
        </p>
    </div>
</asp:Content>


