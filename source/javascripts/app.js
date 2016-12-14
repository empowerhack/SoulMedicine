//= require vendor/jquery.min
//= require vendor/semantic


var ready = function() {
    
  $('.ui.sidebar').sidebar('attach events', '.toc.item');

  $('select.dropdown').dropdown();
  $('.ui.checkbox').checkbox();
  
  $('.message .close').on('click', function() {
    $(this).closest('.message').fadeOut();
  });
  $('.toc.item').on('click', function() {
    console.log('Sidebar toggled');
    $('.ui.sidebar').sidebar('toggle');
  });

};



$(document).ready(function () { console.log('Page Ready'); ready(); });