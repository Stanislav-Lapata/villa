App.controller 'SubscribeCtrl', ['$scope', 'Subscribe', ($scope, Subscribe) ->

  $scope.subscribe = ->
    $scope.show_errors = false
    subscribe = new Subscribe()

    subscribe.subscribe =
      name: $scope.name
      email: $scope.email

    subscribe.$save ((success) ->
      $scope.success_subscribe = true
      $scope.subscribe = success.data
    ), (error) ->
      $scope.show_errors = true
]
