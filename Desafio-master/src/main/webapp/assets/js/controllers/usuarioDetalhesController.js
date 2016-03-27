angular.module("desafioApp").controller('usuarioDetalhesController', function ($scope, $routeParams,$location, usuario, usuarioService){
	$scope.usuario = usuario.data;
	
	$scope.editarUsuario = function(usuario){
		usuarioService.editarUsuario($scope.usuario.id, $scope.usuario).
		success(function(){
			console.log("Editado com sucesso")
			delete $scope.usuario;
			$location.path("/usuario");
		})
		.error(function() {
			console.log("erro");
		})
	};
	
  });

