$(document).ready(function() {
    $( "#hidecomments" ).click(function() {
    $( "#taskcomments" ).hide();
    $("#showcomments").show();
    $("#hidecomments").hide();
  });
});

$(document).ready(function() {
    $( "#showcomments" ).click(function() {
    $( "#taskcomments" ).show();
    $("#hidecomments").show();
    $("#showcomments").hide();
  });
});