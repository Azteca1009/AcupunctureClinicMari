// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(function() {

  // trが押されたなら
  $("tr[data-link]").click(function() {
    window.location.href = $(this).data("link");
  });

});
