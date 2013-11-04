App.directive 'homeSlider', ->
  (scope, element, attrs) ->
    $(element).height($(window).height())
    $(element).backstretch("http://dl.dropbox.com/u/515046/www/garfield-interior.jpg");
