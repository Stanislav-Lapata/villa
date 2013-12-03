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

  $scope.filters = { }
  $scope.filters.districts = []

  $scope.filter_areas = (district) ->
    if district.checked
      $scope.filters.districts.push(district.id)
    else
      $scope.filters.districts = jQuery.grep $scope.filters.districts, (value) ->
        value isnt district.id

  $scope.$watch "filters", ( (filters) ->
    if filters.districts.length
      areas = filters.districts
    else
      areas = filters.area_id

    search =
      q:
        name_cont: filters.query
        bedrooms_eq: filters.bedrooms
        price_from_gteq: filters.price_from
        price_from_lteq: filters.price_to
        area_id_place_eq: areas
        area_rental_eq: true
        rental_eq: true

    params = $.param(search)

    $http(
      method: "GET"
      url: "/api/villas?#{params}"
    ).success((data, status, headers, config) ->
      $scope.villas = data
      $scope.$apply
    )

  ), true

  $scope.nextPage = () ->
    $scope.page ||= 1
    $scope.page = $scope.page + 1

    search =
      page: ($scope.page)

    params = $.param(search)

    $http(
      method: "GET"
      url: "/api/villas?#{params}"
    ).success((data, status, headers, config) ->
      $scope.villas = $.merge($scope.villas, data)
      $scope.$apply
    )

]
