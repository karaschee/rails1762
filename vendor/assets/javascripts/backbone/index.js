//= require ./1.1.2/backbone-min

if(window._TOKEN_){
  // passing the token in Backbone AJAX calls
  Backbone.sync = _.wrap(Backbone.sync, function(sync, method, model, options){
    if(method == 'create' || method == 'update' || method == 'delete') {
      options.headers = {
        'X-CSRF-Token': _TOKEN_
      };
    }
    sync(method, model, options);
  });
}