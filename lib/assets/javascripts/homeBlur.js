//= require StackBlur

(function(){
  var defaults = {
    imgid: '',
    canvasid: '',
    deep: 70,
    container: '',
    repeat: false
  }

  function Blur(options){
    options = $.extend({}, defaults, options);
    this.options = options;
    this.init();
    Blur.data.push(this);
  }

  Blur.data = [];
  Blur.render = function(){
    $.each(Blur.data, function(i, v){
      v.render();
    });
  }

  Blur.prototype.init = function(){
    var img = document.getElementById( this.options.imgid );
    var canvas = document.getElementById( this.options.canvasid );
    this.img = img;
    this.canvas = canvas;
    this.prepare = false;
  }

  Blur.prototype.render = function(){
    var img = this.img;
    var canvas = this.canvas;
    var container = this.options.container;
    var that = this;

    if(that.prepare){
      render();
    }else {
      $(img).on('load', function(){
        render();
      });
    }

    function render(){
      that.prepare = true;
      var w = img.naturalWidth;
      var h = img.naturalHeight;
      var ww = $(container).outerWidth();
      var wh = $(container).outerHeight();

      canvas.style.width  = ww + "px";
      canvas.style.height = wh + "px";
      canvas.width = ww;
      canvas.height = wh;

      console.log(ww, wh);

      var context = canvas.getContext("2d");
      context.clearRect( 0, 0, ww, wh );

      if(that.options.repeat){
        var p = context.createPattern(img, 'repeat');
        context.fillStyle = p;
        context.fillRect(0, 0, ww, wh);
      }else {
        // context.drawImage( img, 0, 0, ww*h/wh, wh );
        context.drawImage( img, 0, 0, ww, ww*h/w );
      }

      stackBlur.blurCanvasRGB( that.options.canvasid, 0, 0, ww, wh, that.options.deep );
    }
  }

  window.Blur = Blur;
})();