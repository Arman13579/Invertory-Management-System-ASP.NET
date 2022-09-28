<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="InsertProduct.aspx.cs" Inherits="work_01.InsertProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row">
         <div class="d-flex justify-content-end mb-2">
                <a class="btn btn-primary btn-sm" href="ProductPage.aspx" title="Back to list"><i class="fa fa-arrow-left"></i></a>
            </div>
        <div class="col">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            <h2>Add New Products</h2>
            
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="ProductId" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" DefaultMode="Insert" OnItemInserting="DetailsView1_ItemInserting" Height="247px" Width="888px">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <EditRowStyle BackColor="#2461BF" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="ProductId" HeaderText="Product Id" InsertVisible="False" ReadOnly="True" SortExpression="ProductId" ControlStyle-CssClass="form-control" >
<ControlStyle CssClass="form-control"></ControlStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Product Name" SortExpression="ProductName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ProductName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ProductName") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Product Name is required" ControlToValidate   ="TextBox1"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("ProductName") %>'></asp:Label>
                        </ItemTemplate>
                        <ControlStyle CssClass="form-control" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Price" SortExpression="UnitPrice">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Price is required" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:Label>
                        </ItemTemplate>
                        <ControlStyle CssClass="form-control" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Quantity is required" ControlToValidate="TextBox3" ></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                        </ItemTemplate>
                        <ControlStyle CssClass="form-control" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Category" SortExpression="Category">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Category") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsCategory" DataTextField="CategoryName" DataValueField="id" SelectedValue='<%# Bind("Category") %>' CssClass=" dropdown rounded" Width="930px" Height="38"></asp:DropDownList>
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
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Category is required" ControlToValidate="DropDownList1"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Category") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Picture" SortExpression="ProductPicture">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ProductPicture") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                           <asp:FileUpload runat="server" ID="fuPicture" CssClass="form-control" />
                            <asp:HiddenField runat="server" ID="hd1" Value='<%# Bind("ProductPicture") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Picture is required" ControlToValidate="fuPicture" ></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("ProductPicture") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:CommandField ShowInsertButton="True" />
                </Fields>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbInventoryManagementConnectionString %>" DeleteCommand="DELETE FROM [tblProducts] WHERE [ProductId] = @ProductId" InsertCommand="INSERT INTO [tblProducts] ([ProductName], [UnitPrice], [Quantity], [Category], [ProductPicture]) VALUES (@ProductName, @UnitPrice, @Quantity, @Category, @ProductPicture)" SelectCommand="SELECT [ProductId], [ProductName], [UnitPrice], [Quantity], [Category], [ProductPicture] FROM [tblProducts]" UpdateCommand="UPDATE [tblProducts] SET [ProductName] = @ProductName, [UnitPrice] = @UnitPrice, [Quantity] = @Quantity, [Category] = @Category, [ProductPicture] = @ProductPicture WHERE [ProductId] = @ProductId">
                <DeleteParameters>
                    <asp:Parameter Name="ProductId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
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
