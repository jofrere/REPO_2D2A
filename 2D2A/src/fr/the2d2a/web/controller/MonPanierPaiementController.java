package fr.the2d2a.web.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.log4j.Logger;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import fr.the2d2a.bean.Banque;
import fr.the2d2a.bean.Commande;
import fr.the2d2a.bean.Membre;
import fr.the2d2a.bean.Panier;
import fr.the2d2a.service.CommandeService;
import fr.the2d2a.service.OuvrageService;
import fr.the2d2a.service.ProduitService;
import fr.the2d2a.web.constants.WebConstants;

public class MonPanierPaiementController extends SimpleFormController {
	
	private static Logger logger = Logger.getLogger(MonPanierPaiementController.class);
	
	private CommandeService commandeService;
	private ProduitService produitService;
	private OuvrageService ouvrageService;
	
	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		
		logger.debug("In onSubmit de MonPanierPaiementController");
		
		//TODO : verif coord bancaire via validator
		
		//TODO : envoie paiement banque
		
		//insertion commande
		Panier monPanier = (Panier)request.getSession().getAttribute(WebConstants.MON_PANIER);
		Commande maCommande = (Commande)request.getSession().getAttribute(WebConstants.MA_COMMANDE);
		Membre membre = (Membre) request.getSession().getAttribute(WebConstants.AUTHENTICATED_MEMBER);
		logger.debug("Visu panier : " + ToStringBuilder.reflectionToString(monPanier));
		logger.debug("Visu membre : " + ToStringBuilder.reflectionToString(membre));
		maCommande.setMonPanier(monPanier);
		maCommande.setMembreId(membre.getMemId());
		maCommande.setDate(new Date(System.currentTimeMillis()));
		maCommande.setPrix(monPanier.getPrix());
		logger.debug("Visu commande : " + ToStringBuilder.reflectionToString(maCommande));
		int result = commandeService.insertCommande(maCommande);
		logger.debug("Visu du result : " + result);
		
		//destockage produit
		produitService.destockProduit(maCommande);
		ouvrageService.destockOuvrage(maCommande);
		
		//TODO : envoie du mail
		
		request.getSession().removeAttribute(WebConstants.MON_PANIER);
		
		return new ModelAndView(this.getSuccessView());
	}
	
	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		logger.debug("In formBackingObject");
		return new Banque();
	}

	public void setCommandeService(CommandeService commandeService) {
		this.commandeService = commandeService;
	}

	public void setProduitService(ProduitService produitService) {
		this.produitService = produitService;
	}

	public void setOuvrageService(OuvrageService presseService) {
		this.ouvrageService = presseService;
	}
}
