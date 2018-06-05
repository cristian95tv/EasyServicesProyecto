package com.upc.entity;

// default package
// Generated 17-may-2018 13:26:54 by Hibernate Tools 5.3.0.Beta2


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Pais generated by hbm2java
 */
@Entity
@Table(name = "pais")
public class Pais {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int idpais;
	private String nombre;
	private String descripcion;

	public Pais() {
		super();
	}


	public Integer getIdpais() {
		return this.idpais;
	}

	public void setIdpais(Integer idpais) {
		this.idpais = idpais;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}


}
