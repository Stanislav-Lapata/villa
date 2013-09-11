App.directive("gmap", ->
  scope:
    gmap: '@'
  link: (scope, element, attributes) ->
    scope.$watch "gmap", (villa) ->
      processed_villa = $.parseJSON(villa)
      zoom = parseInt(processed_villa.zoom) || 12
      $(element).gMap
        markers: [
          latitude: processed_villa.latitude
          longitude: processed_villa.longitude
        ]
        latitude: processed_villa.latitude
        longitude: processed_villa.longitude
        zoom: zoom
        controls: false
        scrollwheel: true
)
