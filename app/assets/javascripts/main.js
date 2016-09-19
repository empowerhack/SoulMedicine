
$(function() {
    $('.message .close')
      .on('click', function() {
        $(this)
          .closest('.message')
          .transition('fade')
        ;
      })
    ;
    
    $('select.dropdown')
      .dropdown()
    ;
});