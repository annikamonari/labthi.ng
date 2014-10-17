$(document).ready(function() {
    $("a.showsolcomments" ).click(function() {
        $(this).text()
        if ($(this).text() == 'Show Solution Comments') {
            $(this).siblings($( "div.media-body.solutioncomments" )).show();
            $(this).text('Hide Solution Comments');
        }
        else {
            $(this).siblings(("div.solutioncomments")).hide();
            $(this).text('Show Solution Comments')
        }
  });
});