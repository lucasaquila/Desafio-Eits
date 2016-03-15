angular.module("desafioApp").factory("usuarioService", ['$http', function($http) {
	
	var _getUsuarios = function(){
		return $http.get('/desafio/usuario/listagem');
	};
	
	var _saveUsuario = function(contato){
		return $http.post('/desafio/usuario/save', contato);
	};
	
	var _alterarSituacao = function(id, usuario){
		return $http.put('/desafio/usuario/alteraSituacao/'+id, usuario);
	};	
	
	return {
		getUsuarios: _getUsuarios,
		saveUsuario: _saveUsuario,
		alterarSituacao: _alterarSituacao
	};
}]);