<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="InsertInventory.aspx.cs" Inherits="work_01.InsertInventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="col">
            <h2>Insert Inventory</h2>
            <div class="d-flex justify-content-end mb-2">
                <a class="btn btn-primary btn-sm" href="Inventory.aspx" title="Back to list"><i class="fa fa-arrow-left"></i></a>
            </div>
            <asp:DetailsView ID="DetailsView1" runat="server" CssClass="table table-info" AutoGenerateRows="False" DataKeyNames="InventoryId" DataSourceID="SqlDataSource1" DefaultMode="Insert" >
                <Fields>
                    <asp:BoundField DataField="InventoryId" HeaderText="InventoryId" InsertVisible="False" ReadOnly="True" SortExpression="InventoryId" />
                    <asp:TemplateField HeaderText="SupplierId" SortExpression="SupplierId">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SupplierId") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
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
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("SupplierId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                    <asp:TemplateField HeaderText="PurchaseDate" SortExpression="PurchaseDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("PurchaseDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PurchaseDate") %>' TextMode="Date"></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("PurchaseDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="StockOutDate" SortExpression="StockOutDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("StockOutDate") %>' ></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("StockOutDate") %>' TextMode="Date"></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("StockOutDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Category" SortExpression="Category">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Category") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
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
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Category") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CheckBoxField DataField="Available" HeaderText="Available" SortExpression="Available" />
                    <asp:TemplateField HeaderText="PId" SortExpression="PId">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("PId") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="Product" DataTextField="ProductName" DataValueField="ProductId" SelectedValue='<%# Bind("PId") %>'></asp:DropDownList>
                            <asp:SqlDataSource ID="Product" runat="server" ConnectionString="<%$ ConnectionStrings:dbInventoryManagementConnectionString %>" DeleteCommand="DELETE FROM [tblProducts] WHERE [ProductId] = @ProductId" InsertCommand="INSERT INTO [tblProducts] ([ProductName]) VALUES (@ProductName)" SelectCommand="SELECT [ProductId], [ProductName] FROM [tblProducts]" UpdateCommand="UPDATE [tblProducts] SET [ProductName] = @ProductName WHERE [ProductId] = @ProductId">
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
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("PId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbInventoryManagementConnectionString %>" DeleteCommand="DELETE FROM [tblInventory] WHERE [InventoryId] = @InventoryId" InsertCommand="INSERT INTO [tblInventory] ([SupplierId], [Quantity], [PurchaseDate], [StockOutDate], [Category], [Available], [PId]) VALUES (@SupplierId, @Quantity, @PurchaseDate, @StockOutDate, @Category, @Available, @PId)" SelectCommand="SELECT [InventoryId], [SupplierId], [Quantity], [PurchaseDate], [StockOutDate], [Category], [Available], [PId] FROM [tblInventory]" UpdateCommand="UPDATE [tblInventory] SET [SupplierId] = @SupplierId, [Quantity] = @Quantity, [PurchaseDate] = @PurchaseDate, [StockOutDate] = @StockOutDate, [Category] = @Category, [Available] = @Available, [PId] = @PId WHERE [InventoryId] = @InventoryId">
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
