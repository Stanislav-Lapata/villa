App.factory 'Request', ['$resource', ($resource) ->
  $resource '/api/requests/:id', id: '@id'
]
