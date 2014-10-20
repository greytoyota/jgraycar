$(document).ready(function() {
  var leftHeight = $('.left').css('height');
  var leftPxHeight = parseInt(leftHeight.split('px')[0]);
  leftPxHeight += 370;
  leftHeight = leftPxHeight + 'px'
  $('.right').css({'minHeight': leftHeight});
});
