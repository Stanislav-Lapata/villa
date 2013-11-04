App.controller 'FaqCtrl', ['$scope', 'Faq', ($scope, Faq) ->
  $scope.faqs = Faq.query()
]
