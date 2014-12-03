$(document).ready(function() {
    $("a.showactivity" ).click(function() {
        $(this).text();
        if ($(this).text() == 'Show User Activity') {
            $(this).siblings($("div.activity")).show();
            $(this).text('Hide User Activity');
        }
        else {
            $(this).siblings(("div.activity")).hide();
            $(this).text('Show User Activity')
        }
  });
});

$(document).ready(function() {
    $("a.showskill" ).click(function() {
      $(this).siblings($("span.skillstats")).children(" .breakdowncomponent").toggle();  
    });
});

