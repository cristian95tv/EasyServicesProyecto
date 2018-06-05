package com.upc.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.upc.service.EspecialidadService;
import com.upc.service.PreguntaService;
import com.upc.service.RespuestaService;
import com.upc.service.SolicitudService;


@Controller
public class PerfilAdministradorController {
	
	@Autowired
	private SolicitudService solicitudService;
	private PreguntaService preguntaService;
	private RespuestaService respuestaService;
	private EspecialidadService especialidadService;
	
}
