<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderFooter.master" AutoEventWireup="true"
    CodeFile="signup.aspx.cs" Inherits="signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSignup">
        <div class="userForm">
            <div class="formTitle">
                SIGNUP
            </div>
            <div class="formContent">
                <asp:TextBox ID="txtName" placeholder="Your Name" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                    ErrorMessage="Please provide your name." ForeColor="Red" Display="Dynamic" 
                    ValidationGroup="signup"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="txtUserName" placeholder="User Name" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUserName"
                    ErrorMessage="Create a username." ForeColor="Red" Display="Dynamic" 
                    ValidationGroup="signup"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="txtPassword" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPassword"
                    ErrorMessage="RequiredFieldValidator" ForeColor="Red" Display="Dynamic" 
                    ValidationGroup="signup">Enter a password</asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="txtAgainPassword" placeholder="Repeat Password" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    BorderColor="Red" ControlToValidate="txtAgainPassword" Display="Dynamic" 
                    ErrorMessage="Enter password again." ForeColor="Red" 
                    ValidationGroup="signup"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="txtPassword" ControlToValidate="txtAgainPassword" 
                    Display="Dynamic" ErrorMessage="Password don't match." ForeColor="Red" 
                    ValidationGroup="signup"></asp:CompareValidator>
                <asp:DropDownList ID="ddlGender" runat="server">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem> 
                </asp:DropDownList>
                <br />
                <asp:TextBox ID="txtEmail" placeholder="Email" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="Please enter your Email address." ForeColor="Red" 
                    Display="Dynamic" ValidationGroup="signup"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Invalid Email." 
                    ForeColor="Red" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ValidationGroup="signup"></asp:RegularExpressionValidator>
                <br />
                <asp:TextBox ID="txtContact" placeholder="Contact Number" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtContact"
                    ErrorMessage="Please fill your contact number." ForeColor="Red" 
                    Display="Dynamic" ValidationGroup="signup"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="txtContact" ErrorMessage="Invalid phone number." 
                    ForeColor="Red" ValidationExpression="^[0-9]{10}" ValidationGroup="signup"></asp:RegularExpressionValidator>
                <br />
                <asp:TextBox ID="txtAddress" placeholder="Address" Rows="5" runat="server" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtAddress"
                    ErrorMessage="Please provide your shipping address." ForeColor="Red" 
                    Display="Dynamic" ValidationGroup="signup"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="lblError" runat="server" ForeColor="Red" 
                    Visible="False"></asp:Label> <br />
                <asp:Button ID="btnSignup" runat="server" Text="Submit" 
                    onclick="btnSignup_Click" ValidationGroup="signup" />
            </div>
        </div>
    </asp:Panel>
</asp:Content>
