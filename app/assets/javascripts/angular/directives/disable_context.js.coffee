App.directive "disableContext", ($parse) ->
  (scope, element, attrs) ->
    fn = $parse(attrs.ngRightClick)
    element.bind "contextmenu", (event) ->
      false
