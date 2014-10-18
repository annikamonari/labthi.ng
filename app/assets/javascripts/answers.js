$(document).ready(function() {
    $("a.showanscomments" ).click(function() {
        $(this).text()
        if ($(this).text() == 'Show Answer Comments') {
            $(this).siblings($( "div.media-body.answercomments" )).show();
            $(this).text('Hide Answer Comments');
        }
        else {
            $(this).siblings(("div.answercomments")).hide();
            $(this).text('Show Answer Comments')
        }
  });
});