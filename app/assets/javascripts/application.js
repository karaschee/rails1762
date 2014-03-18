// require turbolinks
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require tinytip

// header scroll style change
(function(){
  var elemh = $('.g_header');
  var scrollClass = 'g_header-scroll';
  $(document).on('scroll', function(){
    var t = $(document).scrollTop();
    if(t > 5){
      elemh.addClass(scrollClass);
    }else {
      elemh.removeClass(scrollClass);
    }
  });

  $('#j_mnavBtn').on('click', function(){
    $('#j_mnav').toggle();
  });
})();
