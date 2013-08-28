App.controller 'AreasCtrl', ['$scope', 'Area', ($scope, Area) ->
  $scope.areas = Area.query()
]
