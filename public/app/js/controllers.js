'use strict';

/* Controllers */

var adminControllers = angular.module('adminControllers', []);

adminControllers.controller('PhoneListCtrl', ['$scope', '$location', 'Profile', 'User',
  function($scope, $location, Profile, User) {
    if (User.loggedIn() === false) return $location.path('/login')
    $scope.profiles = Profile.query();
    $scope.orderProp = 'public';
    $scope.publish = function(profile) {
      profile.$update(function () {
        console.log("updates")
      })
    }
  }]
);

adminControllers.controller('PhoneDetailCtrl', ['$scope', '$routeParams', 'Profile', 'User',
  function($scope, $routeParams, Profile, User) {
    if (User.loggedIn() === false) return $location.path('/login')
    $scope.profile = Profile.get({id: $routeParams.profileId});

  }]
);

adminControllers.controller('SignInCtrl', ['$scope', '$location', 'User', '$http', '$log',
  function($scope, $location, User, $http, $log) {
    if (User.loggedIn() === true) return $location.path('/profiles')
    $scope.loginData = {};
    $scope.doLogin = function () {
      $http.post('/admin/login', {
        email: $scope.loginData.username,
        password: $scope.loginData.password
      }).then(function (response) {
        window.localStorage['authToken'] = response.data.access_token;
        window.localStorage['userId'] = response.data.user_id;

        $scope.currentUser = true;
        return $location.path('/profiles');
      }, function (error) {
        alert('Incorrect password - please try again.')
        $log.log(error);
      });
    };
  }]
);
