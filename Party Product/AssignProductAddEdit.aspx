<%@ Page Title="" Language="C#" MasterPageFile="~/MasterNavigation.Master" AutoEventWireup="true" CodeBehind="AssignProductAddEdit.aspx.cs" Inherits="Party_Product.WebForm7" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container  text-center">
        <h3 class="text-center mb-3 mt-2">Assign Product</h3>
        <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Green"></asp:Label>

        <p class="text-center">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PartyProductConnectionString %>" SelectCommand="SELECT [Party_Name] FROM [Party]"></asp:SqlDataSource>
        </p>
        <table align="center" style="border-spacing: 10px">
            <tr>
                <td class="auto-style2">Party Name :</td>
                <td class="auto-style2">
                    <asp:DropDownList Style="width: 200px" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Party_Name" DataValueField="Party_Name">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Product Name :&nbsp;&nbsp;&nbsp; </td>
                <td>
                    <asp:DropDownList Style="width: 200px" ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Product_Name" DataValueField="Product_Name">
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <p style="text-align: center">
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PartyProductConnectionString %>" SelectCommand="SELECT [Product_Name] FROM [Product]"></asp:SqlDataSource>
        </p>
        <p style="text-align: center">
            <asp:Button CssClass="btn btn-primary" ID="Button2" runat="server" Text="Save" OnClick="Button2_Click" />

            <asp:Button CssClass="btn btn-primary" ID="Button3" runat="server" Text="Cancle" />
        </p>
    </div>

    <asp:SqlDataSource ID="SqlAssignProduct" runat="server" ConnectionString="<%$ ConnectionStrings:PartyProductConnectionString %>"
        InsertCommand="INSERT INTO Assign_Party VALUES ((Select Party_id from party where Party_Name = @PartyName),(Select Product_id from Product where Product_Name = @ProductName))" OnInserted="SqlAddParty_Inserted">
        <InsertParameters>
            <asp:Parameter Name="PartyName" Type="String" />
            <asp:Parameter Name="ProductName" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>


<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .auto-style2 {
            height: 45px;
        }
    </style>
</asp:Content>



