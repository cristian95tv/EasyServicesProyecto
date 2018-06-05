package com.upc.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.upc.entity.Plantilla;
import com.upc.entity.Servicio;
import com.upc.service.EmpleadoService;
import com.upc.service.EmpresaService;
import com.upc.service.ListaEmpleadoSolicitudService;
import com.upc.service.ListaSucursalService;
import com.upc.service.PlantillaService;
import com.upc.service.ServicioService;
import com.upc.service.TipoEmpresaService;

@Controller
public class PerfilIndependienteController {

	@Autowired
	private EmpleadoService empleadoService;
	private TipoEmpresaService tipoEmpresaService;
	private ListaEmpleadoSolicitudService listaEmpleadoSolicitudService;
	private ServicioService servicioService;
	private PlantillaService plantillaService;
	private EmpresaService empresaService;
	
	//ListaSolicitudesIndependiente
	@RequestMapping(value= "/EmpresaIndependiente/Solicitud/{id}", method = RequestMethod.GET)
	public String listSolicitd(@PathVariable Integer id,Model model) {
		model.addAttribute("listaSolicitud", listaEmpleadoSolicitudService.getListaEmpleadoSolicitudByPlantillaEmpresa(empresaService.getEmpresaById(id)));
		return "listaSolicitud";
	}
	
	//PlantillaIndependiente
		@RequestMapping(value= "/EmpresaIndependiente/Plantilla/{id}", method = RequestMethod.GET)
		public String listPlantilla(@PathVariable Integer id,Model model) {
				model.addAttribute("listaPlantilla",plantillaService.getPlantillaByEmpresa(empresaService.getEmpresaById(id)));
				return "listaPlantilla";
		}
		
		@RequestMapping("/EmpresaIndependiente/Plantilla/new")
		public String newPlantilla(Model model){
			model.addAttribute("plantilla", new Plantilla());
			return "plantilla";
		}
		
		@RequestMapping(value = "/EmpresaIndependiente/Plantilla", method = RequestMethod.POST)
		public String savePlantilla(Plantilla plantilla){
			plantillaService.savePlantilla(plantilla);
			return "redirect:/EmpresaIndependiente/Plantilla";
		}
		
		@RequestMapping(value= "/EmpresaIndependiente/Plantilla/edit/{id}", method = RequestMethod.GET)
		public String editPlantilla(@PathVariable Integer id, Model model){
			Plantilla plantilla = plantillaService.getPlantillaById(id);
			model.addAttribute("plantilla", plantilla);
			return "plantilla";
		}
		
		@RequestMapping("/EmpresaIndependiente/Plantilla/delete/{id}")
		public String deletePlantilla(@PathVariable Integer id){
			plantillaService.deletePlantilla(id);
			return "redirect:/EmpresaCompañia/Plantilla";
		}
		
		//ServicioIndependiente
				@RequestMapping(value= "/EmpresaIndependiente/Servicio/{id}", method = RequestMethod.GET)
				public String listServicio(@PathVariable Integer id,Model model) {
						model.addAttribute("listaServicio",servicioService.getServicioByEmpleado(empleadoService.getEmpleadoById(id)));
						return "listaServicio";
				}
				
				@RequestMapping("/EmpresaIndependiente/Servicio/new")
				public String newServicio(Model model){
					model.addAttribute("servicio", new Servicio());
					return "servicio";
				}
				
				@RequestMapping(value = "/EmpresaIndependiente/Servicio", method = RequestMethod.POST)
				public String saveServicio(Servicio servicio){
					servicioService.saveServicio(servicio);
					return "redirect:/EmpresaIndependiente/Servicio";
				}
				
				@RequestMapping(value= "/EmpresaIndependiente/Servicio/edit/{id}", method = RequestMethod.GET)
				public String editServicio(@PathVariable Integer id, Model model){
					Servicio servicio = servicioService.getServicioById(id);
					model.addAttribute("servicio", servicio);
					return "servicio";
				}
				
				@RequestMapping("/EmpresaIndependiente/Servicio/delete/{id}")
				public String deleteServicio(@PathVariable Integer id){
					servicioService.deleteServicio(id);
					return "redirect:/EmpresaCompañia/Servicio";
				}
		
}
