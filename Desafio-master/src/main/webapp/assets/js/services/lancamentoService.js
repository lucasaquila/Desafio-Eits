angular.module("desafioApp").factory("lancamentoService", ['$http', function($http, $q) {
	
	var _getLancamentos = function(){
		return $http.get('/desafio/lancamento/getLancamentos');
	};
	
	var _getLancamentosData = function(dataDe, dataAte){
		return $http.get('/desafio/lancamento/getLancamentosData', { params:{'dataDe':dataDe, 'dataAte':dataAte}});
	};
	
	var _efetuarDeposito = function(lancamento){
		return $http.post('/desafio/lancamento/efetuarDeposito', lancamento);
	};
	
	var _efetuarSaque = function(lancamento){
		return $http.post('/desafio/lancamento/efetuarSaque', lancamento)
	};
	
	var _efetuarTransferencia = function(transferencia){
		return $http.post('/desafio/lancamento/efetuarTransferencia', transferencia)
	};
	
	return {
		getLancamentos: _getLancamentos,
		efetuarDeposito: _efetuarDeposito,
		efetuarSaque: _efetuarSaque,
		efetuarTransferencia: _efetuarTransferencia,
		getLancamentosData: _getLancamentosData
	};
}]);