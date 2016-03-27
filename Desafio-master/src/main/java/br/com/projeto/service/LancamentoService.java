package br.com.projeto.service;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.faces.render.ResponseStateManager;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import br.com.projeto.entity.ContaBancaria;
import br.com.projeto.entity.Erro;
import br.com.projeto.entity.Lancamento;
import br.com.projeto.entity.Transferencia;
import br.com.projeto.entity.UsuarioLogado;
import br.com.projeto.repository.ContaBancariaRepository;
import br.com.projeto.repository.LancamentoRepository;
import junit.framework.Assert;

@Service
public class LancamentoService {

	@Autowired
	private LancamentoRepository lancamentoRepository;
	
	@Autowired 
	private ContaBancariaRepository contaBancariaRepository; 
	
	public List<Lancamento> findAll(SecurityContextHolderAwareRequestWrapper request){
		
		boolean roleAdministrador = request.isUserInRole("ROLE_ADMINISTRADOR");
		if(roleAdministrador == true)
		{
			return lancamentoRepository.findAll();	
		}
		else
		{
			UsuarioLogado user = (UsuarioLogado)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			return lancamentoRepository.findByUsuario(user.getId());
		}
	}

	public List<Lancamento> findByDate(Calendar dataInicio, Calendar dataFim, SecurityContextHolderAwareRequestWrapper request){
		
		boolean roleAdministrador = request.isUserInRole("ROLE_ADMINISTRADOR");
		if(roleAdministrador == true)
		{
			return lancamentoRepository.findByData(dataInicio, dataFim);	
		}
		else
		{
			UsuarioLogado user = (UsuarioLogado)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			return lancamentoRepository.findByDataUsuario(dataInicio, dataFim, user.getId());
		}
	}
	
	public Lancamento efetuarDeposito(Lancamento lancamento){
		Long id = lancamento.getContaBancaria().getId();
		ContaBancaria contaBancaria = contaBancariaRepository.findOne(id);
		BigDecimal saldoAtual = contaBancaria.getSaldo().add(lancamento.getValor());
		contaBancaria.setSaldo(saldoAtual);
		contaBancariaRepository.save(contaBancaria);
		return lancamentoRepository.save(lancamento);
	}
	
	public ResponseEntity<?> efetuarSaque(Lancamento lancamento){
		Long id = lancamento.getContaBancaria().getId();
		ContaBancaria contaBancaria = contaBancariaRepository.findOne(id);
		BigDecimal saldoAtual = contaBancaria.getSaldo().subtract(lancamento.getValor());

		if(saldoAtual.signum() == -1){
			Erro erro = new Erro();
			erro.setMensagem("Operação negada, saldo negativo");
			return new ResponseEntity<>(erro,HttpStatus.CONFLICT);
	    }
		
		contaBancaria.setSaldo(saldoAtual);
		contaBancariaRepository.save(contaBancaria);
		lancamentoRepository.save(lancamento);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	public ResponseEntity<?> efetuarTransferencia(Transferencia transferencia){
		try {
			lancamentoRepository.save(transferencia.getEntrada());
			lancamentoRepository.save(transferencia.getSaida());
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.CONFLICT).body(e);
		}

	}
	
	



	
}
