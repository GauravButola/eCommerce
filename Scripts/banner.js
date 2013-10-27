$(document).ready(function () {
    setInterval(function () {
        var num = Math.floor((Math.random() * 3) + 1);
        $('.banner img').attr('src', "Site_data/site_images/banners/banner" + num + ".jpg");
        var link = $('.BannerContainer a');
        switch (num) {
            case 1:
                link.attr('href', 'search.aspx?category=footwear');
                break;
            case 2:
                link.attr('href', 'search.aspx?category=camera');
                break;
            case 3:
                link.attr('href', 'search.aspx?category=clothes');
                break;
        }
    }, 3000);

    $('.forBanner1').hover(function () {
        $('.banner img').attr('src', "Site_data/site_images/banners/banner1.jpg");
    }, function () { });
    $('.forBanner2').hover(function () {
        $('.banner img').attr('src', "Site_data/site_images/banners/banner2.jpg");
    }, function () { });
    $('.forBanner3').hover(function () {
        $('.banner img').attr('src', "Site_data/site_images/banners/banner3.jpg");
    }, function () { });
});