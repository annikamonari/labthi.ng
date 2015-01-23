$(document).ready(function() {
    $("a.showsolcomments" ).click(function() {
        $(this).text()
        if ($(this).text() == 'Show Solution Comments') {
            $(this).siblings($( "div.activity.content-bg" )).show();
            $(this).text('Hide Solution Comments');
        }
        else {
            $(this).siblings(("div.solutioncomments")).hide();
            $(this).text('Show Solution Comments')
        }
  });
});

$(document).ready(function() {
  $("#newsolution").click(function() {
    $(this).siblings(' .solution-form').show();
    $(this).hide();
  });
});

$(document).ready(function() {
  $("#cancel-solution").click(function() {
    $(this).parent().hide();
    $("#newsolution").show();
  });
});
