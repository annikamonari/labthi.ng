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

$(document).ready(function () { 
  $(' .vote-tooltip').tooltip({
    trigger: 'hover',
        'placement': 'bottom',
        'container': "body",
    html: true
  });
});

$(document).ready(function() {
  $("a.pull-right.showcomments").click(function() {
    if ($(this).text() == 'Hide Comments') {
      console.log($(this).parent().parent().parent().siblings().children())
      $(this).siblings().show();
      $(this).parent().parent().parent().siblings().children('ul.media-list.comments.answer-comments').hide();
      $(this).text('Show Comments');
    }
    else {
      $(this).parent().parent().parent().siblings().children('ul.media-list.comments.answer-comments').show();
      $(this).text('Hide Comments');
    }
  });
});

$(document).ready(function() {
  $("a.pull-right.comment" ).click(function() {
    if ($("a.pull-right.showcomments").text() == 'Hide CommentsHide Comments' || 'Hide Comments') {
      $(this).parent().parent().parent().parent().siblings().children('ul').children( '.commentform').show();
      $(this).hide();
      $(this).siblings(' .link-dis.pull-right').hide();
    }
  });  
});

$(document).ready(function() {
  $("a.cancel-comment" ).click(function() {
    $(this).parent().hide();
    $(this).parent().parent().parent().siblings().children().children().children().children().show();
  });
});



