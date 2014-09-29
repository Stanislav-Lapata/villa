$(document).ready ->
  hash = $('#map').data('hash')
  zoom = $('#map').data('zoom')
  console.log hash, zoom
  handler = Gmaps.build('Google')
  handler.buildMap
    provider:
      disableDefaultUI: false
    internal:
      id: 'map'
  , ->
    markers = handler.addMarkers(hash)
    handler.bounds.extendWith(markers)
    handler.fitMapToBounds()
    handler.getMap().setZoom(zoom)

