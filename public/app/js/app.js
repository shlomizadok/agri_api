'use strict';

/* App Module */

var adminApp = angular.module('adminApp', [
  'ngRoute',
  'adminControllers',
  'adminFilters',
  'adminServices'
]);

adminApp.config(['$routeProvider', '$httpProvider',
  function($routeProvider, $httpProvider) {
    $routeProvider.
      when('/profiles', {
        templateUrl: 'partials/profile-list.html',
        controller: 'PhoneListCtrl'
      }).
      when('/profiles/:profileId', {
        templateUrl: 'partials/profile-detail.html',
        controller: 'PhoneDetailCtrl'
      }).
      when('/login', {
        templateUrl: 'partials/sign_in.html',
        controller: 'SignInCtrl'
      }).
      otherwise({
        redirectTo: '/login'
      });
    $httpProvider.interceptors.push('AuthInterceptor');
  }])
