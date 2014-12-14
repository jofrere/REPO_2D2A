package fr.the2d2a.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.apache.log4j.Logger;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import fr.the2d2a.bean.Adresse;
import fr.the2d2a.bean.Commande;
import fr.the2d2a.bean.Panier;
import fr.the2d2a.service.MembreService;
import fr.the2d2a.web.constants.WebConstants;

public class MonPanierResumeController extends SimpleFormController {

	private static Logger logger = Logger.getLogger(MonPanierResumeController.class);
	private MembreService membreService;
	
	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		
		logger.debug("In onSubmit de MonPanierResumeController");
		
		Map<String, Object> model = new HashMap<String, Object>();

		Commande maCommande = (Commande) request.getSession().getAttribute(WebConstants.MA_COMMANDE);
		maCommande.setAcceptation(1);
		model.put("maCommande", maCommande);
		
		Panier monPanier = (Panier) request.getSession().getAttribute(WebConstants.MON_PANIER);
		model.put("monPanier", monPanier);
		
		return new ModelAndView(new RedirectView(this.getSuccessView()), model);
	}
	
	@Override
	protected ModelAndView showForm(HttpServletRequest request,
			HttpServletResponse response, BindException errors)
			throws Exception {
		
		logger.debug("In showForm de MonPanierResumeController");
		Map<String, Object> model = new HashMap<String, Object>();
		
		if (errors.hasFieldErrors()) {
			model.put("error", "error");
		}

		Commande maCommande = (Commande) request.getSession().getAttribute(WebConstants.MA_COMMANDE);
		Adresse factu = membreService.getAdresseById(String.valueOf(maCommande.getAdrFacId()));
		Adresse livraison = membreService.getAdresseById(String.valueOf(maCommande.getAdrLivId()));
		maCommande.setAdresseFactu(factu);
		maCommande.setAdresseLivraison(livraison);
		model.put("maCommande", maCommande);
		logger.debug("Visu commande : " + ToStringBuilder.reflectionToString(maCommande, ToStringStyle.MULTI_LINE_STYLE));
		
		Panier monPanier = (Panier) request.getSession().getAttribute(WebConstants.MON_PANIER);
		model.put("monPanier", monPanier);
		logger.debug("Visu panier : " + ToStringBuilder.reflectionToString(monPanier, ToStringStyle.MULTI_LINE_STYLE));
		
		return new ModelAndView(this.getFormView(), model);
	}

	public void setMembreService(MembreService membreService) {
		this.membreService = membreService;
	}
}
