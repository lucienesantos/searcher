app.controller('HomeCtrl', ['$scope', '$http', function($scope, $http) {
  $scope.message = "";

  $scope.init = function() {
    $scope.search = {
      content: "",
      request_uuid: generateUUID()
    }
    $scope.message = "";
    $scope.watchText();
  };

  $scope.watchText = function() {
    $scope.$watch('search.content', function(newValue, oldValue) {
      $scope.proccessContentChange();
    });
  };

  $scope.proccessContentChange = function() {
    if ($scope.search.content == "") {
      $scope.search.request_uuid = generateUUID();
    } else {
      $scope.searchArticle();
    }
  };

  $scope.searchArticle = function() {
    $http({
      url: "/search.json",
      method: "GET",
      params: {content: $scope.search.content, request_uuid: $scope.search.request_uuid}
    }).success(function(data) {
      $scope.message = data.message;
    }).error(function(data) {
      console.log(data);
    });
  };
 
}]);