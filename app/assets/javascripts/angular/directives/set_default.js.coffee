App.directive "setDefault", ->
  restrict: "A"
  require: '?ngModel'
  link: {
    pre: (scope, element, attrs, ngModel) ->
      ngModel.$setViewValue(attrs.setDefault)
  }
