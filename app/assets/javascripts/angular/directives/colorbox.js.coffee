App.directive "colorbox", ->
  restrict: "A"
  link: (scope, element, attrs) ->
    $(element).click (e) ->
      e.preventDefault()
    $(element).colorbox({ rel: 'group1', transition: "elastic", maxWidth: "100%", maxHeight: "100%" })
