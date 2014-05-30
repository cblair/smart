$('div.rider-alerts-content').hide()

jQuery(function($) {
    $(document).ready(function () {

        //$('div.rider-alerts-content').hide();
        $(this).find('div.home-box-content').animate({opacity: 0}, 5);
        console.log("TS7");

        $("div.home-box").hover(
            //On.
            function() {
                //$(this).find('div.home-box-content').fadeIn(500);
                $(this).find('div.home-box-content').animate({opacity: 100}, 500);
                console.log("TS11");
            //Off.
            }, function() {
                console.log("TS13");
                //$(this).find('div.home-box-content').fadeOut(500);
                $(this).find('div.home-box-content').animate({opacity: 0}, 500);
            }
        );
    });
});