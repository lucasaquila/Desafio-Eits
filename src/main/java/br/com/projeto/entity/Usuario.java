package br.com.projeto.entity;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.data.jpa.domain.AbstractPersistable;
import org.springframework.data.jpa.domain.AbstractPersistable_;

import javax.validation.constraints.NotNull;

@Entity
@Table(name="usuario")
public class Usuario extends AbstractPersistable<Long>{
	
	@NotBlank
	@Column(nullable= false, length=200)
	private String nome;
	
	@NotBlank
	@Column(nullable=false, length=200, unique = true)
	private String email;
	
	@NotBlank
	@Column(nullable=false)
	private String password;
	
	@Enumerated(EnumType.STRING)
	private TipoUsuario tipoUsuario;
	
	private Boolean situacao;
	
	public String getNome() {
		return nome;
	}

	@Override
	public void setId(Long id) {
		super.setId(id);
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public TipoUsuario getTipoUsuario() {
		return tipoUsuario;
	}

	public void setTipoUsuario(TipoUsuario tipoUsuario) {
		this.tipoUsuario = tipoUsuario;
	}

	public Boolean getSituacao() {
		return situacao;
	}

	public void setSituacao(Boolean situacao) {
		this.situacao = situacao;
	}

	
}
