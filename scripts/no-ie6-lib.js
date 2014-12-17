jQuery.noConflict();
jQuery(document).ready(function($) {
    $("#no-ie6").hide();
    $("#no-ie6").slideDown(700);
    $("#no-ie6_close").click(function() {
        $("#no-ie6").slideUp(600);
    });
});