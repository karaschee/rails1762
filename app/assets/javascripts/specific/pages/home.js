//= require homeBlur

$(function(){
  var staffbg = new Blur({
    imgid: 'j_bgimg',
    canvasid: 'j_canvas',
    deep: 100,
    container: '.ph_introsite-staff',
    repeat: true
  });

  var t;

  Blur.render();

  $(window).resize(function(){
    clearTimeout(t);
    t = setTimeout(function(){
      Blur.render();
    }, 500);
  });
});