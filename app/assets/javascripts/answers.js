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

//answer comments js

$(document).ready(function() {
  $("a.showanscomments" ).click(function() {
    $(this).toggle();
    $(this).parent().siblings(" .media-body.answercomments").toggle();
    $(this).siblings("a.hideanscomments").toggle();
  });
});

$(document).ready(function() {
  $("a.hideanscomments").click(function() {
    $(this).toggle();
    $(this).parent().siblings(" .media-body.answercomments").toggle();
    $(this).siblings("a.showanscomments").toggle();
  });
});

$(document).ready(function() {
  $("a.add-answer-comment").click(function() {
    $(this).parent().siblings(" .media-body.answercomments").show();
    $(this).parent().siblings(" .media-body.answercomments").children('ul').children(' .white-bg.comment-form').show();
    $(this).hide();
    $(this).siblings(' .add-comment-bar.link-dis').hide();
    $(this).siblings("a.hideanscomments").show();
    $(this).siblings("a.showanscomments").hide();
  });
});

$(document).ready(function() {
  $("a.cancel-answer-comment").click(function() {
    $(this).parent().hide();
    $(this).parent().parent().parent().siblings('div.pull-right').children(' .add-comment-bar.link-dis').show();
    $(this).parent().parent().parent().siblings('div.pull-right').children(' .add-answer-comment').show();
  });
});

