App.directive "datepicker", ->
  require: "ngModel"
  link: (scope, el, attr, ngModel) ->
    $(el).datepicker
      dateFormat: "yy-mm-dd"
      onSelect: (dateText) ->
        scope.$apply ->
          ngModel.$setViewValue dateText
