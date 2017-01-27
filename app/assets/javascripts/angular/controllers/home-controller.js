app.controller('HomeCtrl', ['$scope', '$http', function($scope, $http) {

  $scope.init = function() {
    $scope.search = {
      content: "",
      uuid: generateUUID()
    }
    $scope.watchText();
  };

  $scope.watchText = function() {
    $scope.$watch('search.content', function(newValue, oldValue) {
      $scope.proccessContentChange();
    });
  };

  $scope.proccessContentChange = function() {
    if ($scope.search.content == "") {
      $scope.search.uuid = generateUUID();
    } else {
      $scope.searchArticle();
    }
  };

  $scope.searchArticle = function() {
    $http.get("/search", 
      {content: $scope.search.content, uuid: $scope.search.uuid}).success(function(data) {
        
      }).error(function(data) {
        
      });
  };
 
}]);