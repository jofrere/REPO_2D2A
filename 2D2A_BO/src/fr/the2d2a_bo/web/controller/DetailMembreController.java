package fr.the2d2a_bo.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import fr.the2d2a.bean.Civilite;
import fr.the2d2a.bean.Membre;
import fr.the2d2a.bean.Pays;
import fr.the2d2a.bean.Profession;
import fr.the2d2a.service.MembreService;
import fr.the2d2a.web.constants.WebConstants;

public class DetailMembreController implements Controller {

	protected static Logger logger = Logger
			.getLogger(DetailMembreController.class);

	private MembreService membreService;

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse arg1) throws Exception {
		logger.debug("In showForm DetailMembreController...");

		Map<String, Object> model = new HashMap<String, Object>();
		
		String memId = (String) request.getParameter("memId");
		
		//Récupération de la langue
		String lang = (String) request.getSession().getAttribute(WebConstants.LANGUE);
		
		//gestion des civilites
		List<Civilite> civilites = membreService.getAllCivilite(lang);
		request.setAttribute("listeCivilite", civilites);
		
		//gestion des professions
		List<Profession> professions = membreService.getAllProfession(lang);
		request.setAttribute("listeProfession", professions);
		
		//gestion des pays
		List<Pays> pays = membreService.getAllPays(lang);
		request.setAttribute("listePays", pays);

		Membre membre = membreService.getMembreByIdBO(lang, memId);
		model.put("membre", membre);

		return new ModelAndView("detailMembre", model);
	}

	public void setMembreService(MembreService membreService) {
		this.membreService = membreService;
	}
}
