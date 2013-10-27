<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderFooter.master" AutoEventWireup="true"
    CodeFile="forgotPassword.aspx.cs" Inherits="forgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnPasswordRecover">
        <div class="userForm">
            <div class="formTitle">
                Recover Password
            </div>

            <div class="formContent">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Invalid Email ID" ForeColor="Red" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <br />
                <asp:TextBox ID="txtEmail" placeholder="Email ID you signed up with." runat="server"></asp:TextBox>

                <asp:Button ID="btnPasswordRecover" runat="server" Text="Submit" 
                    onclick="btnPasswordRecover_Click" />
            </div>
        </div>
    </asp:Panel>
</asp:Content>
