$(document).ready(function() {
    $( "#hidecomments" ).click(function() {
    $( "#questioncomments" ).hide();
    $("#showcomments").show();
    $("#hidecomments").hide();
  });
});

$(document).ready(function() {
    $( "#showcomments" ).click(function() {
    $( "#questioncomments" ).show();
    $("#hidecomments").show();
    $("#showcomments").hide();
  });
});

$(document).ready(function() {
  $("a.add-question-comment").click(function() {
    $(this).parent().siblings('ul').children('div.content-bg.comment-form').show();
    $(this).hide();
  });
});

$(document).ready(function() {
  $("a.cancel-question-comment").click(function() {
    $(this).parent().hide();
    $(this).parent().parent().siblings('p').children($(' .add-question-comment')).show();
  });
});
