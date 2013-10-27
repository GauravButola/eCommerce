<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaserPage.master" AutoEventWireup="true"
    CodeFile="addProduct.aspx.cs" Inherits="Admin_addProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnAdd">
        <div class="userForm adminForm">
            <div class="formTitle">
                ADD NEW PRODUCT
            </div>
            <div class="formContent">
                <asp:TextBox ID="txtName" placeholder="Product Name" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                    Display="Dynamic" ErrorMessage="Product name is required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="txtDescription" runat="server" placeholder="Product Description"
                    TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDescription"
                    Display="Dynamic" ErrorMessage="Product description can't be empty" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="txtPrice" placeholder="Price" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPrice"
                    Display="Dynamic" ErrorMessage="Please specify a price" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="txtDiscount" placeholder="Discount" runat="server"></asp:TextBox><br />
                <asp:DropDownList ID="ddlCategory" runat="server">
                </asp:DropDownList>
                <br />
                <asp:FileUpload ID="flImageUpload" runat="server" />
                <br />
                <asp:Label ID="lblStatus" runat="server" ForeColor="Green"></asp:Label>
                <br />
                <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
                <br /> <hr />
                <asp:HyperLink ID="hlAddFeature" NavigateUrl="~/Admin/addFeatures.aspx" runat="server">Add Features Now?</asp:HyperLink>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
