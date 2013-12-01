App.controller 'AreasCtrl', ['$scope', '$http', 'Area', ($scope, $http, Area) ->
  $scope.areas = Area.query()
]
