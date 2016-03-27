<%-- <%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> --%>
    <md-content layout="column" flex ng-init="buscar()">
    	<h2 style="margin-left:10px">Movimentações</h2>
    	</div>
    	

      <md-card>
        <md-toolbar class="md-table-toolbar md-default" ng-hide="options.rowSelection && selected.length">
          <div class="md-toolbar-tools">
            <!-- <span>Lista de Usuários</span> -->
       <div layout="row">
    	<md-datepicker ng-model="dataDe" md-placeholder="De"></md-datepicker>
    	<md-datepicker ng-model="dataAte" md-placeholder="Até"></md-datepicker>
		<md-button class="md-raised" ng-click="buscar()">Buscar</md-button>
    	
    	</div>
		    <div flex="40">
    	        <md-input-container class="md-block">

          		</md-input-container>
	    	</div>
    		<div flex layout="row" layout-align="end end">
				<md-button class="md-raised md-primary" style="color:white;" href="#/lancamento/deposito">Depósito<ng-md-icon icon="arrow_forward"></g-md-icon></md-button>
    			<md-button class="md-raised md-primary" style="color:white;" href="#/lancamento/saque">Saque<ng-md-icon icon="arrow_back"></g-md-icon></md-button>
    			<md-button class="md-raised md-primary" style="color:white;" href="#/lancamento/transferencia">Transferência<ng-md-icon icon="swap_horiz"></md-button>
    		</div>

          </div>
        </md-toolbar>
        <md-divider></md-divider>
        <md-table-container>
          <table md-table md-disable-select="" md-progress="deferred">
            <thead md-head md-order="query.order" md-on-reorder="logOrder">
              <tr md-row md-no-checkbox="false">
                <th md-column md-order-by="operacao"><span>Operação</span></th>
                <th md-column md-order-by="valor"><span>Valor</span></th>
                <th md-column md-order-by="banco"><span>Banco</span></th>
                <th md-column md-order-by="numero"><span>Nr. Conta</span></th>
                <th md-column md-order-by="titular"><span>Titular</span></th>
                <th md-column md-order-by="data"><span>Data</span></th>
              </tr>
            </thead>
            <tbody md-body>
              <tr md-row md-auto-select="" ng-repeat="lancamento in lancamentos | filter: busca | orderBy: '-nome'">
                <td md-cell>{{lancamento.tipoLancamento}}</td>
                <td md-cell>{{lancamento.valor  | currency}}</td>
                <td md-cell>{{lancamento.contaBancaria.banco}}</td>
                <td md-cell>{{lancamento.contaBancaria.numero}}</td>
                <td md-cell>{{lancamento.contaBancaria.usuario.nome}}</td>
                <td md-cell>{{ lancamento.data | date:'dd/MM/yyyy'}}</td>
              </tr>
            </tbody>
          </table>
        </md-table-container>

        <md-table-pagination md-limit="query.limit" md-page="query.page" md-total="{{desserts.count}}" md-page-select="options.pageSelector" md-boundary-links="options.boundaryLinks" md-on-paginate="logPagination"></md-table-pagination>
      </md-card>
    </md-content>
	
