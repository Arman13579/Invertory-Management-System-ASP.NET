<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="work_01.Inventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="col">
            <h2>Inventory List</h2>
            <div class="d-flex justify-content-end mb-2">
                <a class="btn btn-primary btn-sm" href="InsertInventory.aspx" title="Insert New Inventory"><i class="fa fa-plus"></i></a>
            </div>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="InventoryId" DataSourceID="SqlDataSource1" CssClass="table table-hover">
                <Columns>
                    <asp:BoundField DataField="InventoryId" HeaderText="InventoryId" InsertVisible="False" ReadOnly="True" SortExpression="InventoryId" />
                    <asp:TemplateField HeaderText="Supplier" SortExpression="SupplierId">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="supplier" DataTextField="CompanyName" DataValueField="SupplierId" SelectedValue='<%# Bind("SupplierId") %>'></asp:DropDownList>
                            <asp:SqlDataSource ID="supplier" runat="server" ConnectionString="<%$ ConnectionStrings:dbInventoryManagementConnectionString %>" DeleteCommand="DELETE FROM [tblSuppliers] WHERE [SupplierId] = @SupplierId" InsertCommand="INSERT INTO [tblSuppliers] ([CompanyName]) VALUES (@CompanyName)" SelectCommand="SELECT [SupplierId], [CompanyName] FROM [tblSuppliers]" UpdateCommand="UPDATE [tblSuppliers] SET [CompanyName] = @CompanyName WHERE [SupplierId] = @SupplierId">
                                <DeleteParameters>
                                    <asp:Parameter Name="SupplierId" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="CompanyName" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="CompanyName" Type="String" />
                                    <asp:Parameter Name="SupplierId" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("CompanyName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                    <asp:BoundField DataField="PurchaseDate" HeaderText="PurchaseDate" SortExpression="PurchaseDate" />
                    <asp:BoundField DataField="StockOutDate" HeaderText="StockOutDate" SortExpression="StockOutDate" />
                    <asp:TemplateField HeaderText="Category" SortExpression="Category">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="category" DataTextField="CategoryName" DataValueField="id" SelectedValue='<%# Bind("Category") %>'></asp:DropDownList>
                            <asp:SqlDataSource ID="category" runat="server" ConnectionString="<%$ ConnectionStrings:dbInventoryManagementConnectionString %>" DeleteCommand="DELETE FROM [tblCategory] WHERE [id] = @id" InsertCommand="INSERT INTO [tblCategory] ([CategoryName]) VALUES (@CategoryName)" SelectCommand="SELECT [id], [CategoryName] FROM [tblCategory]" UpdateCommand="UPDATE [tblCategory] SET [CategoryName] = @CategoryName WHERE [id] = @id">
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
                    <asp:CheckBoxField DataField="Available" HeaderText="Available" SortExpression="Available" />
                    <asp:TemplateField HeaderText="PId" SortExpression="PId">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="product" DataTextField="ProductName" DataValueField="ProductId" SelectedValue='<%# Bind("PId") %>'></asp:DropDownList>
                            <asp:SqlDataSource ID="product" runat="server" ConnectionString="<%$ ConnectionStrings:dbInventoryManagementConnectionString %>" DeleteCommand="DELETE FROM [tblProducts] WHERE [ProductId] = @ProductId" InsertCommand="INSERT INTO [tblProducts] ([ProductName]) VALUES (@ProductName)" SelectCommand="SELECT [ProductId], [ProductName] FROM [tblProducts]" UpdateCommand="UPDATE [tblProducts] SET [ProductName] = @ProductName WHERE [ProductId] = @ProductId">
                                <DeleteParameters>
                                    <asp:Parameter Name="ProductId" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="ProductName" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="ProductName" Type="String" />
                                    <asp:Parameter Name="ProductId" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ProductName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbInventoryManagementConnectionString %>" DeleteCommand="DELETE FROM [tblInventory] WHERE [InventoryId] = @InventoryId" InsertCommand="INSERT INTO [tblInventory] ([SupplierId], [Quantity], [PurchaseDate], [StockOutDate], [Category], [Available], [PId]) VALUES (@SupplierId, @Quantity, @PurchaseDate, @StockOutDate, @Category, @Available, @PId)" SelectCommand="select i.*,s.CompanyName,c.CategoryName,p.ProductName from tblInventory i join tblSuppliers s on i.SupplierId=s.SupplierId join tblCategory c on i.Category = c.id join tblProducts p on p.ProductId = i.PId" UpdateCommand="UPDATE [tblInventory] SET [SupplierId] = @SupplierId, [Quantity] = @Quantity, [PurchaseDate] = @PurchaseDate, [StockOutDate] = @StockOutDate, [Category] = @Category, [Available] = @Available, [PId] = @PId WHERE [InventoryId] = @InventoryId">
                <DeleteParameters>
                    <asp:Parameter Name="InventoryId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="SupplierId" Type="Int32" />
                    <asp:Parameter Name="Quantity" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="PurchaseDate" />
                    <asp:Parameter DbType="Date" Name="StockOutDate" />
                    <asp:Parameter Name="Category" Type="Int32" />
                    <asp:Parameter Name="Available" Type="Boolean" />
                    <asp:Parameter Name="PId" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SupplierId" Type="Int32" />
                    <asp:Parameter Name="Quantity" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="PurchaseDate" />
                    <asp:Parameter DbType="Date" Name="StockOutDate" />
                    <asp:Parameter Name="Category" Type="Int32" />
                    <asp:Parameter Name="Available" Type="Boolean" />
                    <asp:Parameter Name="PId" Type="Int32" />
                    <asp:Parameter Name="InventoryId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
