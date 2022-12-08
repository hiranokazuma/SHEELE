jQuery(document).bind('ready ajaxComplete', function() {
  $('.select-users').change(function() {
      $(this).parent().submit();
    });
});