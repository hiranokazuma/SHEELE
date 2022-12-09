const { environment } = require('@rails/webpacker')

const webpack = require('webpack')

environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery'
  })
)

jQuery(document).bind('ready ajaxComplete', function() {
  $('.select-users').change(function() {
      $(this).parent().submit();
    });
});

module.exports = environment
