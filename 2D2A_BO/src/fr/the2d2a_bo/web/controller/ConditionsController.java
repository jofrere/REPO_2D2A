package fr.the2d2a_bo.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import fr.the2d2a.service.MailService;

public class ConditionsController extends SimpleFormController {
	
	protected static Logger logger = Logger.getLogger(ConditionsController.class);
	
	private MailService mailService;

	
	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		logger.info("In onSubmit ConditionsController...");
		
		String contenu = request.getParameter("contenu");
		
		//Récupération de la langue
		String lang = request.getParameter("lang");
		if (lang == null || lang.equals(""))
			lang = "FR";
		
		logger.debug("contenu : " + contenu + ", lang : " + lang);
		
		//TODO : recupere ID
		logger.debug("Modification des conditions generales");
		mailService.updateConditionsGenerales(lang, contenu, "1");
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("lang", lang);
		model.put("contenu", contenu);
		
		return new ModelAndView(this.getSuccessView(), model);
	}
	
	@Override
	protected ModelAndView showForm(HttpServletRequest request, HttpServletResponse response, BindException errors) throws Exception {
		logger.info("In showForm ConditionsController...");
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		//Récupération de la langue
		String lang = request.getParameter("lang");
		if (lang == null || lang.equals(""))
			lang = "FR";
		model.put("lang", lang);
		
		//TODO : recupere ID
		String contenu = mailService.getConditionsGenerales(lang, "1");
		model.put("contenu", contenu);
		
		return new ModelAndView(this.getFormView(), model);
	}
	
	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}

}
