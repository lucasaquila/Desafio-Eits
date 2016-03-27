package br.com.projeto.entity;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.springframework.data.jpa.domain.AbstractPersistable;
import org.springframework.data.jpa.domain.AbstractPersistable_;

@Entity
@Table(name = "contabancaria")
public class ContaBancaria extends AbstractPersistable<Long>{
	
	@NotNull
	@Column(nullable=false, length=10)
	private String agencia;
	
	@NotNull
	@Column(nullable=false, length=20)
	private String numero;
	
	private BigDecimal saldo;
	
	@ManyToOne
	@JoinColumn(name="id_usuario")
	private Usuario usuario;
	
	@Enumerated(EnumType.STRING)
	private Banco banco;

	@Override
	protected void setId(Long id) {
		super.setId(id);
	}

	public String getAgencia() {
		return agencia;
	}

	public void setAgencia(String agencia) {
		this.agencia = agencia;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public BigDecimal getSaldo() {
		return saldo;
	}

	public void setSaldo(BigDecimal saldo) {
		this.saldo = saldo;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Banco getBanco() {
		return banco;
	}

	public void setBanco(Banco banco) {
		this.banco = banco;
	}
	
}
