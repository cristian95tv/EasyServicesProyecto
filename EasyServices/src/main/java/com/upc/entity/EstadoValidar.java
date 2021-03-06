package com.upc.entity;

// default package
// Generated 17-may-2018 13:26:54 by Hibernate Tools 5.3.0.Beta2


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * EstadoValidar generated by hbm2java
 */
@Entity
@Table(name = "estado_validar")
public class EstadoValidar  {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int idestadoValidar;
	private String nombre;
	private String descripcion;


	public EstadoValidar() {
		super();
	}

	
	public Integer getIdestadoValidar() {
		return this.idestadoValidar;
	}

	public void setIdestadoValidar(Integer idestadoValidar) {
		this.idestadoValidar = idestadoValidar;
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
