angular.module("desafioApp").controller('contaBancariaController', function ($scope, $routeParams,$location, contaBancariaService, usuarioService, $mdToast, $mdDialog){
	
	  $scope.toast = function(message,type)
	  {
		  $mdToast.show({
		        template: '<md-toast class="md-toast ' + type + '">' + message + '</md-toast>',
		        hideDelay: 6000,
		        position: 'bottom right'
		  });
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
	  
	  
	  $scope.submit = function(contaBancaria){
		  if(!contaBancaria.id)
		  {
			  contaBancariaService.saveContaBancaria($scope.contaBancaria).
			  success(function(){
				  $location.path("/contaBancaria");
				  $scope.toast("Conta Bancária cadastrada com sucesso!", "success")
			  })
			  .error(function(data,status,headers,config) {
				  $scope.toast(data, "error")
			  })			  
		  }
		  else
		  {
			  contaBancariaService.editarContaBancaria($scope.contaBancaria.id, $scope.contaBancaria).
			  success(function(){
				  delete $scope.contaBancaria;
				  $location.path("/contaBancaria");
				  $scope.toast("Conta Bancária alterada com sucesso!", "success")
			  })
			  .error(function() {
				  console.log("erro");
			  })
		  }


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
				$scope.toast("Saldo Inicial inserido com sucesso!", "success")
		  })
		  .error(function(data,status,headers,config) {
				console.log("erro ao alterar");
		  })
	  };
	
	  $scope.excluirContaBancariaDialog = function(selecionado){
			 
		    var confirm = $mdDialog.confirm()
	        .title('Excluir Conta Bancária')
	        .textContent('Você deseja alterar a situação do usuário ' + selecionado.nome + ' para ' + (selecionado.situacao? 'ATIVADO?' : "DESATIVADO?"))
	        .ariaLabel('Lucky day')
	        .ok('Sim')
	        .cancel('Não');
		  $mdDialog.show(confirm).then(function() {
			  $scope.alterarSituacao(selecionado);
			  $scope.toast("Situação de Usuário alterada com sucesso!", "success")
		  }, function() {
			  selecionado.situacao = !selecionado.situacao
		  });
		  
	  };
	  
      $scope.excluirContaBancaria = function(id){
    	  console.log("id: " + id)
    	  contaBancariaService.excluirContaBancaria(id)
		 .success(function(){
			 contaBancariaService.getContasBancariasByRole().
			 success ( function ( data )  {
				 $scope.contasBancarias = data;
				$scope.toast("Conta Bancária excluída com sucesso!","success")
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