jQuery.noConflict();
jQuery(document).ready(function($) {
    if(document.getElementById("no-ie6")) {
        $("#no-ie6 #no-ie6_close").addClass("to_script");
        $("#no-ie6").hide();
        $("#no-ie6").slideDown(700);
        $("#no-ie6_close").click(function() {
            $("#no-ie6").slideUp(600);
        });
    }    
});