//= require jquery
//= require jquery.turbolinks
//= require jquery-ui
//= require jquery_ujs
//= require tether
//= require bootstrap-sprockets
//= require bootstrap-notify
//= require autocomplete-rails
//= require_tree .
//= require cocoon
// jQuery for page scrolling feature - requires jQuery Easing plugin

$(function() {
    $('a.page-scroll').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1500, 'easeInOutExpo');
        event.preventDefault();
    }); 
});
// Highlight the top nav as scrolling occurs
$('body').scrollspy({
    target: '.navbar-fixed-top'
})
// Closes the Responsive Menu on Menu Item Click
$('.navbar-collapse ul li a').click(function() {
    $('.navbar-toggle:visible').click();
});
// Closes the Responsive Menu on Click outside Menu
$(document).on('click',function(){
  $('.collapse').collapse('hide');
})
