<%@ Page Title="" Language="C#" MasterPageFile="~/MasterNavigation.Master" AutoEventWireup="true" CodeBehind="ProductRate.aspx.cs" Inherits="Party_Product.WebForm4" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container">


        <p style="text-align: center">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Rate_id" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered" Width="90%" HorizontalAlign="Center">
                <Columns>
                    <asp:BoundField DataField="Rate_id" HeaderText="Rate_id" InsertVisible="False" ReadOnly="True" SortExpression="Rate_id">
                        <ItemStyle Width="10%" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Product_Name" SortExpression="Product_Name">
                        <EditItemTemplate>
                            <itemstyle width="15%" />
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Product_Name" DataValueField="Product_Name" SelectedValue='<%# Bind("Product_Name") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PartyProductConnectionString %>" SelectCommand="SELECT DISTINCT [Product_Name] FROM [Product]"></asp:SqlDataSource>
                        </EditItemTemplate>

                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Product_Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Rate" HeaderText="Rate" SortExpression="Rate">
                        <ItemStyle Width="15%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Rate_Date" HeaderText="Rate_Date" SortExpression="Rate_Date">
                        <ItemStyle Width="30%" />
                    </asp:BoundField>
                    <asp:CommandField ButtonType="Button" HeaderText="Action" ShowDeleteButton="True" ShowEditButton="True" ShowHeader="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PartyProductConnectionString %>" DeleteCommand="DELETE FROM Product_Rate WHERE (Rate_id = @Rate_id)" SelectCommand="SELECT Product_Rate.Rate_id, Product.Product_Name, Product_Rate.Rate, Product_Rate.Rate_Date FROM Product_Rate INNER JOIN Product ON Product_Rate.Product_id = Product.Product_id" UpdateCommand="UPDATE Product_Rate SET Rate = @Rate, Product_id = (Select Product_id from Product where Product_Name = @Product_Name), Rate_Date = @Rate_Date WHERE (Product_Rate.Rate_id = @Rate_id)">
                <DeleteParameters>
                    <asp:Parameter Name="Rate_id" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Rate" />
                    <asp:Parameter Name="Product_Name" />
                    <asp:Parameter Name="Rate_Date" />
                    <asp:Parameter Name="Rate_id" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <p style="text-align: center">
                <a href="ProductRateAddEdit.aspx" class="btn btn-outline-primary">ProductRateAddEdit.aspx</a>
            </p>
        </p>
    </div>
</asp:Content>


