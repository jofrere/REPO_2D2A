package fr.the2d2a.web.controller;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.log4j.Logger;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import fr.the2d2a.bean.Civilite;
import fr.the2d2a.bean.Mail;
import fr.the2d2a.bean.Membre;
import fr.the2d2a.bean.Pays;
import fr.the2d2a.bean.Profession;
import fr.the2d2a.exception.FonctionalException;
import fr.the2d2a.exception.TechnicalException;
import fr.the2d2a.service.MailService;
import fr.the2d2a.service.MembreService;
import fr.the2d2a.web.constants.ParamConstants;
import fr.the2d2a.web.constants.WebConstants;

public class InscriptionController extends SimpleFormController {
	
	private static Logger logger = Logger.getLogger(InscriptionController.class);

	private MembreService membreService;
	private MailService mailService;
    
		
	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		
		logger.debug("In onSubmit de InscriptionController");
		
		Membre membre = (Membre)command;

		logger.info("Inscription d'un membre : " + ToStringBuilder.reflectionToString(membre));
		try {
			
			membre.setDateInscription(new BigInteger(Long.toString(System.currentTimeMillis())));
			membreService.insertMembre(membre);
			
			String lang = (String)request.getSession().getAttribute(WebConstants.LANGUE);
			
			Civilite civ = membreService.getCiviliteByMembreId(lang, String.valueOf(membre.getMemId()));
			membre.setCivilite(civ);
			
			Mail mail = mailService.getMail(ParamConstants.MAIL_INSCRIPTION_ID, lang);
			this.manageMail(mail, membre, lang);
			mailService.sendMail(membre.getLogin(), mail);
			
		} catch (FonctionalException e) {
			logger.info("FonctionalException : Duplicate Entry");
			errors.rejectValue("login", "inscription.error.duplicateEntry", null, null);
			return super.showForm(request, response, errors);
		} catch (TechnicalException e) {
			logger.error("TechnicalException : " + e.getMessage());
			//TODO : gérer Exception
		} 
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("membre", membre);
		
		return new ModelAndView(this.getSuccessView(), model);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		
		logger.debug("In referenceData");
		
		String lang = (String)request.getSession().getAttribute(WebConstants.LANGUE); 
		
		//gestion des civilites
		List<Civilite> civilites = membreService.getAllCivilite(lang);
		request.setAttribute("listeCivilite", civilites);
		logger.debug("Visu des civilites : " + civilites.toString());
		
		//gestion des professions
		List<Profession> professions = membreService.getAllProfession(lang);
		request.setAttribute("listeProfession", professions);
		
		//gestion des pays
		List<Pays> pays = membreService.getAllPays(lang);
		request.setAttribute("listePays", pays);
		
		return super.referenceData(request);
	}
	
	@Override
	protected void onBindAndValidate(HttpServletRequest request,
			Object command, BindException errors) throws Exception {
		Membre membre = (Membre) command;
		if (!membre.getCaptcha().equals(request.getSession().getAttribute("SIMPLE_CAPCHA_SESSION_KEY"))) {
			logger.debug("Captcha : " + request.getSession().getAttribute("SIMPLE_CAPCHA_SESSION_KEY"));
			errors.rejectValue("captcha", "inscription.error.captcha.invalid", null, null);
		}
		super.onBindAndValidate(request, command, errors);
	}
	
	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		logger.debug("In formBackingObject");
		return new Membre();
	}
	
	private void manageMail(Mail mail, Membre membre, String lang) {
		String contenu = mail.getContenu();
		contenu = contenu.replace("$civ", membre.getCivilite().getTitre());
		contenu = contenu.replace("$prenom", membre.getPrenom());
		contenu = contenu.replace("$nom", membre.getNom());
		contenu = contenu.replace("$lang", lang);
		contenu = contenu.replace("$id", String.valueOf(membre.getMemId()));
		contenu = contenu.replace("$dateinscription", String.valueOf(membre.getDateInscription()));
		mail.setContenu(contenu);
	}
	
	public void setMembreService(MembreService membreService) {
		this.membreService = membreService;
	}

	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}
}
