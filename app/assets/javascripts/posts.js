$(document).ready(function() {
    $("#newpost" ).click(function() {
        $('#posts').show();
          $(this).hide();
  });
});

$(document).ready(function() {
    $("#cancel" ).click(function() {
        $('#posts').hide();
        $("#newpost").show();
  });
});

$(document).ready(function() {
    $("a.showstats" ).click(function() {
        $(this).text()
        if ($(this).text() == 'Show User Statistics') {
            $(this).siblings($( "div.userstats.white-bg" )).show();
            $(this).text('Hide User Statistics');
        }
        else {
            $(this).siblings(("div.userstats.white-bg")).hide();
            $(this).text('Show User Statistics')
        }
  });
});


