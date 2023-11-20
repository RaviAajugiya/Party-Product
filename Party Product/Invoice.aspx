<%@ Page Title="" Language="C#" MasterPageFile="~/MasterNavigation.Master" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="Party_Product.WebForm5" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <h3 class="text-center mb-3 mt-2">Invoice Add</h3>

    <table align="center" cellpadding="3" class="auto-style1">
        <tr>
            <td class="auto-style2">Party Name :</td>
            <td style="width: 50%">

                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Party_Name" DataValueField="Party_Name" CssClass="w-100" AppendDataBoundItems="true">
                    <asp:ListItem Value="Select Party">Select Party</asp:ListItem>
                </asp:DropDownList>

            </td>
        </tr>
        <tr>
            <td class="auto-style2">Product Name :</td>
            <td style="width: 50%">

                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Product_Name" DataValueField="Product_Name" AutoPostBack="True" OnPreRender="DropDownList2_PreRender" CssClass="w-100" AppendDataBoundItems="true">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Current Rate : </td>
            <td style="width: 50%">

                <asp:TextBox ID="AddRate" runat="server" CssClass="w-100"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td class="auto-style2">Quantity :</td>
            <td style="width: 50%">

                <asp:TextBox ID="quantity" runat="server" CssClass="w-100"></asp:TextBox>
            </td>
        </tr>
    </table>
    <p style="text-align: center">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PartyProductConnectionString %>" SelectCommand="SELECT Party.Party_Name FROM Party INNER JOIN Assign_Party ON Party.Party_id = Assign_Party.Party_id GROUP BY Party.Party_Name"></asp:SqlDataSource>
    </p>
    <p style="text-align: center">
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PartyProductConnectionString %>" SelectCommand="SELECT Product.Product_Name FROM Assign_Party INNER JOIN Product ON Assign_Party.Product_id = Product.Product_id INNER JOIN Party ON Assign_Party.Party_id = Party.Party_id WHERE (Party.Party_Name = @Party_Name)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="" Name="Party_Name" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p style="text-align: center">
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PartyProductConnectionString %>" SelectCommand="SELECT TOP (1) Product_Rate.Rate FROM Product_Rate INNER JOIN Product ON Product_Rate.Product_id = Product.Product_id WHERE (Product.Product_Name = @Product_Name) ORDER BY Product_Rate.Rate_Date DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="Product_Name" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Button ID="Button1" runat="server" Text="Add To Invoice" OnClick="Button1_Click" CssClass="btn btn-primary" />
    </p>


    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:PartyProductConnectionString %>" InsertCommand="INSERT INTO Invoice(Party_Name, Product_Name, Rate, Quantity) VALUES (@Party_Name, @Product_Name, @Rate, @Quantity)">
        <InsertParameters>
            <asp:Parameter Name="Party_Name" />
            <asp:Parameter Name="Product_Name" />
            <asp:Parameter Name="Rate" />
            <asp:Parameter Name="Quantity" />
        </InsertParameters>
    </asp:SqlDataSource>

    <div style="text-align: center">
        <hr style="width: 80%; margin: auto" />

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="TempInvoice" CssClass="table table-striped table-bordered" Width="80%" HorizontalAlign="Center" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="Invoice_id" HeaderText="Invoice_id" InsertVisible="False" ReadOnly="True" SortExpression="Invoice_id" />
                <asp:BoundField DataField="Party_Name" HeaderText="Party_Name" SortExpression="Party_Name" />
                <asp:BoundField DataField="Product_Name" HeaderText="Product_Name" SortExpression="Product_Name" />
                <asp:BoundField DataField="Rate" HeaderText="Rate" SortExpression="Rate" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="True" SortExpression="Total" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="TempInvoice" runat="server" ConnectionString="<%$ ConnectionStrings:PartyProductConnectionString %>" SelectCommand="SELECT * FROM [TempInvoice]"
            InsertCommand="INSERT INTO TempInvoice(Party_Name, Product_Name, Rate, Quantity) VALUES (@Party_Name, @Product_Name, @Rate, @Quantity)">
            <InsertParameters>
                <asp:Parameter Name="Party_Name" />
                <asp:Parameter Name="Product_Name" />
                <asp:Parameter Name="Rate" />
                <asp:Parameter Name="Quantity" />
            </InsertParameters>
        </asp:SqlDataSource>

        <br />
        Grand Total :
        <asp:Label ID="Total" runat="server" Text="0" CssClass="mt-3"></asp:Label>
        <br />

        <asp:Button ID="CloseInvoice" runat="server" Text="Close Invoice" Class="btn btn-danger mt-3" OnClick="CloseInvoice_click" />
    </div>

</asp:Content>


<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .auto-style1 {
            width: 402px;
        }

        .auto-style2 {
            width: 129px;
        }
    </style>
</asp:Content>



