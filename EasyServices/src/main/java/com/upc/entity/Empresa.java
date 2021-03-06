package com.upc.entity;

// default package
// Generated 17-may-2018 13:26:54 by Hibernate Tools 5.3.0.Beta2

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Empresa generated by hbm2java
 */
@Entity
@Table(name = "empresa")
public class Empresa  {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int idempresa;
	
	@ManyToOne
	@JoinColumn(name="idusuario")
	private Usuario usuario;
	
	@ManyToOne
	@JoinColumn(name="idtipo_empresa")
	private TipoEmpresa tipoEmpresa;
	
	private String nombre;
	private String RUC;
	private int telefono;
	private int celular;
	private String direccionPrincipal;
	private int calificacion;
	private int horaInicio;
	private int horaFin;
	private String correo;
	private String descripcion;

	public Empresa() {
		super();
	}


	public int getIdempresa() {
		return this.idempresa;
	}

	public void setIdempresa(Integer idempresa) {
		this.idempresa = idempresa;
	}

	public TipoEmpresa getTipoEmpresa() {
		return this.tipoEmpresa;
	}

	public void setTipoEmpresa(TipoEmpresa tipoEmpresa) {
		this.tipoEmpresa = tipoEmpresa;
	}

	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public String getRuc() {
		return this.RUC;
	}

	public void setRuc(String RUC) {
		this.RUC = RUC;
	}

	public int getTelefono() {
		return this.telefono;
	}

	public void setTelefono(int telefono) {
		this.telefono = telefono;
	}

	public Integer getCelular() {
		return this.celular;
	}

	public void setCelular(Integer celular) {
		this.celular = celular;
	}

	public String getDireccionPrincipal() {
		return this.direccionPrincipal;
	}

	public void setDireccionPrincipal(String direccionPrincipal) {
		this.direccionPrincipal = direccionPrincipal;
	}

	public int getCalificacion() {
		return this.calificacion;
	}

	public void setCalificacion(int calificacion) {
		this.calificacion = calificacion;
	}

	public int getHoraInicio() {
		return this.horaInicio;
	}

	public void setHoraInicio(int horaInicio) {
		this.horaInicio = horaInicio;
	}

	public int getHoraFin() {
		return this.horaFin;
	}

	public void setHoraFin(int horaFin) {
		this.horaFin = horaFin;
	}

	public String getCorreo() {
		return this.correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}



}
