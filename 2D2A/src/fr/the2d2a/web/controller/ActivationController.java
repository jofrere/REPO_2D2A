package fr.the2d2a.web.controller;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import fr.the2d2a.bean.Mail;
import fr.the2d2a.bean.Membre;
import fr.the2d2a.exception.TechnicalException;
import fr.the2d2a.service.MailService;
import fr.the2d2a.service.MembreService;
import fr.the2d2a.web.constants.ParamConstants;
import fr.the2d2a.web.constants.WebConstants;

public class ActivationController implements Controller {
	
	private static Logger logger = Logger.getLogger(ActivationController.class);

	private MembreService membreService;
	private MailService mailService;

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		logger.debug("In activationController");
		
		// URL de test : http://localhost/2D2A/activation.htm?lg=FR&id=2&dateinscription=1254645289593
		String id = request.getParameter("id");
		String dateInscription = request.getParameter("dateinscription");
		String lang = (String) ((HttpServletRequest)request).getSession().getAttribute(WebConstants.LANGUE);
		
		logger.debug("Visu des params : id = " + id + ", date : " + dateInscription);
		
		membreService.activateMember(id, new BigInteger(dateInscription));
		
		Membre membre = membreService.getMembreById(lang, id);
		
		Mail mail = mailService.getMail(ParamConstants.MAIL_BIENVENUE_ID, lang);
		this.manageMail(mail, membre);
		try {
			mailService.sendMail(membre.getLogin(), mail);
		} catch(TechnicalException e) {
			//TODO
			e.printStackTrace();
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("membre", membre);
		
		return new ModelAndView("activation", model);
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
