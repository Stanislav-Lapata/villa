App.factory 'Contact', ['$resource', ($resource) ->
  $resource '/api/contacts/:id', id: '@id'
]
