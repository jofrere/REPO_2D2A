package fr.the2d2a.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.validator.EmailValidator;
import org.apache.log4j.Logger;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import fr.the2d2a.bean.Mail;
import fr.the2d2a.bean.Membre;
import fr.the2d2a.beanform.InviterAmiForm;
import fr.the2d2a.service.MailService;
import fr.the2d2a.web.constants.ParamConstants;
import fr.the2d2a.web.constants.WebConstants;

public class InviterAmiController extends SimpleFormController {
	
	private static Logger logger = Logger.getLogger(InviterAmiController.class);

	private MailService mailService;
	
	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		
		logger.debug("In onSubmit de InviterAmiController");
		
		Membre membre = (Membre) request.getSession().getAttribute(WebConstants.AUTHENTICATED_MEMBER);
		if (membre == null) {
			errors.rejectValue("email", "inviter.membre.null", null, null);
			return super.showForm(request, response, errors);
		}
		
		InviterAmiForm ami = (InviterAmiForm) command;
		if (StringUtils.isEmpty(ami.getEmail()) || StringUtils.isBlank(ami.getEmail()) || !EmailValidator.getInstance().isValid(ami.getEmail())) {
			errors.rejectValue("email", "inviter.ami.invalid", null, null);
			return super.showForm(request, response, errors);
		}
		
		
		logger.debug("Visu de l'ami : " + ami.getEmail());
		logger.debug("Visu du message : " + ami.getMessage());
		
		String lang = (String)request.getSession().getAttribute(WebConstants.LANGUE);
		
		Mail mail = mailService.getMail(ParamConstants.MAIL_INVITER_AMI_ID, lang);
		this.manageMail(mail, membre, ami);
		
		mailService.sendMail(ami.getEmail(), mail);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("confirmation", "Votre ami viens de recevoir l'invitation par e-mail à l'adresse suivante : " + ami.getEmail());
		model.put("ami", ami);
		
		return new ModelAndView(this.getSuccessView(), model);
	}
	
	private void manageMail(Mail mail, Membre membre, InviterAmiForm ami) {
		String contenu = mail.getContenu();
		contenu = contenu.replace("$prenom", membre.getPrenom());
		contenu = contenu.replace("$nom", membre.getNom());
		contenu = contenu.replace("$message", ami.getMessage());
		mail.setContenu(contenu);
	}

	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}

}
