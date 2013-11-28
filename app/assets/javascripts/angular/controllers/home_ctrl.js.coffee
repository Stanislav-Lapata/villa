App.controller 'HomeCtrl', ['$scope', '$http', ($scope, $http) ->
  $http(
    method: "GET"
    url: "/api/areas/home"
  ).success((data, status, headers, config) ->
    $scope.areas = data
    $scope.$apply
  )

  $http(
    method: "GET"
    url: "/api/areas/phuket"
  ).success((data, status, headers, config) ->
    $scope.districts = data
    $scope.$apply
  )
]
