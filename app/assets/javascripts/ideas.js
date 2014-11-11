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
            doBounce($(this), 20, '10px', 300);
            $('#close').hide();
          }

    });

    $('#help').click(function() {
      $('#helpcontent').hide();
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
      $('#imghelp').show()      
    });
    
});

$(document).ready(function () {
    doBounce($('#helpimg'), 20, '10px', 300);
    $('#helpimg').on({
      mouseenter:
          function() {
            $('#helpimg').stop(true, true).removeAttr('style');
            $('#closeimg').show();
          },

      mouseleave:
          function() {
            doBounce($(this), 20, '10px', 300);
            $('#closeimg').hide();
          }

    });
    $('#helpimg').click(function() {
      $('#imghelp').hide()
    });
    
});

$(document).ready(function () {
    doBounce($('#helparchive'), 20, '10px', 300);
    $('#helparchive').on({
      mouseenter:
          function() {
            $('#helparchive').stop(true, true).removeAttr('style');
            $('#closearchive').show();
          },

      mouseleave:
          function() {
            doBounce($(this), 20, '10px', 300);
            $('#closearchive').hide();
          }

    });
    $('#helparchive').click(function() {
      $('#archivehelp').hide();
      $('#buyhelp').show();
    });
    
});

$(document).ready(function () {
    doBounce($('#helpbuy'), 20, '10px', 300);
    $('#helpbuy').on({
      mouseenter:
          function() {
            $('#helpbuy').stop(true, true).removeAttr('style');
            $('#closebuy').show();
          },

      mouseleave:
          function() {
            doBounce($(this), 20, '10px', 300);
            $('#closebuy').hide();
          }

    });
    $('#helpbuy').click(function() {
      $('#buyhelp').hide();
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


