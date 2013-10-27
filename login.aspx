<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderFooter.master" AutoEventWireup="true"
    CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnLogin">
        <div class="userForm">
            <div class="formTitle">
                LOGIN
            </div>
            <div class="formContent">
                <asp:TextBox ID="txtUserName" placeholder="User Name" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName"
                    Display="Dynamic" ErrorMessage="Username is required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
                    Display="Dynamic" ErrorMessage="Password field can't be empty" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:Button ID="btnLogin" runat="server" Text="Submit" 
                    onclick="btnLogin_Click" />
                <br />
                <asp:Label ID="lblError" Visible="False" ForeColor="Red" runat="server"></asp:Label>
                <hr />
                <asp:HyperLink ID="hlForgotPassword" NavigateUrl="forgotPassword.aspx" runat="server">Forgot Password</asp:HyperLink>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
