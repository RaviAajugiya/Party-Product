<%@ Page Title="" Language="C#" MasterPageFile="~/MasterNavigation.Master" AutoEventWireup="true" CodeBehind="Party.aspx.cs" Inherits="Party_Product.WebForm1" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
    <div class="container">
        <p class="text-center">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Party_id" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered" Width="80%" HorizontalAlign="Center" AllowSorting="True">
                <Columns>
                    <asp:BoundField DataField="Party_id" HeaderText="Party ID" InsertVisible="False" ReadOnly="True" SortExpression="Party_id">
                        <ItemStyle Width="33.33%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Party_Name" HeaderText="Party Name" SortExpression="Party_Name">
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
        </p>
        <p class="text-center">
            <a href="PartyAddEdit.aspx" class="btn btn-outline-primary">Add Party</a>
        </p>
        <p class="text-center">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PartyProductConnectionString %>" DeleteCommand="DELETE FROM [Party] WHERE [Party_id] = @Party_id" SelectCommand="SELECT * FROM [Party]" UpdateCommand="UPDATE [Party] SET [Party_Name] = @Party_Name WHERE [Party_id] = @Party_id" InsertCommand="INSERT INTO [Party] ([Party_Name]) VALUES (@Party_Name)">
                <DeleteParameters>
                    <asp:Parameter Name="Party_id" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Party_Name" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Party_Name" Type="String" />
                    <asp:Parameter Name="Party_id" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>
    </div>

</asp:Content>


