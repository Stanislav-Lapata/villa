App.controller 'SalesCtrl', ['$scope', '$http', ($scope, $http) ->
  $scope.filters = { }

  $scope.$watch "filters", ( (filters) ->
    search =
      q:
        name_cont: filters.query
        area_id_place_eq: filters.area_id
        area_sale_eq: true
        sale_eq: true
        bedrooms_eq: filters.bedrooms
        bathrooms_eq: filters.bathrooms
        price_from_gteq: filters.price_from
        price_to_lteq: filters.price_to

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
