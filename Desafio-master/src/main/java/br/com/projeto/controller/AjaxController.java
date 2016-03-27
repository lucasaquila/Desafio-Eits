package br.com.projeto.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.projeto.service.ArithmeticService;

@Controller
@RequestMapping("/ajax")
public class AjaxController {
 
 protected static Logger logger = Logger.getLogger("controller");
  
 @Resource(name = "springService")
 private ArithmeticService springService;
  
 /**
  * Handles and retrieves the AJAX Add page
  */
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String getAjaxAddPage() {
     logger.debug("Received request to show AJAX, add page");
      
     return "ajax-add-page";
    }
 }
