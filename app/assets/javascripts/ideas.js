$(document).ready(function () { 
  helpcontent('#1', '#2-div');
  $('#1-pop-link').popover(options);
});

$(document).ready(function () { 
  helpcontent('#2', '#3-div');
  $('#2-pop-link').popover(options);
});

$(document).ready(function () { 
  helpcontent('#3', '#4-div');
  $('#3-pop-link').popover(options);
});

$(document).ready(function () { 
  helpcontent('#4', '#5-div');
  $('#4-pop-link').popover(options);
});

$(document).ready(function () { 
  helpcontent('#5', '#6-div');
  $('#5-pop-link').popover(options);
});

$(document).ready(function () { 
  helpcontent('#6', '#7-div');
  $('#6-pop-link').popover(options);
});


function helpcontent(number_id, next_div_id) {
    var div   = number_id + '-div'
    var img   = number_id + '-img'
    var close = number_id + '-close'
    if (next_div_id != false) {
      doBounce($(img), '10px', 300);
      $(img).on({
        mouseenter:
            function() {
              $(img).stop(true, true).removeAttr('style');
              $(close).show();
            },

        mouseleave:
            function() {
              doBounce($(this), '10px', 300);
              $(close).hide();
            }

      });

      $(img).click(function() {
        $(div).hide();
        $(next_div_id).show();
      });
    }
    else {
      doBounce($(img), '10px', 300);
      $(img).on({
        mouseenter:
            function() {
              $(img).stop(true, true).removeAttr('style');
              $(close).show();
            },

        mouseleave:
            function() {
              doBounce($(this), '10px', 300);
              $(close).hide();
            }

      });

      $(img).click(function() {
        $(div).hide();
      });
    } 
};

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


