package br.com.projeto.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper;
import org.springframework.stereotype.Service;

import br.com.projeto.entity.ContaBancaria;
import br.com.projeto.entity.Usuario;
import br.com.projeto.entity.UsuarioLogado;
import br.com.projeto.repository.ContaBancariaRepository;

@Service
public class ContaBancariaService {
	
	@Autowired
	private ContaBancariaRepository repository;
	
	public ContaBancaria findById(Long id)
	{
		return repository.findOne(id);
	}
	
	public List<ContaBancaria> findAll(){
		return repository.findAll();	
	}
	
	//
	public List<ContaBancaria> findAll(SecurityContextHolderAwareRequestWrapper request){
		
		boolean roleAdministrador = request.isUserInRole("ROLE_ADMINISTRADOR");
		if(roleAdministrador == true)
		{
			return repository.findAll();	
		}
		else
		{
			UsuarioLogado user = (UsuarioLogado)SecurityContextHolder.getContext().getAuthentication().getPrincipal();

			return repository.findByUsuario(user.getId());
		}
	}
	
	public ContaBancaria save(ContaBancaria contaBancaria){
		return repository.save(contaBancaria);
	}
	
	public void inserirSaldoInicial(Long id, BigDecimal saldo) {
		ContaBancaria conta = this.repository.findOne(id);
		if (conta.getSaldo().compareTo(BigDecimal.ZERO) <= 0)
		{
			repository.inserirSaldoInicial(id, saldo);
		}
	}
	
	public ContaBancaria updateContaBancaria(ContaBancaria contaBancaria) {
		return repository.save(contaBancaria);
	}
	
	public void deleteContaBancaria(Long id){
		repository.delete(id);
	}
}