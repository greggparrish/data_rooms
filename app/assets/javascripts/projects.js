$(function() {
  var allBox = $(':checkbox[name=select_all]');
  var oneBox = $(':checkbox[name^="document"]');
  allBox.click (function () {
    oneBox.prop('checked', this.checked);
  });
  oneBox.click (function () { 
    allBox.attr('checked', false);
  });
});
