App.controller 'AdminGmapsCtrl', ['$scope', 'Villa', '$http', ($scope, Villa, $http) ->

  $scope.get_villa = (villa) ->
    latitude = villa.latitude || 16
    longitude = villa.longitude || 101
    zoom = parseInt(villa.zoom) || 5

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
