angular.module("desafioApp").controller('contaBancariaController', function ($scope, $routeParams,$location, contaBancariaService, usuarioService){
	
/*	console.log($location.path())
	$scope.parametro = null;*/
	
	
	 $scope.selected = [];
	
	 $scope.teste = function(conta){
		 console.log(conta);
		 $location.path("/contaBancaria/detalhes/" + conta.id);
	 }
	 
	$scope.bancos = [];
	$scope.usuarios = [];
	$scope.contaBancaria = {
			banco : "CAIXA",
			saldo : "0.00"
	};
	
	$scope.listaBancos = function(){
		contaBancariaService.getBancos().
		success(function(data){
			$scope.bancos = data;
	})
		
	}
	
	var listaUsuarios = function(){
		usuarioService.getUsuarios().
		success(function(data){
			$scope.usuarios = data;
	})
		
	}
	
	listaUsuarios();
	/*buscaBancos();*/
	
	
	if($routeParams.id != null){
		contaBancariaService.getContaBancaria($routeParams.id).
			success(function(conta){
				$scope.contaBancaria = conta;
			});
	}
	
	$scope.contasBancarias = [];
	
	$scope.listContasBancarias = function () {
		contaBancariaService.getContasBancariasByRole().
		success ( function ( data )  {
			$scope.contasBancarias = data;
			console.log("listou!")
		 })
	};
	
	  $scope.atualizarSaldoInicial = function(conta){
		  console.log("saldo: " + conta.saldo);
		  contaBancariaService.inserirSaldoInicial(conta.id, conta.saldo).
		  	success ( function ()  {
		  		console.log("Saldo Inserido com sucesso")
		  		$location.path("/contaBancaria");
		  })
		  .error(function(data,status,headers,config) {
				console.log("erro ao alterar");
		  })
	  };
	  
	  $scope.adicionarContaBancaria = function() {
		  	console.log($scope.contaBancaria);
			contaBancariaService.saveContaBancaria($scope.contaBancaria).
			success(function(){
				console.log("Conta Bancária salva com sucesso")
				$location.path("/contaBancaria");
			})
			.error(function(data,status,headers,config) {
				console.log("erro");
			})
	  	};
	  	
		$scope.editarContaBancaria = function(){
			
			/*console.log($scope.contaBancaria);*/
			contaBancariaService.editarContaBancaria($scope.contaBancaria.id, $scope.contaBancaria).
			success(function(){
				console.log("Editado com sucesso")
				delete $scope.contaBancaria;
				$location.path("/contaBancaria");
			})
			.error(function() {
				console.log("erro");
			})
		};
		
		$scope.excluirContaBancaria = function(id){
			  console.log("id: " + id)
			  contaBancariaService.excluirContaBancaria(id)
			  .success(function(){
				  console.log("Excluido com sucesso...")
				  contaBancariaService.getContasBancariasByRole().
				  success ( function ( data )  {
					  $scope.contasBancarias = data;
						  console.log("listou!")
				  })
				  
			  })
			  .error(function() {
					console.log("erro ao excluir!");
			  })
		  };
	  
	
});