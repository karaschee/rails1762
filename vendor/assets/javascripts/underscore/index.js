//= require ./1.6.0/underscore-min

// don't conflict with rails
_.templateSettings = {
    interpolate: /\[\%\=(.+?)\%\]/g,
    evaluate: /\[\%(.+?)\%\]/g
};
