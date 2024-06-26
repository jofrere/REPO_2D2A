package fr.the2d2a_bo.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import fr.the2d2a.bean.Mail;
import fr.the2d2a.service.MailService;
import fr.the2d2a.web.constants.WebConstants;

public class ModifMailController extends SimpleFormController {
	
	protected static Logger logger = Logger.getLogger(ModifMailController.class);
	
	private MailService mailService;

	
	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		logger.info("In onSubmit ModifMailController...");
		
		Mail mail = (Mail) command;
		
		if (mail.getAction() == 0) {
			request.setAttribute("mail", mail);
			return this.showForm(request, response, errors);
		}
		
		logger.debug("Modification du mail");
		mailService.updateMailById(mail, (String)request.getSession().getAttribute(WebConstants.LANGUE));
		
		return new ModelAndView(new RedirectView(this.getSuccessView()));
	}
	
	@Override
	protected ModelAndView showForm(HttpServletRequest request, HttpServletResponse response, BindException errors) throws Exception {
		logger.info("In showForm ModifMailController...");
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		Mail mail = (Mail) request.getAttribute("mail");
		
		String lang = (String) request.getSession().getAttribute(WebConstants.LANGUE);
		System.out.println("lang : " + lang);
		mail = mailService.getMail(mail.getMaiId(), lang);
		mail.setLang(lang);
		
		model.put("mail", mail);
		
		return new ModelAndView(this.getFormView(), model);
	}
	
	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}
}
