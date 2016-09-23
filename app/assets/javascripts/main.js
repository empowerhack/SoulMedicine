
$( document ).on('ready page:change', function() {
    $('.message .close').on('click', function() {
      $(this).closest('.message').transition('fade');
    });
      
    $('.ui.sidebar').sidebar('attach events', '.toc.item');
    $('.toc.item').on('click', function() {
     $('.ui.sidebar').sidebar('toggle');
    });
    
    $('select.dropdown').dropdown();
    $('.ui.checkbox').checkbox();
  });