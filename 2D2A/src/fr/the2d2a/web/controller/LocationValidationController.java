package fr.the2d2a.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.log4j.Logger;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import fr.the2d2a.bean.Civilite;
import fr.the2d2a.bean.Location;
import fr.the2d2a.bean.Mail;
import fr.the2d2a.bean.Panier;
import fr.the2d2a.bean.Pays;
import fr.the2d2a.bean.Produit;
import fr.the2d2a.exception.TechnicalException;
import fr.the2d2a.service.MailService;
import fr.the2d2a.service.MembreService;
import fr.the2d2a.web.constants.ParamConstants;
import fr.the2d2a.web.constants.WebConstants;

public class LocationValidationController extends SimpleFormController {

	private static Logger logger = Logger.getLogger(LocationValidationController.class);

	private MailService mailService;
	
	private MembreService membreService;
	
	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		
		logger.debug("In onSubmit de LocationValidationController");
		Location maLocation = (Location)command;
		
		logger.info("Visu demande de location : " + ToStringBuilder.reflectionToString(maLocation));
			
		String lang = (String)request.getSession().getAttribute(WebConstants.LANGUE);
		
		Panier monPanierLocation = (Panier) request.getSession().getAttribute(WebConstants.MON_PANIER_LOCATION);
	
		if (maLocation.getCivId() != 0) {
			List<Civilite> civilites = membreService.getAllCivilite(lang);
			for (Civilite civ : civilites) {
				if (String.valueOf(civ.getCivId()).equals(maLocation.getCivId())) {
					maLocation.setCivilite(civ);
				}
			}
		}
		
		if (maLocation.getPayId() != null && !StringUtils.isEmpty(maLocation.getPayId())) {
			List<Pays> pays = membreService.getAllPays(lang);
			for (Pays p : pays) {
				if (String.valueOf(p.getPayId()).equals(maLocation.getPayId())) {
					maLocation.setPays(p);
				}
			}
		}
		
		try {
			Mail mail = mailService.getMail(ParamConstants.MAIL_LOCATION, lang);
			this.manageMail(mail, maLocation, lang, monPanierLocation);
			mailService.sendMailToAdmin(mail);
			
		} catch (TechnicalException e) {
			e.printStackTrace();
			//TODO : enlever ce catch et gérer les technicals dans les pages (error 500 custo)
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("location", maLocation);
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
		
		//gestion des pays
		List<Pays> pays = membreService.getAllPays(lang);
		request.setAttribute("listePays", pays);
		
		return super.referenceData(request);
	}
	
	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		logger.debug("In formBackingObject");
		return new Location();
	}
	
	private void manageMail(Mail mail, Location maLocation, String lang, Panier monPanierLocation) {
		String contenu = mail.getContenu();
		if (maLocation.getCivilite() == null) {
			contenu = contenu.replace("$civ", "");
		} else {
			contenu = contenu.replace("$civ", maLocation.getCivilite().getTitre());
		}
		contenu = contenu.replace("$prenom", maLocation.getPrenom());
		contenu = contenu.replace("$nom", maLocation.getNom());
		if (StringUtils.isBlank(maLocation.getTypePersonneStr())) {
			maLocation.setTypePersonneStr("");
		}
		contenu = contenu.replace("$typePersonne", maLocation.getTypePersonneStr());
		contenu = contenu.replace("$adresse", maLocation.getAdresse());
		contenu = contenu.replace("$complAdresse", maLocation.getComplementAdresse());
		contenu = contenu.replace("$ville", maLocation.getVille());
		contenu = contenu.replace("$codePostal", maLocation.getCodePostal());
		if (maLocation.getPays() == null) {
			contenu = contenu.replace("$pays", "");
		} else {
			contenu = contenu.replace("$pays", maLocation.getPays().getNom());
		}
		contenu = contenu.replace("$email", maLocation.getEmail());
		contenu = contenu.replace("$question", maLocation.getQuestion());
		
		StringBuffer monPanierLocationStr = new StringBuffer();
		int i = 0;
		for (Produit produit : monPanierLocation.getMesProduits()) {
			monPanierLocationStr.append(++i).append(". ").append(produit.getReference()).append(" - ").append(produit.getNom()).append(" - ").append(produit.getQuantiteReservee()).append("\n");
		}
		
		contenu = contenu.replace("$panierLocation", monPanierLocationStr);
		
		mail.setContenu(contenu);
	}

	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}

	public void setMembreService(MembreService membreService) {
		this.membreService = membreService;
	}
}
