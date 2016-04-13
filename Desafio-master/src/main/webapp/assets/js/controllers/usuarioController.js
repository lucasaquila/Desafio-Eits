angular.module("desafioApp").controller('usuarioController', ['$mdEditDialog', '$q', '$scope', '$timeout', '$http', 'usuarioService','$location', '$routeParams','$mdToast', '$mdDialog',  function ($mdEditDialog, $q, $scope, $timeout, $http, usuarioService, $location, $routeParams,$mdToast, $mdDialog) {
  'use strict';
  
  $scope.query = {
		    order: 'name',
		    limit: 5,
		    page: 1
		  };
  
  $scope.options = {
		    rowSelection: true,
		    multiSelect: true,
		    autoSelect: true,
		    decapitate: false,
		    largeEditDialog: false,
		    boundaryLinks: false,
		    limitSelect: true,
		    pageSelect: true
 };
  
  $scope.toast = function(message, type)
  {
	  $mdToast.show({
	        template: '<md-toast class="md-toast ' + type + '">' + message + '</md-toast>',
	        hideDelay: 6000,
	        position: 'bottom right'
	  });
  }
 
  $scope.alerta = false;
  $scope.mensagem = "";
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
  
  $scope.adicionarUsuario = function(usuario) {
	  
	  if(usuario.id)
	  {
		  //EDIT
			usuarioService.editarUsuario($scope.usuario.id, $scope.usuario).
			success(function(){
				console.log("Editado com sucesso")
				delete $scope.usuario;
				$location.path("/usuario");
				$scope.toast("Usuário Alterado com Sucesso!", "success")
			})
			.error(function() {
				console.log("erro");
			})
	  }
	  else
      {
		  //CREATE
		  usuarioService.saveUsuario($scope.usuario).
		  success(function(){
			  $location.path("/usuario");
			  $scope.toast("Usuário cadastrado com sucesso!", "success")
		  })
		  .error(function(data) {
			  $scope.alerta = true;
			  $scope.mensagem = data.mensagem;
			  $scope.toast(data.mensagem, "error")
		  })
      }

  };
  
  $scope.excluirUsuario = function(id){
	  usuarioService.excluirUsuario(id)
	  .success(function(){
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
		  $scope.toast("Situação de Usuário alterada com sucesso!", "success")
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
  

  	
  	
  	
	$scope.editarUsuario  = function(){
		usuarioService.editarUsuario($scope.usuario.id, $scope.usuario).
		success(function(){
			console.log("Editado com sucesso")
			delete $scope.usuario;
			$location.path("/usuario");
			$scope.toast("Usuário Alterado com Sucesso!", "success")
		})
		.error(function() {
			console.log("erro");
		})
	};
 
  $scope.selected = [];
  

  
  

  

}]);


