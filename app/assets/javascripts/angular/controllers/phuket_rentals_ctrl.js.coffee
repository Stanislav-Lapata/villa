App.controller 'PhuketRentalsCtrl', ['$scope', '$route', '$http', ($scope, $route, $http) ->
  $scope.filters = { }
  $scope.filters.districts = []

  $http(
    method: "GET"
    url: "/api/areas/phuket"
  ).success((data, status, headers, config) ->
    $scope.districts = data
    $scope.$apply
  )

  $scope.enable_districts = (area) ->
    $scope.show_districts = true
    $scope.districts = area.areas
    $scope.parent = area.name

  $scope.disable_districts = ->
    $scope.parent = null

  $scope.filter_areas = (district) ->
    if district.checked
      $scope.filters.districts.push(district.id)
    else
      $scope.filters.districts = jQuery.grep $scope.filters.districts, (value) ->
        value isnt district.id

  $scope.$watch "filters", ( (filters) ->
    current_route = $route.current.$$route.originalPath
    if filters.districts.length
      areas = filters.districts
    else
      areas = filters.area_id

    search =
      q:
        name_cont: filters.query
        area_id_place_eq: areas
        bedrooms_eq: filters.bedrooms
        bathrooms_eq: filters.bathrooms
        price_from_gteq: filters.price_from
        price_from_lteq: filters.price_to

    search.q["#{current_route.replace('/', '')}_eq"] = true

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
