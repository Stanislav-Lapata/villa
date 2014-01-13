$(document).on 'click', '#location-map', ->
  hash = $('#map').data('hash')
  zoom = $('#map').data('zoom')
  handler = Gmaps.build('Google')
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, ->
    markers = handler.addMarkers(hash)
    handler.bounds.extendWith(markers)
    handler.fitMapToBounds()
    handler.getMap().setZoom(zoom)
  )
