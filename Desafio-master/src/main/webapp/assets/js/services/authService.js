angular.module("desafioApp").factory("usuarioService", ['$http', function($http) {
	
	var _logout = function(){
		return $http.get('/desafio/auth/logout');
	};
	
	return {
		logout: _logout,
	};
}]);