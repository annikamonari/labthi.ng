$(document).ready(function() {
    $("a.hidecomments").click(function() {
        $(this).next().next().next().hide();
        $(this).hide();
        $(this).next().show();
    });
});

$(document).ready(function() {
    $("a.showcomments").click(function() {
        $(this).next().next().show();
        $(this).hide();
        $(this).prev().show();
    });
});