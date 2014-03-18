// tinytip 1.0.0
// author: karaschee@gmail.com

;(function($) {

  var defaults = {
    txt: '操作进行中，请稍候',
    container: 'body',
    css: {},
    skins: 'default',
  };

  var Tinytip = function(options){
    options = $.extend({}, defaults, options);

    // Initialize
    var wrapper = $('<div style="display:none;" class="tinytip_wrapper"></div>');
    var container = $(options.container);

    $.each( options.skins.split(' '), function(i, v){
      wrapper.addClass('tinytip_wrapper-'+v);
    });

    container.append( wrapper.html(options.txt) );
    if(!container.is('body')){
      wrapper.css({'position': 'absolute'});
      container.css({'position': 'relative'});
    }

    wrapper.css(options.css);

    this.wrapper = wrapper;
    this.options = options;

    Tinytip.tips = Tinytip.tips || [];
    Tinytip.tips.push(this);
  };

  Tinytip.hide = function(){
    $.each(Tinytip.tips, function(i, v){
      $(v).hide();
    });
  }

  $.extend(Tinytip.prototype, {
    show: function(txt){
      this.wrapper.html(txt);
      this.wrapper.show();
    },
    hide: function(){
      this.wrapper.hide();
    },
    fadeOut: function(){
      this.wrapper.fadeOut();
    },
    reset: function(){
      this.wrapper.html(this.options.txt);
    }
  });

  $.extend({
    Tinytip: Tinytip
  });
})(jQuery);
