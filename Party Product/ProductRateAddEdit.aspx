<%@ Page Title="" Language="C#" MasterPageFile="~/MasterNavigation.Master" AutoEventWireup="true" CodeBehind="ProductRateAddEdit.aspx.cs" Inherits="Party_Product.WebForm8" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container text-center">

        <h3 class="text-center mb-3 mt-2">Product Rate Add</h3>
        <asp:Label Style="display: inline-block; margin-bottom: 10px" ID="Status" Text="" runat="server" Visible="false"></asp:Label>
        <table cellpadding="3" align="center">
            <tr>
                <td>Product Name :</td>
                <td>
                    <asp:DropDownList Style="width: 259px" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Product_Name" DataValueField="Product_Name">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Product Rate :</td>
                <td>

                    <asp:TextBox ID="TextBox2" runat="server" Width="100%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Date of Rate :
                   
            </td>
                <td>

                    <asp:TextBox ID="TextBox3" runat="server" Width="100%"></asp:TextBox>
                </td>
            </tr>
        </table>
        <p style="text-align: center">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PartyProductConnectionString %>" SelectCommand="SELECT [Product_Name] FROM [Product]"></asp:SqlDataSource>
        </p>
        <p style="text-align: center">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" CssClass="btn btn-primary" />
        </p>
    </div>
    <asp:SqlDataSource ID="SqlAddRate" runat="server" ConnectionString="<%$ ConnectionStrings:PartyProductConnectionString %>"
        InsertCommand="INSERT INTO Product_Rate VALUES ((SELECT Product_id FROM Product WHERE Product_Name = @ProductName), @ProductRate, Cast(@RateDate AS Date))">
        <InsertParameters>
            <asp:Parameter Name="ProductName" Type="String" />
            <asp:Parameter Name="ProductRate" Type="String" />
            <asp:Parameter Name="RateDate" Type="DateTime" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>


