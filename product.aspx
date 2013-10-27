<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderFooter.master" AutoEventWireup="true"
    CodeFile="product.aspx.cs" Inherits="product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="productUpperPart">
        <div class="productImageContainer">
            <asp:Image ID="imgProductImage" ImageUrl="" runat="server" />
        </div>
        <div class="productInfo">
            <div class="title">
                <asp:Label ID="lblName" runat="server" Text="Product Name"></asp:Label>
                <br />
            </div>
            <hr />
            <asp:Label ID="lblDescription" Style="font-size: 13px" runat="server" Text="Description"></asp:Label>
            <br />
            <div class="price">
                <asp:Label ID="lblPrice" runat="server" Text="Rs. "></asp:Label>
            </div>
            <asp:Button ID="btnBuy" CssClass="buyButton" runat="server" Text="BUY NOW" 
                OnClick="btnBuy_Click" CausesValidation="False" />
        </div>
    </div>
    <div class="featureList">
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" CellSpacing="10" ForeColor="#333333"
            GridLines="None" Width="805px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    </div>

    <asp:Panel ID="Panel1" runat="server">
        <div class="userForm reviewForm">
            <div class="formTitle reviewFormTitle">
                ADD REVIEW
            </div>
            <div class="formContent reviewFormContent">
                <asp:TextBox ID="txtReviewTitle" placeholder="Review Title" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="Please title your review." 
                    ControlToValidate="txtReviewTitle" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtReviewDetail" placeholder="Add your review"  runat="server" Rows="8" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="Please tell us what you think about the product." 
                    ControlToValidate="txtReviewDetail" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator><br />
                <asp:Label ID="Label4" runat="server" Text="Rating"></asp:Label>
                <asp:DropDownList ID="ddlRatings" runat="server">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="btnPost" runat="server" Text="Post Review" 
                    onclick="btnPost_Click" />
            </div>
        </div>
    </asp:Panel>    
    <span style="font-size:20px">Product Review:</span>
    <hr />
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <div class="reviewContainer">
                <div class="userInfo">
                    <h4>
                        <asp:Label ID="lblUserName" runat="server" Text='<%#Eval("CustomerName") %>'></asp:Label></h4>
                    <div class="stars">
                        Rating: <%#Eval("Rating") %>
                    </div>
                    <div class="date">
                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("ReviewDate") %>'></asp:Label>
                    </div>
                </div>
                <div class="reviewContent">
                    <div class="reviewTitle">
                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("ReviewTitle") %>'></asp:Label>
                    </div>
                    <div class="reviewDetails">
                        <asp:Label ID="Label3" runat="server" Text='<%#Eval("ReviewDescription") %>'></asp:Label>
                    </div>
                </div>
            </div>
            <hr />
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
