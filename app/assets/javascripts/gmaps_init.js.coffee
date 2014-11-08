$ ->
  hash = $('#map').data('hash')
  zoom = $('#map').data('zoom')
  if hash && zoom
    handler = Gmaps.build('Google')
    handler.buildMap({ provider: {scrollwheel: false}, internal: {id: 'map'}}, ->
      markers = handler.addMarkers(hash)
      handler.bounds.extendWith(markers)
      handler.fitMapToBounds()
      handler.getMap().setZoom(zoom)
    )
