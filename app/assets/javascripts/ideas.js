$(document).ready(function () {
    doBounce($('#help'), 20, '10px', 300);
    $('#help').on({
      mouseenter:
          function() {
            $('#help').stop(true, true).removeAttr('style');
            $('#close').show();
          },

      mouseleave:
          function() {
            window.nomouse = true;
            doBounce($(this), 20, '10px', 300);
            $('#close').hide();
          }

    });

    $('#help').click(function() {
      $('#pop').hide()
      $('#navhelp').show();
    });
    
});

$(document).ready(function () {
    doBounce($('#helpnav'), 20, '10px', 300);
    $('#helpnav').on({
      mouseenter:
          function() {
            $('#helpnav').stop(true, true).removeAttr('style');
            $('#closenav').show();
          },

      mouseleave:
          function() {
            doBounce($(this), 20, '10px', 300);
            $('#closenav').hide();
          }

    });
    $('#helpnav').click(function() {
      $('#navhelp').hide()
    });
    
});

$(document).ready(function () { 
  $('[data-toggle="popover"]').popover({
    trigger: 'hover',
        'placement': 'bottom',
        'container': "body",
    html: true
  });
});

function doBounce(element, times, distance, speed) {
  for(var i = 0; i < times; i++) {
     element.animate({marginTop: '-='+distance}, speed)
        .animate({marginTop: '+='+distance}, speed);
  }        
}


