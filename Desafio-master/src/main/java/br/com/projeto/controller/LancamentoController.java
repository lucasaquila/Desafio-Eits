package br.com.projeto.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import br.com.projeto.entity.Lancamento;
import br.com.projeto.entity.Transferencia;
import br.com.projeto.service.LancamentoService;

@Controller
@Transactional
@RestController
@RequestMapping("/lancamento")
public class LancamentoController {
	
	@Autowired
	private LancamentoService lancamentoService;
	
	@RequestMapping(value = "/deposito", method = RequestMethod.GET)
	public ModelAndView formDepostio(){
		ModelAndView modelAndView =	new ModelAndView("lancamento/deposito");
		return modelAndView;
	}
	
	@RequestMapping(value = "/saque", method = RequestMethod.GET)
	public ModelAndView formSaque(){
		ModelAndView modelAndView =	new ModelAndView("lancamento/saque");
		return modelAndView;
	}
	
	@RequestMapping(value = "/transferencia", method = RequestMethod.GET)
	public ModelAndView formTransferencia(){
		ModelAndView modelAndView =	new ModelAndView("lancamento/transferencia");
		return modelAndView;
	}

	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView list(){
		ModelAndView modelAndView = new ModelAndView("lancamento/list");
		return modelAndView;
	}
	
	@RequestMapping("/getLancamentos")
	public List<Lancamento> getContasBancarias(SecurityContextHolderAwareRequestWrapper request){
		List<Lancamento> lancamentos = lancamentoService.findAll(request);
		return lancamentos;
	}
	
	@RequestMapping("/getLancamentosData")
	public List<Lancamento> getLancamentosPorData(@RequestParam(value = "dataDe", required = false) Calendar dataDe, 
													@RequestParam(value = "dataAte", required = false) Calendar dataAte,
													SecurityContextHolderAwareRequestWrapper request){
		System.out.println("Chegou =P");
		List<Lancamento> lancamentos = lancamentoService.findByDate(dataDe, dataAte, request);
		return lancamentos;
	}
	
	@RequestMapping(value = "/efetuarDeposito", method = RequestMethod.POST)
	public Lancamento efetuarDeposito(@RequestBody Lancamento lancamento){
        return lancamentoService.efetuarDeposito(lancamento);
	}
	
	@RequestMapping(value = "/efetuarSaque", method = RequestMethod.POST)
	public ResponseEntity<?> efetuarSaque(@Valid @RequestBody Lancamento lancamento){

        return lancamentoService.efetuarSaque(lancamento);
	}
	
	@RequestMapping(value = "/efetuarTransferencia", method = RequestMethod.POST)
	public ResponseEntity<?> efetuarTransferencia(@RequestBody Transferencia transferencia){
		return lancamentoService.efetuarTransferencia(transferencia);
		 
	}

	
}
