$(document).ready(function() {
  $("a.showcomments").click(function() {
    $(this).show();
    $(this).children().toggle();
    $(this).parent().siblings('ul').toggle();   
  });
});

$(document).ready(function() {
    $("button.btn.btn-info.pull-right.comment" ).click(function() {
      $(this).parent().siblings('ul').children('div').show();
      $(this).hide();
  });
});

$(document).ready(function() {
    $("a.cancel-comment" ).click(function() {
        $(this).parent().hide();
        $(this).parent().parent().prev().prev().children('button').show();
  });
});

