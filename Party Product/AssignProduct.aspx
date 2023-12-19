<%@ Page Title="" Language="C#" MasterPageFile="~/MasterNavigation.Master" AutoEventWireup="true" CodeBehind="AssignProduct.aspx.cs" Inherits="Party_Product.WebForm3" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container">


        <p style="text-align: center">

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowUpdating="GridView1_RowUpdating" DataKeyNames="Product_id,Party_id" DataSourceID="SqlAssignParty" CssClass="table table-striped table-bordered" Width="80%" HorizontalAlign="Center" AllowSorting="True">
                <Columns>
                    <asp:TemplateField HeaderText="Party_Name" SortExpression="Party_Name">
                        <ItemStyle Width="33.33%" />

                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceParty" DataTextField="Party_Name" DataValueField="Party_Name" SelectedValue='<%# Bind("Party_Name") %>'></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceParty" runat="server" ConnectionString="<%$ ConnectionStrings:PartyProductConnectionString %>" SelectCommand="SELECT DISTINCT [Party_Name] FROM [Party]"></asp:SqlDataSource>
                            <br />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Party_Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Product_Name" SortExpression="Product_Name">
                        <ItemStyle Width="33.33%" />

                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSourceProduct" DataTextField="Product_Name" DataValueField="Product_Name" SelectedValue='<%# Bind("Product_Name") %>'></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceProduct" runat="server" ConnectionString="<%$ ConnectionStrings:PartyProductConnectionString %>" SelectCommand="SELECT DISTINCT [Product_Name] FROM [Product]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Product_Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
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
                    <asp:BoundField DataField="Party_id" ReadOnly="True" SortExpression="Party_id" Visible="False" />
                    <asp:BoundField DataField="Product_id" ReadOnly="True" SortExpression="Product_id" Visible="False" />
                </Columns>
            </asp:GridView>
            <p style="text-align: center">
                <a class="btn btn-outline-primary" href="AssignProductAddEdit.aspx">Assign Product</a>
            </p>


            <asp:SqlDataSource ID="SqlAssignParty" runat="server" ConnectionString="<%$ ConnectionStrings:PartyProductConnectionString %>"
                DeleteCommand="Delete from Assign_Party Where Party_id = @Party_id AND Product_id = @Product_id"
                SelectCommand="SELECT Party.Party_Name, Product.Product_Name, Party.Party_id, Product.Product_id FROM Party INNER JOIN Assign_Party ON Party.Party_id = Assign_Party.Party_id INNER JOIN Product ON Assign_Party.Product_id = Product.Product_id"
                UpdateCommand="UPDATE Assign_Party SET Party_id = (Select Party_id from Party where Party_Name = @Party_Name), 
                                                    Product_id = (Select Product_id from Product where Product_Name = @Product_Name)
                                                    Where Party_id = @Party_id AND Product_id = @Product_id">
                <DeleteParameters>
                    <asp:Parameter Name="Party_id" />
                    <asp:Parameter Name="Product_id" />
                </DeleteParameters>
                <UpdateParameters>

                    <asp:Parameter Name="Party_Name" Type="String" />
                    <asp:Parameter Name="Product_Name" Type="String" />
                    <asp:Parameter Name="Party_id" Type="Decimal" />
                    <asp:Parameter Name="Product_id" Type="Decimal" />

                </UpdateParameters>
            </asp:SqlDataSource>
        </p>
    </div>
</asp:Content>


