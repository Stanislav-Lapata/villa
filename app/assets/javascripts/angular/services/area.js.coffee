App.factory 'Area', ['$resource', ($resource) ->
  $resource '/api/areas/:id', id: '@id'
]
