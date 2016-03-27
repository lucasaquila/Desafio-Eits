<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="pt-br" ng-app="desafioApp">
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="webjars/angular-material/1.0.6/angular-material.css">
	<link rel="stylesheet" href="webjars/angular-material-icons/0.6.0/angular-material-icons.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/md-data-table.min.css">
</head>
<body>
<div ng-controller="indexController">
  <div class="md-red"  layout="column">
    <md-toolbar>
      <div class="md-toolbar-tools">
        <h2>
        <img src="<c:url value="/assets/img/logo.png" />" alt="logo"/>
        </h2>
        <span flex></span>
        
        

<md-button md-no-ink class="md-primary">Bem-vindo <security:authentication property="principal.username" /></md-button>
        
	 <md-button md-no-ink class="md-primary" href="#/logout"><strong>LOGOUT</strong></md-button>
      </div>
    </md-toolbar>
    <md-tabs style="background-color:#EAEAEA">
    	<md-tab label="Usuários" ng-click="redirecionar('/usuario')"></md-tab>
    	<md-tab label="Contas Bancárias" ng-click="redirecionar('/contaBancaria')"></md-tab>
    	<md-tab label="Movimentações" ng-click="redirecionar('lancamento')"></md-tab>
    </md-tabs>
  
    <div ng-view>
   	</div>
	
		
  </div>
</div>
	<script src="webjars/angularjs/1.5.0/angular.min.js"></script>
	<script src="webjars/angular-route/1.5.0/angular-route.min.js"></script>
	<script src="webjars/angular-animate/1.5.0/angular-animate.min.js"></script>
	<script src="webjars/angular-aria/1.5.0/angular-aria.min.js"></script>
	<script src="webjars/angular-messages/1.5.0/angular-messages.min.js"></script>
	<script src="webjars/angular-material/1.0.6/angular-material.min.js"></script>
	<script src="webjars/angular-material-icons/0.6.0/angular-material-icons.min.js"></script>
	<script src="assets/js/md-data-table.min.js"></script>
	<script src="assets/js/angular-locale_pt-br.js"></script>
	<script src="assets/js/app.js"></script>
	<script src="assets/js/config/routeConfig.js"></script>
	<script src="assets/js/config/materialConfig.js"></script>
	<script src="assets/js/controllers/usuarioController.js"></script>
	<!-- <script src="assets/js/controllers/usuarioDetalhesController.js"></script> -->
	<script src="assets/js/controllers/contaBancariaController.js"></script>
	<script src="assets/js/controllers/lancamentoController.js"></script>
	<script src="assets/js/controllers/indexController.js"></script>
	<script src="assets/js/services/usuarioService.js"></script>
	<script src="assets/js/services/contaBancariaService.js"></script>
	<script src="assets/js/services/lancamentoService.js"></script>
	
</body>
</html>
    
    