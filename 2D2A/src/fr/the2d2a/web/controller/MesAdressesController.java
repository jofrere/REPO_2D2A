package fr.the2d2a.web.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import fr.the2d2a.bean.Adresse;
import fr.the2d2a.bean.Civilite;
import fr.the2d2a.bean.Membre;
import fr.the2d2a.bean.Pays;
import fr.the2d2a.service.MembreService;
import fr.the2d2a.web.constants.WebConstants;

public class MesAdressesController extends SimpleFormController {

	private static Logger logger = Logger.getLogger(MesAdressesController.class);
	
	private MembreService membreService;
	
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {
		logger.debug("In onSubmit de MesAdressesController");
		
		Adresse adresse = (Adresse) command;
		
		Membre membre = (Membre)request.getSession().getAttribute(WebConstants.AUTHENTICATED_MEMBER);
		adresse.setMemId(membre.getMemId());
		
		switch (adresse.getAction()) {
			case 0 :
				logger.debug("Add adresse");
				membreService.insertAdresse(adresse);
				membre.getAdresses().add(adresse);
				break;
			case 1 :
				logger.debug("update adresse");
				membreService.updateAdresse(adresse);
				int index = 0, i = 0;
				for (Adresse adr : membre.getAdresses()) {
					if (adr.getAdrId() == adresse.getAdrId()) {
						index = i;
					}
					i++;
				}
				membre.getAdresses().remove(index);
				membre.getAdresses().add(index, adresse);
				break;			
		}
				
		//on clean la session
		request.getSession().removeAttribute(WebConstants.AUTHENTICATED_MEMBER);
		request.getSession().setAttribute(WebConstants.AUTHENTICATED_MEMBER, membre);
		
		return new ModelAndView(new RedirectView(this.getSuccessView()));
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
		
		Membre membre = (Membre) request.getSession().getAttribute(WebConstants.AUTHENTICATED_MEMBER);
		request.setAttribute("membre", membre);
		
		return super.referenceData(request);
	}
	
	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		logger.debug("In formBackingObject");
		Adresse adresse = null;
		String idAdresse = (String) request.getSession().getAttribute("idAdresse");
		if (idAdresse == null) {
			adresse = new Adresse();
			adresse.setAction(0);
		}
		else {
			request.getSession().removeAttribute("idAdresse");
			adresse = membreService.getAdresseById(idAdresse);
			adresse.setAction(1);
		}
		return adresse;
	}
	
	public void setMembreService(MembreService membreService) {
		this.membreService = membreService;
	}
}
