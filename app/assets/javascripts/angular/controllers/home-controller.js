app.controller('HomeCtrl', ['$scope', function($scope) {

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
    }
  };
 
}]);