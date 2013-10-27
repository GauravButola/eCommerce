<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaserPage.master" AutoEventWireup="true"
    CodeFile="addFeatures.aspx.cs" Inherits="Admin_addFeatures" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
 <asp:Panel ID="Panel1" runat="server" DefaultButton="btnAdd">
        <div class="userForm adminForm">
            <div class="formTitle">
                ADD FEATURES TO PRODUCT
            </div>
            <div class="formContent">
                <asp:TextBox ID="txtProductID" placeholder="Product ID for which feature is to be added" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    Display="Dynamic" ErrorMessage="Product ID is required" ForeColor="Red" 
                    ControlToValidate="txtProductID"></asp:RequiredFieldValidator>
                <asp:RadioButtonList ID="rdoChooseFeature" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rdoChooseFeature_SelectedIndexChanged">
                    <asp:ListItem Value="1">Choose from list</asp:ListItem>
                    <asp:ListItem Value="2">Create New Feature</asp:ListItem>
                </asp:RadioButtonList>
                <asp:DropDownList ID="ddlFeatureName" runat="server" Visible="False">
                </asp:DropDownList>
                <asp:TextBox ID="txtFeatureName" placeholder="Feature Name e.g. 'Number of sim'"
                    runat="server" Visible="False"></asp:TextBox>
                <asp:TextBox ID="txtBoxFeatureValue" placeholder="Feature Value e.g. '2 Sims'" runat="server"
                    Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtBoxFeatureValue" 
                    ErrorMessage="Please provide feature detail" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                <asp:Label ID="lblStatus" runat="server" Text="" ForeColor="Green"></asp:Label>
                <asp:Button ID="btnAdd" runat="server" Text="Submit" onclick="btnAdd_Click" />
            </div>
        </div>
    </asp:Panel>
</asp:Content>
