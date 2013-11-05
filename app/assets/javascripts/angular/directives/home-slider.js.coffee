App.directive "homeSlider", ['$http', '$window', ($http, $window) ->
  restrict: "A"
  link: (scope, el, attrs) ->
    $http.get("/api/home_photos").success (data) ->
      scope.data = data.map (el) ->
        el.image_url
      $(el).height($(window).height())
      $(el).backstretch(scope.data)

    w = angular.element($window)
    scope.getWindowDimensions = ->
      h: w.height()
      w: w.width()

    scope.$watch scope.getWindowDimensions, ((newValue, oldValue) ->
      scope.windowHeight = newValue.h
      scope.windowWidth = newValue.w
      scope.style = ->
        height: (newValue.h) + "px"
        width: (newValue.w) + "px"
    ), true
    w.bind "resize", ->
      if !scope.$$phase
        scope.$apply()
]
