App.controller 'RequestCtrl', ['$scope', 'Request', ($scope, Request) ->

  $scope.send_request = ->
    $scope.show_errors = false
    request = new Request()

    request.request =
      villa_id: $scope.villa.id
      first_name: $scope.first_name
      last_name: $scope.last_name
      email: $scope.email
      check_in: $scope.check_in
      check_out: $scope.check_out
      comments: $scope.comments

    request.$save ((success) ->
      $scope.success_request = true
      $scope.request = success.data
    ), (error) ->
      $scope.show_errors = true
]
