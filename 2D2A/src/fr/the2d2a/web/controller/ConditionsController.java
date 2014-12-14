package fr.the2d2a.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import fr.the2d2a.service.MailService;
import fr.the2d2a.web.constants.WebConstants;

public class ConditionsController implements Controller {

	private static Logger logger = Logger.getLogger(ConditionsController.class);
	
	private MailService mailService;
	
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		logger.debug("in handleRequest");
		
		String lang = (String)request.getSession().getAttribute(WebConstants.LANGUE);
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		String idCondition = request.getParameter("cg");
		
		String conditionsGenerales = mailService.getConditionsGenerales(lang, idCondition);
		
		model.put("conditionsGenerales", conditionsGenerales);
		model.put("no_auth", "no_auth");
		
		return new ModelAndView("conditionsGenerales", model);
	}

	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}

}
