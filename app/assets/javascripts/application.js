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
//= require jquery_ujs
//= require best_in_place.purr
//= require best_in_place
//= require jquery.turbolinks
//= require turbolinks
//= require twitter/bootstrap
//= require_tree .

$(document).ready(function() {
  /* Activating Best In Place */
  jQuery(".best_in_place").best_in_place();

	jQuery.fn.voteUpdate = function() {
	  this.click(function() {
	  	$(this).siblings().removeClass("active");
	  	$(this).addClass("active");

	  	var value = 0;
	  	if ($(this).hasClass("vote-up")){
	  		value = 1;
	  	}
	  	else if ($(this).hasClass("vote-down")){
	  		value = -1;
	  	}
	  	var $voteCount = $("p span.vote-count");
	  	var prevVal = parseInt($voteCount.html());
	  	console.log(value);
	  	$voteCount.html(prevVal + value);

	  });

	};

	// Here's an example of the class that will be 'clicked'
	$(".vote").voteUpdate();
});