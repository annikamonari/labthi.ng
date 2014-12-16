$(document).ready(function() {
  $("a.reply-comment").click(function() {
    $(this).siblings('ul').children('div.white-bg.comment-form').show();
    $(this).hide();
  });
});

$(document).ready(function() {
  $("a.cancel-comment-comment").click(function() {
    $(this).parent().hide();
    $(this).parent().parent().siblings($('.reply-comment')).show();
  });
});