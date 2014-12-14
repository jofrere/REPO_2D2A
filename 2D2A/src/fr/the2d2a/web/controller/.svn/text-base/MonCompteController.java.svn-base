package fr.the2d2a.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.log4j.Logger;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import fr.the2d2a.bean.Mail;
import fr.the2d2a.bean.Membre;
import fr.the2d2a.exception.FonctionalException;
import fr.the2d2a.exception.TechnicalException;
import fr.the2d2a.service.MailService;
import fr.the2d2a.service.MembreService;
import fr.the2d2a.web.constants.ParamConstants;
import fr.the2d2a.web.constants.WebConstants;

public class MonCompteController extends SimpleFormController {
	
	private static Logger logger = Logger.getLogger(MonCompteController.class);
	
	private MembreService membreService;	
	private MailService mailService;
	
	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		
		logger.debug("In onSubmit de MonCompteController");
		
		Membre membre = (Membre)command;
		String lang = (String) ((HttpServletRequest)request).getSession().getAttribute(WebConstants.LANGUE);
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		switch (membre.getAction()) {
			case 0 : //authentification
				logger.debug("Authentification");
				try {
					membre = membreService.authenticateMember(membre.getLogin(), membre.getPassword(), lang);
					
					logger.debug("Visu de l'adresse  :" + ToStringBuilder.reflectionToString(membre.getAdresses()));
					
					request.getSession().setAttribute(WebConstants.AUTHENTICATED_MEMBER, membre);
				} catch (FonctionalException e) {
					model.put("authenticationError", "authenticationError");
				} catch (TechnicalException e) {
					//TODO : gestion 500
					e.printStackTrace();
				}
				break;
			case 1 : //mot de passe oublié
				logger.debug("Mot de passe oublié");
				Mail mail = mailService.getMail(ParamConstants.MAIL_PASSWORD_ID, lang);
				try {
					membre = membreService.getMembreByLogin(lang, membre.getLogin());
					this.manageMail(mail, membre);
					mailService.sendMail(membre.getLogin(), mail);
					logger.info("Mail mot de passe oublié envoyé");					
					model.put("motDePasseSend", "motDePasseSend");
					model.put("loginmotdepasse", membre.getLogin());
					membre.setPassword("");
					return new ModelAndView("successMotDePasse", model);
				} catch (FonctionalException e) {			
					model.put("authenticationError", "authenticationError");
					membre.setPassword("");
				} catch (TechnicalException e) {
					model.put("motDePasseSend", "motDePasseSend");
					membre.setPassword("");
					//TODO : gestion 500
					e.printStackTrace();
					model.put("loginmotdepasse", membre.getLogin());
					return new ModelAndView("successMotDePasse", model);
				}
		}
		
		model.put("membre", membre);
		
		return new ModelAndView(this.getSuccessView(), model);
	}
	
	public ModelAndView showForm(HttpServletRequest request, HttpServletResponse response, BindException errors) throws Exception {
		
		logger.debug("in showForm de MonCompteController");
		
		Membre membre = (Membre) request.getSession().getAttribute(WebConstants.AUTHENTICATED_MEMBER);
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		if (membre == null) {
			membre = new Membre();
			model.put("membre", membre);
			logger.debug("Redirection vers monCompte public");
			return new ModelAndView(this.getFormView(), model);
		} else {
			model.put("membre", membre);
			logger.debug("Redirection vers monCompte privé");
			return new ModelAndView(this.getSuccessView(), model);
		}
	}
	
	private void manageMail(Mail mail, Membre membre) {
		String contenu = mail.getContenu();
		contenu = contenu.replace("$civ", membre.getCivilite().getTitre());
		contenu = contenu.replace("$prenom", membre.getPrenom());
		contenu = contenu.replace("$nom", membre.getNom());
		contenu = contenu.replace("$login", membre.getLogin());
		contenu = contenu.replace("$password", membre.getPassword());		
		mail.setContenu(contenu);
	}

	public void setMembreService(MembreService membreService) {
		this.membreService = membreService;
	}

	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}
}
