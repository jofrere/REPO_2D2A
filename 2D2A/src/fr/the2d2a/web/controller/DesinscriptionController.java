package fr.the2d2a.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.springframework.web.servlet.support.WebContentGenerator;
import org.springframework.web.servlet.view.RedirectView;

import fr.the2d2a.bean.Membre;
import fr.the2d2a.service.MembreService;
import fr.the2d2a.web.constants.WebConstants;

public class DesinscriptionController extends WebContentGenerator implements Controller {
	
	private static Logger logger = Logger.getLogger(DesinscriptionController.class);
	
	private MembreService membreService;

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		logger.debug("In handleRequest() desinscritionController");
		
		Membre membre = (Membre) request.getSession().getAttribute(WebConstants.AUTHENTICATED_MEMBER);
		
		membreService.desinscription(String.valueOf(membre.getMemId()));
		
		request.getSession().removeAttribute(WebConstants.AUTHENTICATED_MEMBER);
		request.getSession().removeAttribute(WebConstants.MON_PANIER);
		
		return new ModelAndView(new RedirectView("/" + (String)this.getServletContext().getAttribute(WebConstants.ROOT) + "/accueil.htm"));
	}

	public void setMembreService(MembreService membreService) {
		this.membreService = membreService;
	}
}
