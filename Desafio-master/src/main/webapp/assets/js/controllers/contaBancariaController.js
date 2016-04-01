angular.module("desafioApp").controller('contaBancariaController', function ($scope, $routeParams,$location, contaBancariaService, usuarioService, $mdToast, $mdDialog){
	
	  $scope.toast = function(message)
	  {
		  $mdToast.show(
			      $mdToast.simple()
			        .textContent(message)
			        .position('bottom right')
			        .hideDelay(3000)
		  );
	  }
	  
	  $scope.selected = [];
			
	  $scope.detalhe = function(conta){
		  console.log(conta);
		  $location.path("/contaBancaria/detalhes/" + conta.id);
	  }
	  
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
		 
	  $scope.bancos = [];
	  $scope.usuarios = [];
	  $scope.contaBancaria = {
			  banco : "CAIXA",
			  saldo : "0.00"
	  };
	  
	  
	  if($routeParams.id != null){
		  contaBancariaService.getContaBancaria($routeParams.id).
		  success(function(conta){
			  $scope.contaBancaria = conta;
		  });
	  }
	  
	  $scope.adicionarContaBancaria = function() {
		  	console.log($scope.contaBancaria);
			contaBancariaService.saveContaBancaria($scope.contaBancaria).
			success(function(){
				$location.path("/contaBancaria");
				$scope.toast("Conta Bancária cadastrada com sucesso!")
			})
			.error(function(data,status,headers,config) {
				console.log(data);
			})
	  };
	  
	  $scope.editarContaBancaria = function(){
		  contaBancariaService.editarContaBancaria($scope.contaBancaria.id, $scope.contaBancaria).
		  success(function(){
			  delete $scope.contaBancaria;
			  $location.path("/contaBancaria");
			  $scope.toast("Conta Bancária editada com sucesso!")
		  })
		  .error(function() {
			  console.log("erro");
		  })
	  };
	  
	$scope.contasBancarias = [];
	
	$scope.listContasBancarias = function () {
		contaBancariaService.getContasBancariasByRole().
		success ( function ( data ){
			$scope.contasBancarias = data;
			console.log("listou!")
		 })
	};
	
	  $scope.atualizarSaldoInicial = function(conta){
		  console.log("saldo: " + conta.saldo);
		  contaBancariaService.inserirSaldoInicial(conta.id, conta.saldo).
		  	success ( function ()  {
		  		$location.path("/contaBancaria");
				$scope.toast("Saldo Inicial inserido com sucesso!")
		  })
		  .error(function(data,status,headers,config) {
				console.log("erro ao alterar");
		  })
	  };
	
      $scope.excluirContaBancaria = function(id){
    	  console.log("id: " + id)
    	  contaBancariaService.excluirContaBancaria(id)
		 .success(function(){
			 contaBancariaService.getContasBancariasByRole().
			 success ( function ( data )  {
				 $scope.contasBancarias = data;
				$scope.toast("Conta Bancária excluída com sucesso!")
			 })
		 })
		 .error(function(data) {
			 $mdDialog.show(
			 $mdDialog.alert()
			 .clickOutsideToClose(true)
			 .title('Operação Negada!')
			 .textContent(data.mensagem)
			 .ok('OK')
			 );
		 })
      };
	
});