App.factory 'Subscribe', ['$resource', ($resource) ->
  $resource '/api/subscribes/:id', id: '@id'
]
