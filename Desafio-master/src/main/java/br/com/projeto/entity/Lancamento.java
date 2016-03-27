package br.com.projeto.entity;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.data.jpa.domain.AbstractPersistable;
import com.sun.istack.internal.NotNull;
import com.sun.javafx.scene.control.skin.FXVK.Type;

@Entity
@Table(name = "lancamento")
public class Lancamento extends AbstractPersistable<Long>{
	
	private String observacao;
	
	@NotNull
	private BigDecimal valor;
	
/*	@ManyToOne
	@JoinColumn(columnDefinition="integer",name="id_contabancariaorigem")
	private ContaBancaria contaBancariaOrigem;
	
	@ManyToOne
	@JoinColumn(columnDefinition="integer", name="id_contabancariadestino")
	private ContaBancaria contaBancariaDestino;*/
	
	@ManyToOne
	@JoinColumn(columnDefinition="integer", name="id_contabancaria")
	private ContaBancaria contaBancaria;
	
	@Enumerated(EnumType.STRING)
	private TipoLancamento tipoLancamento;

	@Temporal(TemporalType.DATE)
	private Calendar data;
	
	public Calendar getData() {
		return data;
	}

	public void setData(Calendar data) {
		this.data = data;
	}

	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

	public BigDecimal getValor() {
		return valor;
	}

	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}

	public TipoLancamento getTipoLancamento() {
		return tipoLancamento;
	}

	public void setTipoLancamento(TipoLancamento tipoLancamento) {
		this.tipoLancamento = tipoLancamento;
	}
	
/*	public ContaBancaria getContaBancariaOrigem() {
		return contaBancariaOrigem;
	}

	public void setContaBancariaOrigem(ContaBancaria contaBancariaOrigem) {
		this.contaBancariaOrigem = contaBancariaOrigem;
	}*/

/*	public ContaBancaria getContaBancariaDestino() {
		return contaBancariaDestino;
	}

	public void setContaBancariaDestino(ContaBancaria contaBancariaDestino) {
		this.contaBancariaDestino = contaBancariaDestino;
	}*/
	
	

	@Override
	protected void setId(Long id) {
		// TODO Auto-generated method stub
		super.setId(id);
	}

	public ContaBancaria getContaBancaria() {
		return contaBancaria;
	}

	public void setContaBancaria(ContaBancaria contaBancaria) {
		this.contaBancaria = contaBancaria;
	}
	
	
	
	

}
