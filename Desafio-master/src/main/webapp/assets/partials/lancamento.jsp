<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>		
		<div layout="row">
			<md-content flex>
				<label>Data</label>
				<md-datepicker ng-model="lancamento.data" md-placeholder="Data" disabled></md-datepicker>
			</md-content>
		</div>
		<div layout="row">
		<md-input-container class="md-block" flex>
	    	<label>Valor</label> 
			<input type="number" ng-model="lancamento.valor" min="0" >
		</md-input-container>
		</div>
		<div layout="row">
        <md-input-container class="md-block" flex>
          <label>Observações</label>
          <textarea ng-model="lancamento.observacao" md-maxlength="255" rows="15" md-select-on-focus></textarea>
        </md-input-container>
		</div>
