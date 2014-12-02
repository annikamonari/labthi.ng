$(document).ready(function() {
    $("a.showactivity" ).click(function() {
        console.log($(this).text())
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

