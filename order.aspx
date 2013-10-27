<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderFooter.master" AutoEventWireup="true"
    CodeFile="order.aspx.cs" Inherits="order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="lblMessage" runat="server" Font-Size="XX-Large" ForeColor="Red" Text="Your cart is empty"
        Visible="False" style="padding-top: 500px;"></asp:Label>
    <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" 
    OnFinishButtonClick="Wizard1_FinishButtonClick" StartNextButtonText="Payment">
        <WizardSteps>
            <asp:WizardStep ID="WizardStep1" runat="server" Title="Step 1">
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <asp:Label ID="lblHiddenCartID" runat="server" Text='<%#Eval("CartID") %>' Visible="False"></asp:Label>
                        <div class="cartWizard">
                            <table cellspacing="40" class="tblCart">
                                <tr>
                                    <td class="cartImageContainer">
                                        <asp:Image ID="imgProductImage" ImageUrl='<%#Eval("ProductImageURL") %>' runat="server" />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblProductName" runat="server" Text='<%#Eval("ProductName") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlQuantity" runat="server">
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                            <asp:ListItem>5</asp:ListItem>
                                            <asp:ListItem>6</asp:ListItem>
                                            <asp:ListItem>7</asp:ListItem>
                                            <asp:ListItem>8</asp:ListItem>
                                            <asp:ListItem>9</asp:ListItem>
                                            <asp:ListItem>10</asp:ListItem>
                                            <asp:ListItem>11</asp:ListItem>
                                            <asp:ListItem>12</asp:ListItem>
                                            <asp:ListItem>13</asp:ListItem>
                                            <asp:ListItem>14</asp:ListItem>
                                            <asp:ListItem>15</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        *
                                    </td>
                                    <td>
                                        <asp:Label ID="lblPrice" runat="server" Text='<%#"Rs. "+Eval("ProductPrice") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="lnkRemoveItem" runat="server" Style="color: White; background: silver;
                                            padding: 5px; border-radius: 5px" OnClick="lnkRemoveItem_Click" CausesValidation="False">X</asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep2" runat="server" Title="Step 2">
                <asp:Panel ID="Panel1" runat="server" DefaultButton="btnPay">
                    <div class="userForm">
                        <div class="formTitle">
                            CHECKOUT
                        </div>
                        <div class="formContent">
                            <asp:RadioButton ID="rdoDebitCard" Text="Debit Card" GroupName="card" runat="server"
                                OnCheckedChanged="rdoDebitCard_CheckedChanged" AutoPostBack="True" />
                            <asp:RadioButton ID="rdoCredit" Text="Credit Card" GroupName="card" runat="server"
                                AutoPostBack="True" OnCheckedChanged="rdoCredit_CheckedChanged" />
                            <asp:TextBox ID="txtCardNumber" placeholder="Your card Number" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCardNumber"
                                Display="Dynamic" ErrorMessage="Please enter a valid card number." ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtCardNumber"
                                Display="Dynamic" ErrorMessage="Please fill 16 digit valid card number" 
                                ForeColor="Red" ValidationExpression="^[0-9]{16}"></asp:RegularExpressionValidator>
                            <br />
                            <asp:TextBox ID="txtCVV" placeholder="CVV Code" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCVV"
                                Display="Dynamic" ErrorMessage="CVV code is required" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtCVV"
                                ErrorMessage="Please fill 3 digit valid CVV number" ForeColor="Red" 
                                ValidationExpression="^[0-9]{3}"></asp:RegularExpressionValidator>
                            <br />
                            <asp:TextBox ID="txtAmount" placeholder="Amount to pay" Enabled="false" runat="server"></asp:TextBox>
                            <asp:Label ID="lblStatus" runat="server" Text="" ForeColor="Green"></asp:Label>
                            <asp:Button ID="btnPay" runat="server" Text="Pay" OnClick="btnPay_Click" />
                        </div>
                    </div>
                </asp:Panel>
            </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 346px;
        }
        .style3
        {
            width: 346px;
            height: 216px;
        }
        .style4
        {
            height: 216px;
        }
    </style>
</asp:Content>
