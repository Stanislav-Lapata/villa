App.directive 'accordion', ->
  (scope, element, attrs) ->
    scope.$on 'LastElem', (event) ->
      $(element).accordion
        collapsible: true
        active: 1000
        icons:
          header: "ui-icon-circle-arrow-e"
          activeHeader: "ui-icon-circle-arrow-s"

App.directive 'myPostRepeatDirective', ->
  (scope, element, attrs) ->
    if scope.$last
      scope.$emit('LastElem')
