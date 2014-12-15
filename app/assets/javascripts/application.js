// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootsy
//= require faye
//= require chats
//= require turbolinks
//= require twitter/bootstrap
//= require_tree .
//= require ajax401
//= require documentation
//= require solutions
//= require questions
//= require answers



$(document).on('page:fetch', function(){
	$(".container-main").fadeTo(40, 0.6);
});

$(document).on('page:change', function(){
	$(".container-main").css("opacity","1");
});


$(document).ready(function () {
    doBounce($('#help'), 10, '10px', 300);
    $('#help').on({
      mouseenter:
          function() {
            $('#help').stop(true, true).removeAttr('style');
            $('#close').show();
          },

      mouseleave:
          function() {
            window.nomouse = true;
            doBounce($(this), 10, '10px', 300);
            $('#close').hide();
          }

    });
    function doBounce(element, times, distance, speed) {
      for(var i = 0; i < times; i++) {
        element.animate({marginTop: '-='+distance}, speed)
            .animate({marginTop: '+='+distance}, speed);
      }        
    }
    $('#help').click(function() {
      $('#pop').hide()
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

$(document).ready(function () { 
  $('#tooltip').tooltip({
    trigger: 'hover',
        'placement': 'bottom',
        'container': "body",
    html: true
  });
});


$(document).ready(function () { 
  $(' .chatform.form-control').keypress( function( e ) {
    if( e.keyCode == 13 && !e.shiftKey) { 
      $(this).closest('form').trigger('submit'); 
      $(this).val().replace("\n", "<br />", "g")
      return false;
    }
    else if (e.keyCode == 13 && e.shiftKey) {
      $(this).val( $(this).val() + "\n" );
    }
  });
});

$(document).ready(function() {
  $('#chats').animate({scrollTop: $('#chats').prop("scrollHeight")}, 10);
});