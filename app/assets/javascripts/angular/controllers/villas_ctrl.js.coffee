App.controller 'VillasCtrl', ['$scope', '$http', ($scope, $http) ->
  $scope.filters = { }
  $scope.filters.districts = []

  $scope.enable_districts = (area) ->
    $scope.show_districts = true
    $scope.districts = area.areas
    $scope.parent = area.name

  $scope.disable_districts = ->
    $scope.parent = null

  $scope.filter_areas = (district) ->
    console.log district
    if district.checked
      $scope.filters.districts.push(district.id)
    else
      $scope.filters.districts = jQuery.grep $scope.filters.districts, (value) ->
        value isnt district.id

  $scope.$watch "filters", ( (filters) ->
    console.log "CHANGED"
    if filters.districts.length
      areas = filters.districts
    else
      areas = filters.area_id

    search =
      q:
        name_cont: filters.query
        area_id_place_eq: areas
        area_rental_eq: true
        rental_eq: true
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
