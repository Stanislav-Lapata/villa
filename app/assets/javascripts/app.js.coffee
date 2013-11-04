window.App = angular.module('Villa', ['ngResource', 'ngRoute', 'SharedServices', 'google-maps', 'ap.fotorama'])

App.config ["$routeProvider", "$locationProvider", "$httpProvider", ($routeProvider, $locationProvider, $httpProvider) ->
  $httpProvider.defaults.headers.post['Content-Type'] = 'application/json'
  $httpProvider.defaults.headers.put['Content-Type'] = 'application/json'
  token = $("meta[name='csrf-token']").attr("content")
  $httpProvider.defaults.headers.post['X-CSRF-Token'] = token
  $httpProvider.defaults.headers.put['X-CSRF-Token'] = token
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = token

  $locationProvider.hashPrefix('!')
  $locationProvider.html5Mode(true)

  $routeProvider.when("/",
    templateUrl: "/home/list.html"
    controller: 'HomeCtrl'
  ).when("/villas",
    templateUrl: "/villas/list.html"
    controller: 'VillasCtrl'
  ).when("/sales",
    templateUrl: "/villas/sales.html"
    controller: 'SalesCtrl'
  ).when("/villas/:villaId",
    templateUrl: "/villas/show_villa.html"
    controller: 'VillaCtrl'
  ).when("/sales/:villaId",
    templateUrl: "/villas/show_sales_villa.html"
    controller: 'VillaCtrl'
  ).when("/faq",
    templateUrl: "faq.html"
    controller: 'FaqCtrl'
  ).when("/contact",
    templateUrl: "contact.html"
    controller: 'ContactCtrl'
  ).otherwise redirectTo: "/"
]

App.run ($rootScope) ->
  $rootScope.$on "$viewContentLoaded", ->
    $(document).foundation()









