App.controller 'VillaCtrl', ['$scope', '$http', 'Villa', '$routeParams', ($scope, $http, Villa, $routeParams) ->
  $scope.villa = Villa.get({id: $routeParams.villaId})
]
