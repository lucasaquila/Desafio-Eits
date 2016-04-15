<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<div layout="row" ng-init="listContasBancarias()" id="fromHTMLtestdiv">
	<div flex="20"></div>
	<div flex=60>
		<h2>Detalhes da Conta Bancária</h2>
			<div layout="row">
				<md-input-container class="md-block" flex-gt-sm flex="50">
				<div layout="row">
					<span class="detail-label">Titular</span>
				</div>
				<div layout="row">
					<span ng-bind="contaBancaria.usuario.nome"  class="detail"></span>
				</div>
				</md-input-container>
			</div>
 			<div layout="row">
				<md-input-container class="md-block" flex-gt-sm flex="40">
				<div layout="row">
					<span class="detail-label">Nr. Conta</span>
				</div>
				<div layout="row">
					<span ng-bind="contaBancaria.numero"  class="detail"></span>
				</div>
				</md-input-container>
				<md-input-container class="md-block" flex-gt-sm flex="40">
				<div layout="row">
					<span class="detail-label">Banco</span>
				</div>
				<div layout="row">
					<span ng-bind="contaBancaria.banco"  class="detail"></span>
				</div>
				</md-input-container>
				<md-input-container class="md-block" flex-gt-sm flex>
				<div layout="row">
					<span class="detail-label">Agência</span>
				</div>
				<div layout="row">
					<span ng-bind="contaBancaria.agencia"  class="detail"></span>
				</div>
				</md-input-container>
			</div>
		
		
		
			<div layout="row">
				<md-input-container class="md-block" flex-gt-sm flex="50">
				<div layout="row">
					<span class="detail-label">Saldo</span>
				</div>
				<div layout="row">
					<span ng-bind="(contaBancaria.saldo | currency)"  class="detail"></span>
				</div>
				</md-input-container>
			</div>
			<div layout="row">
			<md-button class="md-raised" href="#/contaBancaria">Voltar</md-button>
			<div flex></div>
		</div>
		</div>
		<div flex></div>
</div>




<%-- <%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div layout="row" ng-init="listaBancos()">
	<div flex="20"></div>
	<div flex=60>
		<h2>Detalhes da Conta</h2>
		<div layout="row">
			<md-autocomplete md-selected-item="contaBancaria.usuario" ng-disabled="true"
				md-search-text="busca"
				md-items="usuario in usuarios | filter: busca"
				md-item-text="usuario.nome" md-floating-label="Usuário" flex="70">
			<span md-highlight-text="nome">{{usuario.nome + ' - ' +
				usuario.email }}</span> </md-autocomplete>
		</div>
		<div layout="row">
   		<md-input-container class="md-block" flex> 
			<label>Banco</label> 
			<md-select ng-model="contaBancaria.banco" ng-disabled="true">
			<md-option ng-repeat="banco in bancos" value="{{banco}}">
			{{banco}} </md-option> </md-select> </md-input-container>
			<md-input-container class="md-block" flex-gt-sm flex="30">
			<label>Agência</label> <input ng-model="contaBancaria.agencia" ng-disabled="true"
				placeholder="Insira a agência"> </md-input-container>
			
			<md-input-container class="md-block" flex-gt-sm flex="30">
			<label>Número da Conta</label> 
			<input ng-model="contaBancaria.numero" placeholder="Insira o número da conta" ng-disabled="true"> 
			</md-input-container>
		</div>
		<div layout="row">
		<md-input-container class="md-block" flex>
	    	<label>Saldo</label> 
			<input type="text" ng-model="contaBancaria.saldo" ng-disabled="true">
		</md-input-container>
		</div>
		<div layout="row">
			<md-button class="md-raised" href="#/contaBancaria">Voltar</md-button>
			<div flex></div>
<!-- 			<md-button class="md-raised md-primary"
				ng-click="atualizarSaldoInicial(contaBancaria)">Inserir</md-button> -->
		</div>
		<div flex></div>
	</div>
</div> --%>