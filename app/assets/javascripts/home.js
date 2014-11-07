$(document).ready(function() {
    $("#deviseform" ).click(function() {
        if ($(this).text() == 'Sign in') {
            $("div#register").hide();
            $("div#login" ).show();
            $(this).text('Sign up');
        }
        else {
            $("div#register").show();
            $("div#login" ).hide();
            $(this).text('Sign in')
        }
  });
});