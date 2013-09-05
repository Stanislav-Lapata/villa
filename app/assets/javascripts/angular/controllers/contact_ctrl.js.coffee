App.controller 'ContactCtrl', ['$scope', 'Contact', ($scope, Contact) ->
  $scope.send_contact = ->
    $scope.show_errors = false
    contact = new Contact()

    contact.contact =
      first_name: $scope.first_name
      last_name: $scope.last_name
      email: $scope.email
      phone: $scope.phone
      message: $scope.message

    if $scope.contactForm.$valid
      contact.$save ((success) ->
        $scope.success_contact = true
        $scope.contact = success.data
      ), (error) ->
        $scope.show_errors = true
    else
      $scope.show_errors = true

]
