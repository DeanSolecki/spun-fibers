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

			$scope.$on('auth:registration-email-success', function() {
				$state.go('confirm');
			});

			$scope.$on('auth:registration-email-error', function(ev, reason) {
				$scope.errors = reason;
			});

		}])

		.controller('LoginCtrl', ['$scope', '$state', '$auth', 'FoundationApi', function($scope, $state, $auth, FoundationApi) {
			$scope.handleLoginClick = function() {
				$auth.submitLogin($scope.loginForm)
			};
			
			$scope.$on('auth:login-success', function() {
				$state.go('home');
			});

			$scope.$on('auth:login-error', function(ev, reason) {
				FoundationApi.publish('error-notif', { title: 'There is a problem with your input:', content: reason.errors[0],
																							color: 'alert', autoclose: '9000' });
			});
		}])

		.controller('LogoutCtrl', ['$scope', '$state', '$auth', function($scope, $state, $auth) {
			$auth.signOut();

			$scope.$on('auth:logout-success', function() {
				$state.go('home');
			});

			$scope.$on('auth:logout-error', function(ev, reason) {
				$scope.error = reason.error[0];
			});
		}])

		.controller('SettingsCtrl', ['$scope', '$auth', '$state', function($scope, $auth, $state) {
			$scope.handleDeleteAccountClick = function() {
				$auth.destroyAccount();
			};

			$scope.$on('auth:account-destroy-success', function() {
				$state.go('home');
			});

			$scope.$on('auth:account-destroy-error', function(ev, reason) {
				$scope.error = reason.error[0];
			});
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

    .run(run, ['$rootScope', '$state', function($rootScope, $state) {
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
