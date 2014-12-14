package fr.the2d2a_bo.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import fr.the2d2a.bean.Mail;
import fr.the2d2a.service.MailService;
import fr.the2d2a.web.constants.WebConstants;

public class MailController implements Controller {

	protected static Logger logger = Logger.getLogger(MailController.class);
	
	private MailService mailService;
	
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse arg1) throws Exception {
		logger.debug("In showForm MailController...");
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		//Récupération de la langue
		String lang = (String) request.getSession().getAttribute(WebConstants.LANGUE);
		System.out.println("Visu de la lang : " + lang);
		if (lang == null || lang.equals(""))
			lang = "FR";
		
		List<Mail> mails = mailService.getAllMails(lang);
		model.put("listeMails", mails);
		
		return new ModelAndView("mail", model);
	}

	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}	
}
