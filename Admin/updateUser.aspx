<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaserPage.master" AutoEventWireup="true"
    CodeFile="updateUser.aspx.cs" Inherits="Admin_updateUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSave">
        <div class="userForm adminForm">
            <div class="formTitle">
                USER UPDATE
            </div>
            <div class="formContent">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUserName"
                    ErrorMessage="Enter a username first." ForeColor="Red" Display="Dynamic" ValidationGroup="validate"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtUserName" placeholder="User Name" runat="server"></asp:TextBox>
                <asp:Button ID="btnLoad" runat="server" Text="Load" OnClick="btnLoad_Click" />
                <br />
                <asp:TextBox ID="txtName" placeholder="Your Name" runat="server" Enabled="False"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                    ErrorMessage="Please provide your name." ForeColor="Red" Display="Dynamic" ValidationGroup="validate"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="txtPassword" placeholder="Password" runat="server" Enabled="False"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPassword"
                    ErrorMessage="RequiredFieldValidator" ForeColor="Red" Display="Dynamic" ValidationGroup="validate">Enter a password</asp:RequiredFieldValidator>
                <br />
                <asp:DropDownList ID="ddlGender" runat="server" Enabled="False">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:TextBox ID="txtEmail" placeholder="Email" runat="server" Enabled="False"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="Please enter your Email address." ForeColor="Red" Display="Dynamic"
                    ValidationGroup="validate"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail"
                    Display="Dynamic" ErrorMessage="Invalid Email." ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ValidationGroup="validate"></asp:RegularExpressionValidator>
                <br />
                <asp:TextBox ID="txtContact" placeholder="Contact Number" runat="server" Enabled="False"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtContact"
                    ErrorMessage="Please fill your contact number." ForeColor="Red" Display="Dynamic"
                    ValidationGroup="validate"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtContact"
                    ErrorMessage="Invalide phone number." ForeColor="Red" ValidationExpression="^[0-9]{10}"
                    ValidationGroup="validate"></asp:RegularExpressionValidator>
                <br />
                <asp:TextBox ID="txtAddress" placeholder="Address" Rows="5" runat="server" TextMode="MultiLine"
                    Enabled="False"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtAddress"
                    ErrorMessage="Please provide your shipping address." ForeColor="Red" Display="Dynamic"
                    ValidationGroup="validate"></asp:RequiredFieldValidator>
                <br />
                <asp:DropDownList ID="ddlUserType" runat="server" Enabled="False">
                    <asp:ListItem>admin</asp:ListItem>
                    <asp:ListItem>customer</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:Label ID="lblError" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                <br />
                <asp:Button ID="btnSave" runat="server" Text="Submit" ValidationGroup="validate"
                    OnClick="btnSave_Click" />
            </div>
        </div>
    </asp:Panel>
</asp:Content>
