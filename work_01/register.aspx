<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="work_01.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="col">
            <h4>Register here</h4>
            <asp:Panel ID="Panel1" runat="server" CssClass="alert alert-warning" Visible="false">
                <h5>Registration Failed!!!</h5>
               
            </asp:Panel>
            <div class="form-group row">
                <asp:Label ID="Label1" AssociatedControlID="txtUserName" CssClass="col-form-label col-md-2 text-right" runat="server" Text="Label">Username</asp:Label>
                <asp:TextBox ID="txtUserName" CssClass="form-control col-md-6" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username is required!!!" ControlToValidate="txtUserName" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group row">
                <asp:Label ID="Label2" AssociatedControlID="txtPassword" CssClass="col-form-label col-md-2 text-right" runat="server" Text="Label">Password</asp:Label>
                <asp:TextBox ID="txtPassword" CssClass="form-control col-md-6" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is required!!" ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group row">
                <asp:Label ID="Label3" AssociatedControlID="txtReTypePassword" CssClass="col-form-label col-md-2 text-right" runat="server" Text="Label">Confirm Password</asp:Label>
                <asp:TextBox ID="txtReTypePassword" CssClass="form-control col-md-6" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password does not match!!!!" ControlToCompare="txtPassword" ControlToValidate="txtReTypePassword" ForeColor="#CC0000"></asp:CompareValidator>
            </div>
            <div class="form-group row">
               <div class="offset-2">
                   <asp:Button ID="btnRegister" runat="server" CssClass="btn btn-primary" Text="Register" OnClick="btnRegister_Click" />
               </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
