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
//= require jquery_ujs
//= require foundation
//= require unstable/angular
//= require unstable/angular-resource

//= require app
//= require jquery.throttle_debounce_plugin
//= require_tree ./angular

Array.prototype.remove = function(e) {
  var t, _ref;
  if ((t = this.indexOf(e)) > -1) {
    return ([].splice.apply(this, [t, t - t + 1].concat(_ref = [])), _ref);
  }
};


$(function(){
  $(document).foundation();
  $('.datepicker').datepicker({
    dateFormat: "yy-mm-dd"
  });
});


// $(document).foundation('orbit', {
//   animation: 'fade',
//   timer_speed: 3000,
//   pause_on_hover: true,
//   resume_on_mouseout: false,
//   animation_speed: 500,
//   stack_on_small: true,
//   navigation_arrows: true,
//   slide_number: false,
//   container_class: 'orbit-container',
//   stack_on_small_class: 'orbit-stack-on-small',
//   next_class: 'orbit-next',
//   prev_class: 'orbit-prev',
//   timer_container_class: 'orbit-timer',
//   timer_paused_class: 'paused',
//   timer_progress_class: 'orbit-progress',
//   slides_container_class: 'orbit-slides-container',
//   bullets_container_class: 'orbit-bullets',
//   bullets_active_class: 'active',
//   slide_number_class: 'orbit-slide-number',
//   caption_class: 'orbit-caption',
//   active_slide_class: 'active',
//   orbit_transition_class: 'orbit-transitioning',
//   bullets: false,
//   timer: true,
//   variable_height: false,
//   before_slide_change: function(){},
//   after_slide_change: function(){}
// });


