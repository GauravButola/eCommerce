$(document).ready(function () {

    //Caching nav offset from top
    var navPosition = $('.stickyNav').offset().top;
    $(window).scroll(function () {
        //If page scrolls past navbar
        if (navPosition < $(window).scrollTop()) {
            //Add navtop class; keeps nav on top
            $('.stickyNav').addClass('navTop');
        }
        else {
            $('.stickyNav').removeClass('navTop');
        }
    });

    //Hide or show review form
    $('.reviewFormTitle').on('click', function () {
        $('.reviewFormContent').slideToggle();
    });
});