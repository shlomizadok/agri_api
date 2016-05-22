'use strict';

/* Services */

var adminServices = angular.module('adminServices', ['ngResource']);

adminServices.factory('Profile', ['$resource',
  function($resource){
    return $resource('/admin/profiles/:id', {id: '@id'}, {
      update: {method: 'PUT'}
    });
  }]
);

adminServices.factory('AuthInterceptor', function($q) {
  return {
    'request': function(config) {
      config.headers.Authorization = window.localStorage['authToken'];
      return config;
    }
  };
})

adminServices.factory('User', function($http) {
  return {
    loggedIn: function() {
      return !(window.localStorage.getItem('authToken') === null);
    },
    getUserId: function() {
      return window.localStorage['userId']
    }
  }
})