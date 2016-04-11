<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div layout="row" ng-init="listaBancos()">
	<div flex="20"></div>
	<div flex=60>
		<h2>Cadastro de Conta Bancária</h2>
		<form name="formContaBancaria" ng-submit="submit(contaBancaria)">
		<div layout="row">
			<md-autocomplete 
				md-input-name="autocomplete" 
				md-selected-item="contaBancaria.usuario"
				md-search-text="busca"
				md-items="usuario in usuarios | filter: busca"
				md-item-text="usuario.nome" 
				md-floating-label="Usuário" 
				flex="70"
				required>
			<span md-highlight-text="nome">{{usuario.nome + ' - ' +
				usuario.email }}</span>


			</md-autocomplete>

		</div>
		<div layout="row">
   		<md-input-container class="md-block" flex> 
			<label>Banco</label>
			<md-select ng-model="contaBancaria.banco">
			<md-option ng-repeat="banco in bancos" value="{{banco}}">
			{{banco}} </md-option> 
			</md-select> 
		</md-input-container>
		<md-input-container class="md-block" flex-gt-sm flex="30">
			<label>Agência</label> 
			<input type="number" min="0" max="99999" ng-model="contaBancaria.agencia" name="agencia" required>
			<div ng-messages="formContaBancaria.agencia.$error">
				<div ng-message="required">Este campo é obrigatório.</div>
				<div ng-message-exp="['min', 'max']">Número inválido. Insira um número entre 0 a 99999.</div>
			</div>
		</md-input-container>
		<md-input-container class="md-block" flex-gt-sm flex="30">
			<label>Número da Conta</label> 
			<input type="number" min="0" max="9999999999" ng-model="contaBancaria.numero" name="numero" required>
			<div ng-messages="formContaBancaria.numero.$error">
				<div ng-message="required">Este campo é obrigatório.</div>
				<div ng-message-exp="['min', 'max']">Número inválido. Insira um número entre 0 a 9999999999.</div>
			</div>
			</md-input-container>
		</div>
		<div layout="row">
			<md-button class="md-raised" href="#/contaBancaria">Voltar</md-button>
			<div flex></div>
<!-- 			<md-button class="md-raised md-primary" ng-if="contaBancaria.id == undefined"
				ng-click="adicionarContaBancaria(contaBancaria)">Salvar</md-button>
			<md-button class="md-raised md-primary" ng-if="contaBancaria.id != undefined"
				ng-click="editarContaBancaria()">Editar</md-button> -->
				<md-button class="md-raised md-primary" type="submit" ng-disabled="formContaBancaria.$invalid">Salvar</md-button>
		</div>
		<div flex></d
		
		iv>
		</form>
	</div>
</div>