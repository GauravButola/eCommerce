<%@ Page Title="" Language="C#" MasterPageFile="~/ProfileMasterPage.master" AutoEventWireup="true"
    CodeFile="changePassword.aspx.cs" Inherits="changePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnChange">
        <div class="userForm">
            <div class="formTitle">
                CHANGE PASSWORD
            </div>
            <div class="formContent">
                <asp:TextBox ID="txtPassword" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPassword"
                    ErrorMessage="RequiredFieldValidator" ForeColor="Red" Display="Dynamic" ValidationGroup="signup">Enter a password</asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="txtAgainPassword" placeholder="Repeat Password" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" BorderColor="Red"
                    ControlToValidate="txtAgainPassword" Display="Dynamic" ErrorMessage="Enter password again."
                    ForeColor="Red" ValidationGroup="signup"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword"
                    ControlToValidate="txtAgainPassword" Display="Dynamic" ErrorMessage="Password don't match."
                    ForeColor="Red" ValidationGroup="signup"></asp:CompareValidator>
                <br />
                <asp:Button ID="btnChange" runat="server" Text="Submit" OnClick="btnChange_Click" />
                <br />
                <asp:Label ID="lblError" Visible="False" ForeColor="Green" runat="server"></asp:Label></div>
        </div>
    </asp:Panel>
</asp:Content>
