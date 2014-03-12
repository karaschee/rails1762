//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require jplayer
//= require iscroll/5.1.1/iscroll.js

$(function(){
  // resize and load page
  
  var toph = $('.gp_topbar').height();
  var footerh = $('.gp_footerControl').height();

  var elemMain = $('.gp_wrapper').add('.gp_footerControl');
  var elemWaiting = $('.gp_waiting');

  $(window).on('resize', function(){
    var w = $(window);
    var wh = w.height();
    var rh = wh-toph-footerh;
    $('.gp_wrapper').height(rh);
  });

  elemWaiting.hide();
  elemMain.show();

  $(window).trigger('resize');

  // scorllbar init
  var iscrollconfig = {
    scrollbars: true,
    mouseWheel: true,
    interactiveScrollbars: true,
    shrinkScrollbars: 'scale',
    fadeScrollbars: true
  };

  var myScroll = new IScroll('#j_container', iscrollconfig);
  var myScroll = new IScroll('#j_cardsContainer', iscrollconfig);
  var myScroll = new IScroll('#j_sidebar', iscrollconfig);

  document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
});