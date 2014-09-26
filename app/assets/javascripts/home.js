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

                //TODO: Enable links.
                //home_box_content.find('a.box-link').unbind('click');
            //Off.
            }, function() {
                var home_box_content = $(this).find('div.home-box-content');
                home_box_content.animate({opacity: 0}, 500);

                //TODO: Disable links.
                //console.log(home_box_content.find('a.box-link'));
                //home_box_content.find('a.box-link').click(function () {return false;});
            }
        );
    });
});