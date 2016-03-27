package br.com.projeto.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage(){
		return "/auth/login";
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public ModelAndView login( 
			@RequestParam(value = "error", required = false) boolean error,
			@RequestParam(value = "logout", required = false) boolean logout, ModelMap model){
		
		System.out.println("Entrou no login");
		if(error)
		{
			System.out.println("login invalido");
			model.addAttribute("error", "Login Inválido, senha ou nome de usuário não confere");
			return new ModelAndView("/auth/login", model);
		}
		
		if(error)
		{
			model.addAttribute("logout", "Usuário saiu do sistema com sucesso");
			return new ModelAndView("/auth/login", model);
		}
		return new ModelAndView("redirect:/usuario");
	}
	
	@RequestMapping(value="/denied", method = RequestMethod.GET)
	public ModelAndView acessoNegado() {
		return new ModelAndView("error", "mensagem", "Acesso negado, area restrita.");
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){    
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }
	    return "/auth/login";
	}
}
