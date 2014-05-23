jQuery(function($) {


    function sleep(millis, callback) {
        setTimeout(function()
                { callback(); }
        , millis);
    }

    function play_slideshow() {
        var current_images = $('img.slideshow');
        var slideshow_images = $('div.slideshow-hidden img');

        //Set picture index to a random element 
        var current_image_i = Math.floor((Math.random() * current_images.length)
            + 1);
        var slideshow_image_i = Math.floor(
            (Math.random() * slideshow_images.length) + 1);

        //Fade the current picture out.
        $(current_images[current_image_i]).fadeOut(1500);
        //Fade in the new images.
        $(current_images[current_image_i]).replaceWith(
            slideshow_images[slideshow_image_i]);
        $(current_images[current_image_i]).fadeIn(1500);

        //Loop forever with timeout to do the slideshow.
        sleep(7000, play_slideshow);
    }

    $(document).ready(function () {

        //play_slideshow();
    });
});