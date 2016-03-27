<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>		
		<div layout="row">
			  <div flex="20">
			  </div>
			  <div flex=60>
		  <h2>Cadastro de Usuários</h2>
		  <p>Tipo de Usuário</p>
		  <form ng-submit="adicionarUsuario(usuario)" name="formulario">
		  <md-input-container class="md-block" flex-gt-sm>
    	   <md-radio-group ng-model="usuario.tipoUsuario">
		      <md-radio-button value="ROLE_USUARIO" aria-checked="true" class="md-checked">Usuário</md-radio-button>
		      <md-radio-button value="ROLE_ADMINISTRADOR">Administrador</md-radio-button>
           </md-radio-group>
		   </md-input-container>		  
          <md-input-container class="md-block" flex-gt-sm>
	      	<label>Nome</label>
	      		<input ng-model="usuario.nome" required ng-maxlength="200">
	      </md-input-container>
	      <div layout="row">
          <md-input-container class="md-block" flex-gt-sm flex="50">
          	<label>E-mail</label>
            	<input type="email" ng-model="usuario.email"  required ng-maxlength="200">
          </md-input-container>
          <md-input-container class="md-block" flex-gt-sm>
          	<label>Senha</label>
            	<input ng-model="usuario.password" type="password"  required ng-maxlength="255">
          </md-input-container>
          </div>
          <div layout="row">
          <md-button class="md-raised" href="#/usuario">Voltar</md-button>
          <div flex></div>
          <!-- <md-button class="md-raised md-primary" ng-click="adicionarUsuario(usuario)" ng-disabled="formulario.$invalid">Salvar</md-button> -->
          <md-button class="md-raised md-primary" type="submit" ng-disabled="formulario.$invalid">Salvar</md-button>
          </form>
		  </div>
			  <div flex>
			  </div>
		</div>
        </div>