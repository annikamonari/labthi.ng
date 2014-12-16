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

$(document).ready(function() {
  $("#newanswer" ).click(function() {
    $('#answerform').show();
    $(this).hide();
  });  
});

$(document).ready(function() {
  $("#cancelanswerform" ).click(function() {
    $('#answerform').hide();
    $("#newanswer" ).show();
  });
});

$(document).ready(function() {
  $("#showanswers" ).click(function() {
    $('#answers').toggle();
  });  
});

$(document).ready(function() {
  $("a.add-answer-comment").click(function() {
    $(this).parent().siblings('ul').children('div.content-bg.comment-form').show();
    $(this).hide();
  });
});

$(document).ready(function() {
  $("a.cancel-answer-comment").click(function() {
    $(this).parent().hide();
    $(this).parent().parent().siblings('p').children($(' .add-answer-comment')).show();
  });
});