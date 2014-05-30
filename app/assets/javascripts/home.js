$('div.rider-alerts-content').hide()

jQuery(function($) {
    $(document).ready(function () {

        //$('div.rider-alerts-content').hide();
        $(this).find('div.home-box-content').animate({opacity: 0}, 5);

        $("div.home-box").hover(
            //On.
            function() {
                //$(this).find('div.home-box-content').fadeIn(500);
                $(this).find('div.home-box-content').animate({opacity: 100}, 500);
            //Off.
            }, function() {
                //$(this).find('div.home-box-content').fadeOut(500);
                $(this).find('div.home-box-content').animate({opacity: 0}, 500);
            }
        );
    });
});