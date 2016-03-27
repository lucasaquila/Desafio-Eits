angular.module("desafioApp").controller('usuarioController', ['$mdEditDialog', '$q', '$scope', '$timeout', '$http', 'usuarioService','$location', '$routeParams','$mdToast', '$mdDialog',  function ($mdEditDialog, $q, $scope, $timeout, $http, usuarioService, $location, $routeParams,$mdToast, $mdDialog) {
  'use strict';
  
  
  $scope.toast = function(message)
  {
	  $mdToast.show(
		      $mdToast.simple()
		        .textContent(message)
		        .position('bottom right')
		        .hideDelay(3000)
		    );
  }
 
  $scope.usuarios = [];
  $scope.usuario = {
		  nome : "",
		  tipoUsuario : "ROLE_USUARIO",
		  situacao: true
		  	  
  };
  
	if($routeParams.id != null){
		usuarioService.getUsuario($routeParams.id).
			success(function(usuario){
				$scope.usuario = usuario;
			});
	}  
  
  $scope.excluirUsuario = function(id){
	  console.log("id: " + id)
	  usuarioService.excluirUsuario(id)
	  .success(function(){
		  console.log("Excluido com sucesso...")
		  usuarioService.getUsuarios().
		  success ( function ( data )  {
			  $scope.usuarios = data;
				  console.log("listou!")
		  })
		  
	  })
	  .error(function() {
			console.log("erro ao excluir usuário!");
	  })
  };
  
  $scope.alterarSituacao = function(selecionado){
	  console.log("ID: " + selecionado.id + "Situação:" + selecionado.situacao);
	  usuarioService.alterarSituacao(selecionado.id, selecionado).
	  	success ( function ()  {
	  		console.log("alterado com sucesso")
	  })
	  .error(function(data,status,headers,config) {
			console.log("erro ao alterar");
	  })
  };
  
  
  $scope.alterarSituacaoDialog = function(selecionado){
	 
	    var confirm = $mdDialog.confirm()
        .title('Alterar Situação do Usuário')
        .textContent('Você deseja alterar a situação do usuário ' + selecionado.nome + ' para ' + (selecionado.situacao? 'ATIVADO?' : "DESATIVADO?"))
        .ariaLabel('Lucky day')
        .ok('Sim')
        .cancel('Não');
	  $mdDialog.show(confirm).then(function() {
		  $scope.alterarSituacao(selecionado);
		  $scope.toast("Situação de Usuário alterada com sucesso!")
	  }, function() {
		  selecionado.situacao = !selecionado.situacao
	  });
	  
  };
  
  $scope.listUsers = function () {
	  usuarioService.getUsuarios().
	  	success ( function ( data ){
		  $scope.usuarios = data;
		  console.log("listou!")
	  })
  };
  
  $scope.adicionarUsuario = function(usuario) {
		usuarioService.saveUsuario($scope.usuario).
		success(function(){
			$location.path("/usuario");
			$scope.toast("Usuário Cadastrado com Sucesso!")
		})
		.error(function(data,status,headers,config) {
			console.log("erro");
		})
  	};
  	
  	
  	
	$scope.editarUsuario  = function(){
		usuarioService.editarUsuario($scope.usuario.id, $scope.usuario).
		success(function(){
			console.log("Editado com sucesso")
			delete $scope.usuario;
			$location.path("/usuario");
			$scope.toast("Usuário Alterado com Sucesso!")
		})
		.error(function() {
			console.log("erro");
		})
	};
 
  $scope.selected = [];
  

  
  

  

}]);


