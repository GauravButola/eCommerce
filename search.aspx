<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderFooter.master" AutoEventWireup="true"
    CodeFile="search.aspx.cs" Inherits="search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="left_sidebar">
    </div>
    <div class="search_page">
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <div class="productShowcase">
                    <div class="showcaseImage">
                        <asp:HyperLink ID="lnkImageLinkTo" NavigateUrl='<%# "product.aspx?ProductID="+Eval("ProductID") %>'
                            runat="server">
                            <asp:Image ID="imgProduct" ImageUrl='<%#Eval("ProductImageURL") %>' runat="server" />
                        </asp:HyperLink>
                    </div>
                    <div class="showcaseFooter">
                        <div class="showcaseTitle">
                            <asp:HyperLink ID="lnkProductTitle" Text='<%#Eval("ProductName") %>' runat="server"></asp:HyperLink>
                        </div>
                        <div class="showcasePrice">
                            Rs.
                            <asp:Label ID="lblPrice" runat="server" Text='<%#Eval("ProductPrice") %>'></asp:Label>
                        </div>
                        <div class="buyLink">
                            <asp:HyperLink ID="lnkOrder" NavigateUrl='<%# "product.aspx?ProductID="+Eval("ProductID") %>'
                                runat="server">Order</asp:HyperLink>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
