package fr.the2d2a.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import fr.the2d2a.bean.Commande;
import fr.the2d2a.web.constants.WebConstants;

public class MonPanierLivraisonController extends SimpleFormController {
	
	private static Logger logger = Logger.getLogger(MonPanierLivraisonController.class);
	
	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		
		logger.debug("In onSubmit de MonPanierLivraisonController");
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		Commande maCommande = (Commande)command;
		
		if (maCommande.getAction() == 1) {
			//Annuler panier
			request.getSession().removeAttribute(WebConstants.MON_PANIER);
			return new ModelAndView(new RedirectView("./accueil.htm"));			
		}

		request.getSession().setAttribute(WebConstants.MA_COMMANDE, maCommande);
		model.put("maCommande", maCommande);
		
		return new ModelAndView(new RedirectView(this.getSuccessView()), model);
	}
	
	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		logger.debug("In formBackingObject");
		return new Commande();
	}
}
