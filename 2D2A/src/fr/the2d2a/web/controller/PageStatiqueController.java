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

public class PageStatiqueController implements Controller {

	private static Logger logger = Logger.getLogger(PageStatiqueController.class);
	
	private MailService mailService;
	
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		logger.debug("in handleRequest");
		
		String lang = (String)request.getSession().getAttribute(WebConstants.LANGUE);
		Map<String, Object> model = new HashMap<String, Object>();
		String idCondition = request.getParameter("idPage");
		
		String pageStatique = mailService.getConditionsGenerales(lang, idCondition);
		
		model.put("pageStatique", pageStatique);
		// on rajoute des ID pour retourner vers la bonne vue.
		if (idCondition.equals("3")) {
			return new ModelAndView("quiSommesNous", model);
		} else if (idCondition.equals("4")) {
			return new ModelAndView("contact", model);
		} else if (idCondition.equals("5")) {
			return new ModelAndView("infosLegales", model);
		} else if (idCondition.equals("6")) {
			return new ModelAndView("serviceClient", model);
		} else if (idCondition.equals("7")) {
			return new ModelAndView("aide", model);
		} else {
			return new ModelAndView("conditionsGenerales", model);
		}
	}

	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}
}
