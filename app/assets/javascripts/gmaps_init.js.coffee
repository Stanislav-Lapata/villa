$ ->
  hash = $('#map').data('hash')
  zoom = $('#map').data('zoom')
  if hash && zoom
    circle = [{lng: hash[0].lng, lat: hash[0].lat, radius: 1607}]
    circle_options = {strokeColor: "#FF0000", strokeOpacity: 0.8, strokeWeight: 0, fillColor: '#28a7af', fillOpacity: 0.35}
    handler = Gmaps.build('Google')
    handler.buildMap({ provider: {scrollwheel: false}, internal: {id: 'map'}}, ->
      handler.addCircles(circle, circle_options)
      handler.map.centerOn(new google.maps.LatLng(hash[0].lat, hash[0].lng))
      handler.getMap().setZoom(zoom)
    )


