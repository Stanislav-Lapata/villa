App.controller 'VillaCtrl', ['$scope', '$http', 'Villa', '$routeParams', ($scope, $http, Villa, $routeParams) ->
  $('.orbit-next').click()
  $scope.villa = Villa.get({id: $routeParams.villaId})
]
