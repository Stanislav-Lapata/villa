App.directive "hoverdir", ->
  restrict: "A"
  link: (scope, element, attrs) ->
    $(element).hoverdir()
