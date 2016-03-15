<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>		
		<div layout="row">
			  <div flex="20">
			  </div>
			  <div flex=60>
		  <h2>Cadastro de Usuários</h2>
		  <p>Tipo de Usuário</p>
    	   <md-radio-group ng-model="usuario.tipoUsuario">
		      <md-radio-button value="ROLE_USUARIO" aria-checked="true" class="md-checked">Usuário</md-radio-button>
		      <md-radio-button value="ROLE_ADMINISTRADOR">Administrador</md-radio-button>
           </md-radio-group>
		   </md-input-container>		  
          <md-input-container class="md-block" flex-gt-sm>
	      	<label>Nome</label>
	      		<input ng-model="usuario.nome">
	      </md-input-container>
          <md-input-container class="md-block" flex-gt-sm>
          	<label>E-mail</label>
            	<input ng-model="usuario.email">
          </md-input-container>
          <md-input-container class="md-block" flex-gt-sm>
          	<label>Senha</label>
            	<input ng-model="usuario.password" type="password">
          </md-input-container>
          <div layout="row">
          <%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
          <md-button class="md-raised" href="#/usuario">Voltar</md-button>
          <div flex></div>
          <md-button class="md-raised md-primary" ng-click="adicionarUsuario(usuario)">Salvar</md-button>
		  </div>
			  <div flex>
			  </div>
		</div>
        </div>