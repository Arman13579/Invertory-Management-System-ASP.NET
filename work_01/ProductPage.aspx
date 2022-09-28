<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProductPage.aspx.cs" Inherits="work_01.ProductPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="col">
            
            <h2>Product list</h2>
            <div class="d-flex justify-content-end mb-2">
                <a class="btn btn-primary btn-sm" href="InsertProduct.aspx" title="Insert New Products"><i class="fa fa-plus"></i></a>
            </div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductId" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" CssClass="table table-light table-hover" SelectedIndex="0" OnRowUpdating="GridView1_RowUpdating"  >
                <Columns>
                    <asp:BoundField DataField="ProductId" HeaderText="Id" ReadOnly="True" SortExpression="ProductId"  />
                    <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName"  />
                    <asp:BoundField DataField="UnitPrice" HeaderText="Unit Price" SortExpression="UnitPrice"  />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity"  />
                    <asp:TemplateField HeaderText="Category" SortExpression="CategoryName">
                        <EditItemTemplate>
                           <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsCategory" DataTextField="CategoryName" DataValueField="id" SelectedValue='<%# Bind("Category") %>'></asp:DropDownList>
                            <asp:SqlDataSource ID="dsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:dbInventoryManagementConnectionString %>" DeleteCommand="DELETE FROM [tblCategory] WHERE [id] = @id" InsertCommand="INSERT INTO [tblCategory] ([CategoryName]) VALUES (@CategoryName)" SelectCommand="SELECT [id], [CategoryName] FROM [tblCategory]" UpdateCommand="UPDATE [tblCategory] SET [CategoryName] = @CategoryName WHERE [id] = @id">
                                <DeleteParameters>
                                    <asp:Parameter Name="id" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="CategoryName" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="CategoryName" Type="String" />
                                    <asp:Parameter Name="id" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("CategoryName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Picture" SortExpression="ProductPicture">
                        <EditItemTemplate>
                            <asp:FileUpload runat="server" ID="fuPicture" />
                            <asp:HiddenField runat="server" ID="hd1" Value='<%# Bind("ProductPicture") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ImageUrl='<%# Eval("ProductPicture","~/Images/{0}")  %>' width="60px" runat="server"  id="image1" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbInventoryManagementConnectionString %>" DeleteCommand="DELETE FROM [tblProducts] WHERE [ProductId] = @ProductId" InsertCommand="INSERT INTO [tblProducts] ([ProductId], [ProductName], [UnitPrice], [Quantity], [Category], [ProductPicture]) VALUES (@ProductId, @ProductName, @UnitPrice, @Quantity, @Category, @ProductPicture)" SelectCommand="select p.*,c.CategoryName from tblProducts p join tblCategory c on p.Category=c.id" UpdateCommand="UPDATE [tblProducts] SET [ProductName] = @ProductName, [UnitPrice] = @UnitPrice, [Quantity] = @Quantity, [Category] = @Category, [ProductPicture] = @ProductPicture WHERE [ProductId] = @ProductId">
                <DeleteParameters>
                    <asp:Parameter Name="ProductId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ProductId" Type="Int32" />
                    <asp:Parameter Name="ProductName" Type="String" />
                    <asp:Parameter Name="UnitPrice" Type="Decimal" />
                    <asp:Parameter Name="Quantity" Type="Int32" />
                    <asp:Parameter Name="Category" Type="Int32" />
                    <asp:Parameter Name="ProductPicture" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ProductName" Type="String" />
                    <asp:Parameter Name="UnitPrice" Type="Decimal" />
                    <asp:Parameter Name="Quantity" Type="Int32" />
                    <asp:Parameter Name="Category" Type="Int32" />
                    <asp:Parameter Name="ProductPicture" Type="String" />
                    <asp:Parameter Name="ProductId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>    
    </div>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
