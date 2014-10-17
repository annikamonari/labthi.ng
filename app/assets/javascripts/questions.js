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