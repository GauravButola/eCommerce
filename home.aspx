<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderFooter.master" AutoEventWireup="true"
    CodeFile="home.aspx.cs" Inherits="home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript" src="Scripts/banner.js"></script>

    <div class="main">
        <div class="banner">
            <div class="BannerContainer">
                <a href="search.aspx?category=footwear">
                    <img src="Site_data/site_images/banners/banner1.jpg" alt="slideshow banner" />
                </a>
            </div>
        </div>
        <div class="bannerDetails">
            <a href="search.aspx?category=footwear"><span class="detail forBanner1">Men's footwear
                on discount</span></a><a href="search.aspx?category=camera"><span class="detail forBanner2">Cameras
                    on discount</span></a><a href="search.aspx?category=clothes"><span class="detail forBanner3">Buy
                        clothes</span></a>
        </div>
        <div class="categories">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="productShowcase">
                        <div class="showcaseCategory">
                            <span class="leftButton">
                                <asp:Button ID="btnPrev" runat="server" Text="<" OnClick="btnPrev_Click" /></span>
                            MOBILES <span class="rightButton">
                                <asp:Button ID="btnNext" runat="server" Text=">" OnClick="btnNext_Click" /></span>
                        </div>
                        <div class="showcaseImage">
                            <asp:HyperLink ID="lnkImageLinkTo" runat="server">
                                <asp:Image ID="imgProduct" runat="server" />
                            </asp:HyperLink>
                        </div>
                        <div class="showcaseFooter">
                            <div class="showcaseTitle">
                                <asp:HyperLink ID="lnkProductTitle" runat="server"></asp:HyperLink>
                            </div>
                            <div class="showcasePrice">
                                Rs.<asp:Label ID="lblPrice" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div class="buyLink">
                                <asp:HyperLink ID="lnkOrder" runat="server">Order</asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="productShowcase">
                        <div class="showcaseCategory">
                            <span class="leftButton">
                                <asp:Button ID="btnPrevBook" runat="server" Text="<" OnClick="btnPrevBook_Click" /></span>
                            BOOKS <span class="rightButton">
                                <asp:Button ID="btnNextBook" runat="server" Text=">" OnClick="btnNextBook_Click" /></span>
                        </div>
                        <div class="showcaseImage">
                            <asp:HyperLink ID="lnkImageLinkToBook" runat="server">
                                <asp:Image ID="imgProductBook" runat="server" />
                            </asp:HyperLink>
                        </div>
                        <div class="showcaseFooter">
                            <div class="showcaseTitle">
                                <asp:HyperLink ID="lnkBookTitle" runat="server"></asp:HyperLink>
                            </div>
                            <div class="showcasePrice">
                                Rs.<asp:Label ID="lblBookPrice" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div class="buyLink">
                                <asp:HyperLink ID="lnkBookOrder" runat="server">Order</asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="productShowcase">
                        <div class="showcaseCategory">
                            <span class="leftButton">
                                <asp:Button ID="btnClothesPrev" runat="server" Text="<" OnClick="btnClothesPrev_Click" /></span>
                            CLOTHES <span class="rightButton">
                                <asp:Button ID="btnClothesNext" runat="server" Text=">" OnClick="btnClothesNext_Click" /></span>
                        </div>
                        <div class="showcaseImage">
                            <asp:HyperLink ID="lnkImageLinkToClothes" runat="server">
                                <asp:Image ID="imgProductClothes" runat="server" />
                            </asp:HyperLink>
                        </div>
                        <div class="showcaseFooter">
                            <div class="showcaseTitle">
                                <asp:HyperLink ID="lnkClothesTitle" runat="server"></asp:HyperLink>
                            </div>
                            <div class="showcasePrice">
                                Rs.<asp:Label ID="lblClothesPrice" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div class="buyLink">
                                <asp:HyperLink ID="lnkClothesOrder" runat="server">Order</asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <div class="sidebar">
        <div class="sideCard">
            <span>DEAL OF THE DAY</span>
            <br />
            <br />
            <p>
                The all new Nexus 7 tablet from Google with latest version of Android is deal of
                the day.</p>
            <br />
            <asp:HyperLink ID="HyperLink1" href="product.aspx?ProductID=31" runat="server">
            <img src="Site_data/nexus7.jpeg" alt="Nexus 7" /></asp:HyperLink>
            <br />
            <a href="~/product.aspx?ProductID=31">Shop Now</a>
        </div>
        <div class="sideCard">
            <span>SHOP WITH EASE</span>
            <br />
            <br />
            <p>
                eCommerce (Online Shopping) is a secure online shopping portal to easily get goods
                from the comfort of your home</p>
            <br />
            <img src="Site_data/site_images/cart_pink.png" alt="Nexus 7" />
            <br />
        </div>
    </div>
</asp:Content>
