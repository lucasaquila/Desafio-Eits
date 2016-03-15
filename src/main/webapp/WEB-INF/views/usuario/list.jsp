<%-- <%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> --%>
    <md-content layout="column" flex ng-init="listUsers()">
    	<h2>Lista de Usuários</h2>
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
    		<div flex layout="row" layout-align="end end">
    			<md-button class="md-raised md-primary" style="color:white; background-color:green" href="#/usuario/form">Novo</md-button>
    		</div>
          </div>
        </md-toolbar>
        <md-divider></md-divider>
        <md-table-container>
          <table md-table md-row-select="options.rowSelection" ng-model="selected" md-progress="promise">
            <thead md-head md-order="query.order" md-on-reorder="logOrder">
              <tr md-row>
                <th md-column md-order-by="nome"><span>Nome</span></th>
                <th md-column md-order-by="email"><span>E-mail</span></th>
                <th md-column md-order-by="tipo"><span>Tipo</span></th>
                <th md-column md-order-by="situacao"><span>Situação</span></th>
                <th md-column><span>Ações</span></th>
              </tr>
            </thead>
            <tbody md-body>
              <tr md-row md-select="usuario" md-on-select="logItem" md-auto-select="options.autoSelect" ng-repeat="usuario in usuarios | filter: busca | orderBy: '-nome' | limitTo: query.limit : (query.page -1) * query.limit">
                <td md-cell>{{usuario.nome}}</td>
                <td md-cell>{{usuario.email}}</td>
                <td md-cell>{{usuario.tipoUsuario == "ROLE_USUARIO" ? "Usuário" : "Administrador" }}</td>
                <td md-cell>
                    <md-switch ng-model="usuario.situacao" aria-label="Switch 2" class="md-primary" ng-change="alterarSituacao(usuario)">
    				{{ usuario.situacao == true ? "Ativado" : "Desativado" }} 
    				</md-switch>
                </td>
                <td md-cell>
        			<md-button class="md-icon-button" aria-label="edit">
        			<ng-md-icon icon="edit"> </g-md-icon>
					</md-button>
        			<md-button class="md-icon-button" aria-label="edit">
        			<ng-md-icon icon="delete"> </g-md-icon>
					</md-button>

				</td>
              </tr>
            </tbody>
          </table>
        </md-table-container>

        <md-table-pagination md-limit="query.limit" md-page="query.page" md-total="{{desserts.count}}" md-page-select="options.pageSelector" md-boundary-links="options.boundaryLinks" md-on-paginate="logPagination"></md-table-pagination>
      </md-card>
    </md-content>
	
