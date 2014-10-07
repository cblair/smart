$('div.rider-alerts-content').hide()

jQuery(function($) {
    $(document).ready(function () {

        //$('div.rider-alerts-content').hide();
        $(this).find('div.home-box-content').animate({opacity: 0}, 5);

        $("div.home-box").hover(
            //On.
            function() {
                var home_box_content = $(this).find('div.home-box-content');
                home_box_content.animate({opacity: 100}, 500);

                //Enable links.
                //TODO: doesn't work in Firefox.
                //home_box_content.find('a.box-link').bind('click', function (e) {});
            //Off.
            }, function() {
                var home_box_content = $(this).find('div.home-box-content');
                home_box_content.animate({opacity: 0}, 500);

                //Disable links.
                //TODO: doesn't work in Firefox.
                //home_box_content.find('a.box-link').bind('click', function (e) {console.log(this); e.preventDefault();});
            }
        );
    });
});