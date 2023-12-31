﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterNavigation.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Party_Product.WebForm2" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container">
        <p style="text-align: center">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Product_id" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered" Width="80%" HorizontalAlign="Center" AllowSorting="True">
                <Columns>
                    <asp:BoundField DataField="Product_id" HeaderText="Product_id" InsertVisible="False" ReadOnly="True" SortExpression="Product_id">
                        <ItemStyle Width="33.33%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Product_Name" HeaderText="Product_Name" SortExpression="Product_Name">
                        <ItemStyle Width="33.33%" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Action">
                        <EditItemTemplate>
                            <asp:LinkButton runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-info"></asp:LinkButton>
                            &nbsp;<asp:LinkButton runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="w-auto btn btn-danger"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn btn-success"></asp:LinkButton>
                            <asp:LinkButton runat="server" Text="Delete" CommandName="Delete" CausesValidation="False" OnClientClick="return confirm('Are you sure you want to delete?');" CssClass="btn btn-danger"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <p style="text-align: center">
                <a href="ProductAddEdit.aspx" class="btn btn-outline-primary">ProductAddEdit.aspx</a>
            </p>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PartyProductConnectionString %>" DeleteCommand="DELETE FROM [Product] WHERE [Product_id] = @Product_id" InsertCommand="INSERT INTO [Product] ([Product_Name]) VALUES (@Product_Name)" SelectCommand="SELECT * FROM [Product]" UpdateCommand="UPDATE [Product] SET [Product_Name] = @Product_Name WHERE [Product_id] = @Product_id">
                <DeleteParameters>
                    <asp:Parameter Name="Product_id" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Product_Name" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Product_Name" Type="String" />
                    <asp:Parameter Name="Product_id" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>
    </div>
</asp:Content>


