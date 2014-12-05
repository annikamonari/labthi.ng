$(document).ready(function() {
  $("a.showapps" ).click(function() {
    $("#apps").toggle();   
  });
});

$(document).ready(function() {
    $("#newapp" ).click(function() {
        $('#teamapps').show();
          $(this).hide();
  });
});

$(document).ready(function() {
    $("#cancel" ).click(function() {
        $('#teamapps').hide();
        $("#newapp").show();
  });
});
