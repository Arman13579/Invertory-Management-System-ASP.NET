<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="loginPage.aspx.cs" Inherits="work_01.loginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
     <div class="row">
        <div class="col">
            <h4>Use a local account to login</h4>
            <asp:Panel ID="Panel1" runat="server" CssClass="alert alert-warning" Visible="false">
                <h5>Login Failed!!!</h5>
                <p>Login to register user!!!</p>
            </asp:Panel>
            <div class="form-group row">
                <asp:Label ID="Label1" AssociatedControlID="txtUserName" CssClass="col-form-label col-md-2 text-right" runat="server" Text="Label">Username</asp:Label>
                <asp:TextBox ID="txtUserName" CssClass="form-control col-md-6" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username is required!!!" ControlToValidate="txtUserName" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group row">
                <asp:Label ID="Label2" AssociatedControlID="txtPassword" CssClass="col-form-label col-md-2 text-right" runat="server" Text="Label">Password</asp:Label>
                <asp:TextBox ID="txtPassword" CssClass="form-control col-md-6" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is required!!" ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group row">
                <div >
                    <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary" Text="Login" OnClick="btnLogin_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
