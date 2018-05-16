package br.usjt.projeto.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

@Entity
public class Atendimento {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_atendimento;

	@Enumerated(EnumType.STRING)
	private TipoStatus status;

	@Column(name = "data_inicio")
	private Date dataInicio;

	@Column(name = "data_termino")
	private Date dataTermino;

	@Column(name = "previsao_inicio")
	@NotNull
	private Date previsaoInicio;

	@Column(name = "previsao_termino")
	@NotNull
	private Date previsaoTermino;

	@ManyToOne
	@JoinColumn(name = "id_senha")
	private Senha id_senha;

	@ManyToOne
	@JoinColumn(name = "id_subservico")
	private SubServico subservico;

	

	public int getId_atendimento() {
		return id_atendimento;
	}

	public void setId_atendimento(int id_atendimento) {
		this.id_atendimento = id_atendimento;
	}

	public TipoStatus getStatus() {
		return status;
	}

	public void setStatus(TipoStatus status) {
		this.status = status;
	}

	public Date getDataInicio() {
		return dataInicio;
	}

	public void setDataInicio(Date dataInicio) {
		this.dataInicio = dataInicio;
	}

	public Date getDataTermino() {
		return dataTermino;
	}

	public void setDataTermino(Date dataTermino) {
		this.dataTermino = dataTermino;
	}

	public Date getPrevisaoInicio() {
		return previsaoInicio;
	}

	public void setPrevisaoInicio(Date previsaoInicio) {
		this.previsaoInicio = previsaoInicio;
	}

	public Date getPrevisaoTermino() {
		return previsaoTermino;
	}

	public void setPrevisaoTermino(Date previsaoTermino) {
		this.previsaoTermino = previsaoTermino;
	}

	public Senha getId_senha() {
		return id_senha;
	}

	public void setId_senha(Senha id_senha) {
		this.id_senha = id_senha;
	}

	public SubServico getSubservico() {
		return subservico;
	}

	public void setSubservico(SubServico subservico) {
		this.subservico = subservico;
	}

	@Override
	public String toString() {
		return "Atendimento [id_atendimento=" + id_atendimento + ", status=" + status + ", dataInicio=" + dataInicio + ", dataTermino="
				+ dataTermino + ", previsaoInicio=" + previsaoInicio + ", previsaoTermino=" + previsaoTermino
				+ ", id_senha=" + id_senha + ", subservico=" + subservico + "]";
	}

}
