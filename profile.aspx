<%@ Page Title="" Language="C#" MasterPageFile="~/ProfileMasterPage.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSave">
        <div class="userForm">
            <div class="formTitle">
                PROFILE DETAILS
            </div>
            <div class="formContent">
                <asp:TextBox ID="txtName" placeholder="Your Name" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                    ErrorMessage="Please provide your name." ForeColor="Red" Display="Dynamic" 
                    ValidationGroup="validate"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="txtUserName" placeholder="User Name" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUserName"
                    ErrorMessage="Create a username." ForeColor="Red" Display="Dynamic" 
                    ValidationGroup="validate"></asp:RequiredFieldValidator>
                <br />
                <asp:DropDownList ID="ddlGender" runat="server">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem> 
                </asp:DropDownList>
                <br />
                <asp:TextBox ID="txtEmail" placeholder="Email" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="Please enter your Email address." ForeColor="Red" 
                    Display="Dynamic" ValidationGroup="validate"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Invalid Email." 
                    ForeColor="Red" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ValidationGroup="validate"></asp:RegularExpressionValidator>
                <br />
                <asp:TextBox ID="txtContact" placeholder="Contact Number" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtContact"
                    ErrorMessage="Please fill your contact number." ForeColor="Red" 
                    Display="Dynamic" ValidationGroup="validate"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="txtContact" Display="Dynamic" 
                    ErrorMessage="Invalid contact Number" ForeColor="Red" 
                    ValidationExpression="^[0-9]{10}" ValidationGroup="validate"></asp:RegularExpressionValidator>
                <br />
                <asp:TextBox ID="txtAddress" placeholder="Address" Rows="5" runat="server" 
                    TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtAddress"
                    ErrorMessage="Please provide your shipping address." ForeColor="Red" 
                    Display="Dynamic" ValidationGroup="validate"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="lblError" runat="server" ForeColor="Green" 
                    Visible="False"></asp:Label> <br />
                <asp:Button ID="btnSave" runat="server" Text="Update" 
                     ValidationGroup="validate" onclick="btnSave_Click" />
            </div>
        </div>
    </asp:Panel>

</asp:Content>

