// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.ui.datepicker
//= require jquery.ui.accordion
//= require jquery_ujs
//= require jquery.gmap
//= require jquery.hoverdir
//= require foundation
//= require angular
//= require angular-resource
//= require angular-route
//= require angular-google-maps
//= require jquery.colorbox-min
//= require fotorama
//= require jquery.backstretch.min

//= require app
//= require jquery.throttle_debounce_plugin
//= require ap.fotorama
//= require_tree ./angular

Array.prototype.remove = function(e) {
  var t, _ref;
  if ((t = this.indexOf(e)) > -1) {
    return ([].splice.apply(this, [t, t - t + 1].concat(_ref = [])), _ref);
  }
};
