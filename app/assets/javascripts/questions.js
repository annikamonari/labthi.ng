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
  $("#add-question-comment").click(function() {
    $("div.no-comments").hide();
    $('#add-comment-line').hide();
    $('#questioncomments').show();
    $('#questioncomments').children('ul').children('div.content-bg.comment-form').show();
    $("#showcomments").hide();
    $("#hidecomments").show();
    $(this).hide();
  });
});

$(document).ready(function() {
  $("a.cancel-question-comment").click(function() {
    $("div.no-comments").show();
    $('#add-comment-line').show();
    $(this).parent().hide();
    $('#add-question-comment').show();
  });
});
