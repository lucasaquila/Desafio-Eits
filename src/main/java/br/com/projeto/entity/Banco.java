package br.com.projeto.entity;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public enum Banco {
	ITAU,
	CAIXA,
	SANTANDER,
	HSBC
}
