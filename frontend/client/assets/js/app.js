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
		.controller('RegCtrl', ['$scope', '$auth', '$state', function($scope, $auth, $state) {
			$scope.handleRegClick = function() {
				$auth.submitRegistration($scope.registrationForm)
			};
		}])

		.controller('LoginCtrl', ['$scope', '$state', '$auth', function($scope, $state, $auth) {
			$scope.handleLoginClick = function() {
				$auth.submitLogin($scope.loginForm)
			};
		}])

		.controller('LogoutCtrl', ['$scope', '$state', '$auth', function($scope, $state, $auth) {
			$auth.signOut();
		}])

		.controller('SettingsCtrl', ['$scope', '$auth', '$state', function($scope, $auth, $state) {
			$scope.handleDeleteAccountClick = function() {
				$auth.destroyAccount();
			};
		}])

		.controller('ItemsCtrl', ['$scope', function($scope) {
			$scope.items = ['Item One', 'Item Two'];
		}])

		.controller('HomeCtrl', ['$scope', '$state', '$auth', function($scope, $state, $auth) {
		}])

		.config(config)
		
    .config(function($authProvider) {
			$authProvider.configure({
				apiUrl: '/api',
				confirmationSuccessUrl: 'http://www.spunfibers.com'
			})
		})
		
		.run(run)

    .run(['$rootScope', '$state', '$auth', 'FoundationApi', function($rootScope, $state, $auth, FoundationApi) {
			$rootScope.$on('auth:login-error', function(ev, reason) {
				setTimeout(function(){Console.log("timeout ended");}, '3000');
				FoundationApi.publish('notification',
															{ title: 'Error:',
																content: reason.errors[0],
																color: 'alert',
																autoclose: '9000' });
			});

			$rootScope.$on('auth:registration-email-error', function(ev, reason) {
				setTimeout(function(){Console.log("timeout ended");}, '3000');
				FoundationApi.publish('notification',
															{ title: 'Error:',
																content: reason.errors.full_messages[0],
																color: 'alert',
																autoclose: '9000' });
			});

			$rootScope.$on('auth:logout-error', function(ev, reason) {
				$state.go('home');
				setTimeout(function(){Console.log("timeout ended");}, '3000');
				FoundationApi.publish('notification',
															{ title: 'Error:',
																content: reason.errors[0],
																color: 'alert',
																autoclose: '9000' });
			});

			$rootScope.$on('auth:account-destroy-error', function(ev, reason) {
				setTimeout(function(){Console.log("timeout ended");}, '3000');
				FoundationApi.publish('notification',
															{ title: 'Error:',
																content: reason.errors[0],
																color: 'alert',
																autoclose: '9000' });
			});

			$rootScope.$on('auth:login-success', function() {
				$state.go('home');
				setTimeout(function(){Console.log("timeout ended");}, '3000');
				FoundationApi.publish('notification',
															{ title: 'Success:',
																content: 'You are now logged in',
																color: 'success',
																autoclose: '9000' });
			});

			$rootScope.$on('auth:registration-email-success', function() {
				$state.go('confirm');
				setTimeout(function(){Console.log("timeout ended");}, '3000');
				FoundationApi.publish('notification',
															{ title: 'Success:',
																content: 'Your registration was sent',
																color: 'success',
																autoclose: '9000' });
			});

			$rootScope.$on('auth:account-destroy-success', function() {
				$state.go('home');
				setTimeout(function(){Console.log("timeout ended");}, '3000');
				FoundationApi.publish('notification',
															{ title: 'Success:',
																content: 'Your account was deleted',
																color: 'success',
																autoclose: '9000' });
			});

			$rootScope.$on('auth:logout-success', function() {
				$state.go('home');
				setTimeout(function(){Console.log("timeout ended");}, '3000');
				FoundationApi.publish('notification',
															{ title: 'Success:',
																content: "You've been logged out",
																color: 'success',
																autoclose: '9000' });
			});
		}])
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
