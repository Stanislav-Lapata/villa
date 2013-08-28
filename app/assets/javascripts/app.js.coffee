window.App = angular.module('Villa', ['ngResource'])

App.config ["$routeProvider", "$locationProvider", "$httpProvider", ($routeProvider, $locationProvider, $httpProvider) ->
  $httpProvider.defaults.headers.post['Content-Type'] = 'application/json'
  $httpProvider.defaults.headers.put['Content-Type'] = 'application/json'
  token = $("meta[name='csrf-token']").attr("content")
  $httpProvider.defaults.headers.post['X-CSRF-Token'] = token
  $httpProvider.defaults.headers.put['X-CSRF-Token'] = token
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = token


  $routeProvider.when("/villas",
    templateUrl: "/villas/list.html"
    controller: 'VillasCtrl'
  ).when("/villas/:villaId",
    templateUrl: "/villas/show_villa.html"
    controller: 'VillaCtrl'
  ).otherwise redirectTo: "/villas"

]

App.run ($rootScope) ->
  $rootScope.$on "$viewContentLoaded", ->
    $(document).foundation('section')
    $(document).foundation 'orbit',
      slide_number: false
      timer: false







