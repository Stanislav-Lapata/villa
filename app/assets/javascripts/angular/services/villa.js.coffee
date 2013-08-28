App.factory 'Villa', ['$resource', ($resource) ->
  $resource '/api/villas/:id', id: '@id'
]
