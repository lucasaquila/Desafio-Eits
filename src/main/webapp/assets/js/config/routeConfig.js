angular.module('desafioApp').config(function($routeProvider) {
	$routeProvider.when("/usuario", {
		templateUrl: "usuario",
		controller: "usuarioController"
	});
	
	$routeProvider.when("/usuario/form", {
		templateUrl: "usuario/form",
		controller: "usuarioController"
	});
	
	/*$routeProvider.otherwise({redirectTo: "/usuario"})*/
});