App.directive "villa", ->
  scope:
    villaId: '=villa'
  controller: ['$scope', 'Villa', ($scope, Villa) ->
    $scope.villa = Villa.get({id: $scope.villaId})
  ]
