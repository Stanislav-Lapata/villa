App.controller 'VillasCtrl', ['$scope', '$http', 'Villa', '$routeParams', ($scope, $http, Villa, $routeParams) ->
  $scope.villas = Villa.query()

  $scope.filters = { }

  $scope.$watch "filters", ( (filters) ->
    search =
      q:
        name_cont: filters.query
        area_id_place_eq: filters.area_id

    params = $.param(search)

    $http(
      method: "GET"
      url: "/api/villas?#{params}"
    ).success((data, status, headers, config) ->
      $scope.villas = data
      $scope.$apply
    )


  ), true
]
