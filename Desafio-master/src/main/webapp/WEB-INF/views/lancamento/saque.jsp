<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div layout="row" ng-init="listContasBancariasByRole()">
	<div flex="20"></div>
	<div flex=60>
		<h2>Saque</h2>
		<div layout="row">
			<md-autocomplete md-selected-item="lancamento.contaBancaria"
				md-search-text="busca"
				md-items="conta in contasBancariasOrigem | filter: busca"
				md-item-text="'Banco: ' + conta.banco + ' - Nr. Conta: ' + conta.numero + ' - Titular: ' + conta.usuario.nome" 
				md-floating-label="Conta Bancária" flex>
        <md-item-template>
          <span class="item-title">
            <strong>Titular:</strong> {{conta.usuario.nome}} 
          </span>
          <span class="item-metadata">
            <span class="item-metastat">
              <strong>Banco:</strong>  {{conta.banco}}
            </span>
            <span class="item-metastat">
              <strong>Nr. Conta:</strong>  {{conta.numero}}
            </span> 
          </span>
        </md-item-template>
    	</md-autocomplete>
		</div>
		<div ng-app="lancamentoController" ng-include="'assets/partials/lancamento.jsp'"></div>
		
				<div layout="row">
			<md-button class="md-raised" href="#/lancamento">Voltar</md-button>
			<div flex></div>
			<md-button class="md-raised md-primary" ng-click="sacar(lancamento)">Sacar</md-button>
		</div>
		<div flex></div>
		
</div>