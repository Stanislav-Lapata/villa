App.factory 'Faq', ['$resource', ($resource) ->
  $resource '/api/faqs/:id', id: '@id'
]
