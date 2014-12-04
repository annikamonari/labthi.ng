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


