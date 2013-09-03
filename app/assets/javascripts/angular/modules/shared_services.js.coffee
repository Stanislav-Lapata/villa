angular.module("SharedServices", []).config(($httpProvider) ->
  $httpProvider.responseInterceptors.push "myHttpInterceptor"
  spinnerFunction = (data, headersGetter) ->
    $("#loading").show()
    data

  $httpProvider.defaults.transformRequest.push spinnerFunction
).factory "myHttpInterceptor", ($q, $window) ->
  (promise) ->
    promise.then ((response) ->
      $("#loading").hide()
      response
    ), (response) ->
      $("#loading").hide()
      $q.reject response

