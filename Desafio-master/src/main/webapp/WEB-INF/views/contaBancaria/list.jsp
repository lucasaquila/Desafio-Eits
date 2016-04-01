<%-- <%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> --%>
    <md-content layout="column" flex ng-init="listContasBancarias()">
    	<h2 style="margin-left:10px">Contas Bancárias</h2>
    	</div>
      <md-card>
        <md-toolbar class="md-table-toolbar md-default" ng-hide="options.rowSelection && selected.length">
          <div class="md-toolbar-tools">
            <!-- <span>Lista de Usuários</span> -->

		    <div flex="40">
    	        <md-input-container class="md-block">
        	    <label>O que você está buscando?</label>
            	<input ng-model="busca">
          		</md-input-container>
	    	</div>
<!--     		<div flex="50">
    			<md-button class="md-raised md-primary" style="color:white">Pesquisar</md-button>
    		</div> -->
    		<security:authorize access="hasAnyRole('ADMINISTRADOR')">
    		<div flex layout="row" layout-align="end end">
    			<md-button class="md-raised md-primary" style="color:white; background-color:#4EBD4E" href="#/contaBancaria/form">Novo</md-button>
    		</div>
    		</security:authorize>
          </div>
        </md-toolbar>
        <md-divider></md-divider>
        <md-table-container>
          <table md-table md-disable-select="" md-progress="deferred">
            <thead md-head md-order="query.order" md-on-reorder="logOrder">
              <tr md-row md-no-checkbox="false">
                <th md-column md-order-by="usuario"><span>Titular</span></th>
                <th md-column md-order-by="banco"><span>Banco</span></th>
                <th md-column md-order-by="agencia"><span>Agência</span></th>
                <th md-column md-order-by="numero"><span>Nr. Conta</span></th>
                <th md-column md-order-by="saldo"><span>Saldo</span></th>
                <security:authorize access="hasAnyRole('ADMINISTRADOR')">
                <th md-column><span>Ações</span></th>
                </security:authorize>
              </tr>
            </thead>
            <tbody md-body>
              <tr md-row  ng-click="detalhe(conta)" md-auto-select="" ng-repeat="conta in contasBancarias | filter: busca | orderBy: '-nome'">
                <td md-cell>{{conta.usuario.nome}}</td>
                <td md-cell>{{conta.banco}}</td>
                <td md-cell>{{conta.agencia}}</td>
                <td md-cell>{{conta.numero}}</td>
                <td md-cell>{{conta.saldo | currency }}</td>
                <security:authorize access="hasAnyRole('ADMINISTRADOR')">
                <td md-cell>
        			<md-button class="md-icon-button md-primary md-button md-ink-ripple" size="20" aria-label="edit" href="#/contaBancaria/editar/{{conta.id}}">
        			<ng-md-icon icon="edit" size="20"> </g-md-icon>
					</md-button>
        			<md-button class="md-icon-button md-primary md-button md-ink-ripple" size="20" aria-label="excluir" ng-click="excluirContaBancaria(conta.id);$event.stopPropagation()" style="z-index:1">
        			<ng-md-icon icon="delete" size="20"> </g-md-icon>
					</md-button>
        			<md-button ng-if="conta.saldo == 0" class="md-icon-button md-primary md-button md-ink-ripple" aria-label="edit" href="#/contaBancaria/saldoInicial/{{conta.id}}">
        			<ng-md-icon icon="attach_money" size="20"> </g-md-icon>
					</md-button>
				</td>
				</security:authorize>
              </tr>
            </tbody>
          </table>
        </md-table-container>

        <md-table-pagination md-limit="query.limit" md-page="query.page" md-total="{{desserts.count}}" md-page-select="options.pageSelector" md-boundary-links="options.boundaryLinks" md-on-paginate="logPagination"></md-table-pagination>
      </md-card>
    </md-content>
	
