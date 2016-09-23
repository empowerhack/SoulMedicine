var ready;
ready = function() {
  console.log('Page ready');

  $('.message .close').on('click', function() {
    $(this).closest('.message').transition('fade');
  });
    
  $('.ui.sidebar').sidebar('attach events', '.toc.item');
  $('.toc.item').on('click', function() {
    console.log('Sidebar toggled');
    $('.ui.sidebar').sidebar('toggle');
  });

  $('select.dropdown').dropdown();
  $('.ui.checkbox').checkbox();

};
