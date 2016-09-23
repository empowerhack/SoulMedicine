var ready;
ready = function() {
  console.log('Page ready');

    
  $('.ui.sidebar').sidebar('attach events', '.toc.item');

  $('select.dropdown').dropdown();
  $('.ui.checkbox').checkbox();

};

  $('.message .close').on('click', function() {
    $(this).closest('.message').transition('fade');
  });
  $('.toc.item').on('click', function() {
    console.log('Sidebar toggled');
    $('.ui.sidebar').sidebar('toggle');
  });



$(document).ready(function () { console.log('Ready to execute'); ready(); });
$(document).on('page:change', ready);