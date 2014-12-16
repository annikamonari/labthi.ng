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

$(document).ready(function () {
    doBounce($('#questhelp'), '10px', 300);
    $('#questhelp').on({
      mouseenter:
          function() {
            $('#questhelp').stop(true, true).removeAttr('style');
            $('#closequest').show();
          },

      mouseleave:
          function() {
            window.nomouse = true;
            doBounce($(this), '10px', 300);
            $('#closequest').hide();
          }

    });

    $('#questhelp').click(function() {
      $('#popquest').hide()
      $('#helpans').show()
    });
    
});

$(document).ready(function () {
    doBounce($('#anshelp'),'10px', 300);
    $('#anshelp').on({
      mouseenter:
          function() {
            $('#anshelp').stop(true, true).removeAttr('style');
            $('#closeans').show();
          },

      mouseleave:
          function() {
            doBounce($(this), '10px', 300);
            $('#closeans').hide();
          }

    });
    $('#anshelp').click(function() {
      $('#helpans').hide()
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
