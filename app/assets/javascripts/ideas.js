$(document).ready(function () {
    doBounce($('#help'), '10px', 300);
    $('#help').on({
      mouseenter:
          function() {
            $('#help').stop(true, true).removeAttr('style');
            $('#close').show();
          },

      mouseleave:
          function() {
            doBounce($(this), '10px', 300);
            $('#close').hide();
          }

    });

    $('#help').click(function() {
      $('#helpcontent').hide();
      $('#navhelp').show();
    });
    
});

$(document).ready(function () {
    doBounce($('#helpnav'), '10px', 300);
    $('#helpnav').on({
      mouseenter:
          function() {
            $('#helpnav').stop(true, true).removeAttr('style');
            $('#closenav').show();
          },

      mouseleave:
          function() {
            doBounce($(this), '10px', 300);
            $('#closenav').hide();
          }

    });
    $('#helpnav').click(function() {
      $('#navhelp').hide();
      $('#archivehelp').show();      
    });
    
});

$(document).ready(function () {
    doBounce($('#helpimg'), '10px', 300);
    $('#helpimg').on({
      mouseenter:
          function() {
            $('#helpimg').stop(true, true).removeAttr('style');
            $('#closeimg').show();
          },

      mouseleave:
          function() {
            doBounce($(this), '10px', 300);
            $('#closeimg').hide();
          }

    });
    $('#helpimg').click(function() {
      $('#imghelp').hide();
      $('#buyhelp').show();
    });
});

$(document).ready(function () {
    doBounce($('#helparchive'), '10px', 300);
    $('#helparchive').on({
      mouseenter:
          function() {
            $('#helparchive').stop(true, true).removeAttr('style');
            $('#closearchive').show();
          },

      mouseleave:
          function() {
            doBounce($(this), '10px', 300);
            $('#closearchive').hide();
          }

    });
    $('#helparchive').click(function() {
      $('#archivehelp').hide();
      $('#buyhelp').show();
    });
    
});

$(document).ready(function () {
    doBounce($('#helpbuy'), '10px', 300);
    $('#helpbuy').on({
      mouseenter:
          function() {
            $('#helpbuy').stop(true, true).removeAttr('style');
            $('#closebuy').show();
          },

      mouseleave:
          function() {
            doBounce($(this), '10px', 300);
            $('#closebuy').hide();
          }

    });
    $('#helpbuy').click(function() {
      $('#buyhelp').hide();
    });
    
});

$(document).ready(function () { 
  $('selector').popover(options);
});

var options = {
    placement: function (context, source) {
        var position = $(source).parent().offset();
        if (position.top < 110){
            return "bottom";
        }
        if (position.left > 515) {
            return "left";
        }
        if (position.left < 515) {
            return "right";
        }

        return "top";
    }, 
    trigger: "hover",
    html: true,
    container: 'body'
};


function doBounce(element, distance, speed) {
  for(var i = 0; i < 40; i++) {
     element.animate({marginTop: '-='+distance}, speed)
        .animate({marginTop: '+='+distance}, speed);
  }        
}


