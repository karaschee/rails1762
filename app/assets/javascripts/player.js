//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require jplayer
//= require iscroll/5.1.1/iscroll.js
//= require tinytip


$(function(){
  // resize and load page
  
  var toph = $('.gp_topbar').height();
  var footerh = $('.gp_footerControl').height();

  var elemMain = $('.gp_wrapper').add('.gp_footerControl');
  var elemWaiting = $('.gp_waiting');

  function resizeWin(){
    var w = $(window);
    var wh = w.height();
    var rh = wh-toph-footerh;
    $('.gp_wrapper').height(rh);
  }

  $(window).on('resize', resizeWin);

  elemWaiting.hide();
  elemMain.show();

  resizeWin();
});