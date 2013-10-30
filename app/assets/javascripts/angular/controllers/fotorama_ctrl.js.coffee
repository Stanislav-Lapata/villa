App.controller 'FotoramaCtrl', ['$scope', ($scope) ->
  $scope.items = [{img: 'iurl', thumb: 'turl', full: 'furl'}]
  $scope.options =
    width: '100%'
    allowfullscreen: true
    loop: true
    keyboard: true
    nav: 'thumbs'
    autoplay: true
    img: 'original_image_url'
    full: 'original_image_url'
]
