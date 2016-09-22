
$( document ).on('page:change', function() {
  $('.message .close').on('click', function() {
    $(this).closest('.message').transition('fade');
  });
    
  $('.ui.sidebar').sidebar('attach events', '.toc.item');
  
  $('select.dropdown').dropdown();
  $('.ui.checkbox').checkbox();
});