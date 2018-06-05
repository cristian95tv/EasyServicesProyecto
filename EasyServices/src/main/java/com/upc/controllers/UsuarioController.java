package com.upc.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.upc.entity.Cliente;
import com.upc.entity.Empleado;
import com.upc.entity.Empresa;
import com.upc.entity.Servicio;
import com.upc.entity.TipoEmpresa;
import com.upc.entity.Usuario;
import com.upc.service.AdministradorService;
import com.upc.service.ClienteService;
import com.upc.service.EmpleadoService;
import com.upc.service.EmpresaService;
import com.upc.service.TipoEmpresaService;
import com.upc.service.UsuarioService;

@Controller
public class UsuarioController {
	
	@Autowired
	private AdministradorService administradorService;
	private UsuarioService usuarioService;
	private ClienteService clienteService;
	private EmpresaService empresaService;
	private EmpleadoService empleadoService;
	private TipoEmpresaService tipoEmpresaService;
	
	
	//ListaUsuarios
	@RequestMapping(value= "/usuarios", method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("usuarios", usuarioService.listAllUsuario());
		return "usuarios";
	}
	//Login
	@RequestMapping(value= "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute("usuario") Usuario usuario,HttpSession session, ModelMap modelMap) {
		if(usuarioService.findByUsernameAndPassword(usuario.getUsername(), usuario.getPassword()) != null){
			session.setAttribute("username", usuario.getUsername());
			return "principal";
		}else{
			modelMap.put("error", "Usuario invalido");
			return "/error";
			
		}
	}
	//PerfilesUsuario
	@RequestMapping(value= "principal", method = RequestMethod.GET)
	public String listPerfiles(Model model) {
		Usuario usuario=usuarioService.getUsuarioById(4);
		TipoEmpresa empresaCompan=tipoEmpresaService.getTipoEmpresaById(1);
		TipoEmpresa empresaIndepen=tipoEmpresaService.getTipoEmpresaById(2);
		//model.addAttribute("administradores",administradorService.getEmpresaByUsuario(usuario));
		model.addAttribute("clientes",clienteService.getEmpresaByUsuario(usuario));
		//model.addAttribute("empresaCompanias", empresaService.getEmpresaByUsuarioAndTipoEmpresa(usuario, empresaCompan));
		//model.addAttribute("empresaIndependientes", empresaService.getEmpresaByUsuarioAndTipoEmpresa(usuario, empresaIndepen));
		//model.addAttribute("empleados", empleadoService.getEmpresaByUsuario(usuario));
		return "/principal";
	}
	
	
	
	//CrearCliente
	@RequestMapping(value = "/RegistrarCliente", method = RequestMethod.POST)
	public String saveCliente(Cliente cliente){
		clienteService.saveCliente(cliente);
		return "redirect:/Registrar";
	}

	//CrearEmpresaCompañia y Independiente
	@RequestMapping(value = "/RegistrarEmpresa", method = RequestMethod.POST)
	public String saveEmpresa(Empresa empresa){
	empresaService.saveEmpresa(empresa);
		return "redirect:/Registrar";
	}
	//CrearEmpleado
	@RequestMapping(value = "/RegistrarEmpleado", method = RequestMethod.POST)
	public String saveEmpleado(Empleado empleado){
	empleadoService.saveEmpleado(empleado);
		return "redirect:/Registrar";
	}
	
	
}
