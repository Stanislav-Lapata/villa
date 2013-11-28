App.controller 'AreasCtrl', ['$scope', '$http', 'Area', ($scope, $http, Area) ->
  $scope.areas = Area.query()
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

]
