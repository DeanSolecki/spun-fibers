(function() {
  'use strict';

var app = angular.module('application', [
    'ui.router',
    'ngAnimate',

    //foundation
    'foundation',
    'foundation.dynamicRouting',
    'foundation.dynamicRouting.animations',

		//project mods
		'ng-token-auth'
  ])
		.controller('RegCtrl', ['$scope', '$auth', function($scope, $auth) {
			$scope.handleRegClick = function() {
				$auth.submitRegistration($scope.registrationForm)
					.then(function(resp) {
						// handle success response
					})
					.catch(function(resp) {
						// handle error response
					});
			};
		}])
		.controller('ItemsCtrl', ['$scope', function($scope) {
			$scope.items = ['Item One', 'Item Two'];
		}])
		.controller('HomeCtrl', ["$scope", "$state", function($scope, $state) {
		}])
    .config(config, function($authProvider) {
			$authProvider.configure({
				apiUrl: '/api'
			})
		})
    .run(run)
  ;

  config.$inject = ['$urlRouterProvider', '$locationProvider'];

  function config($urlProvider, $locationProvider) {
    $urlProvider.otherwise('/');

    $locationProvider.html5Mode({
      enabled:false,
      requireBase: false
    });

    $locationProvider.hashPrefix('!');
  }

  function run() {
    FastClick.attach(document.body);
  }

})();
