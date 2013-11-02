App.controller 'AdminGmapsCtrl', ['$scope', 'Villa', '$http', ($scope, Villa, $http) ->

  $scope.get_villa = (villa) ->
    latitude = villa.latitude || 7.954984614313133
    longitude = villa.longitude || 98.36196899414062
    zoom = parseInt(villa.zoom) || 10

    google.maps.visualRefresh = true
    angular.extend $scope,
      position:
        coords:
          latitude: latitude
          longitude: longitude

      centerProperty:
        latitude: latitude
        longitude: longitude

      zoom: zoom

      if villa.id
        markersProperty: [
          latitude: latitude
          longitude: longitude
        ]
      else
        markersProperty: []
]
