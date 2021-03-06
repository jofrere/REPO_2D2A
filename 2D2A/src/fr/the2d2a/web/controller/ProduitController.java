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

import fr.the2d2a.bean.Coloris;
import fr.the2d2a.bean.Panier;
import fr.the2d2a.bean.Produit;
import fr.the2d2a.bean.Rubrique;
import fr.the2d2a.service.ProduitService;
import fr.the2d2a.service.RubriqueService;
import fr.the2d2a.web.constants.ParamConstants;
import fr.the2d2a.web.constants.WebConstants;

public class ProduitController extends SimpleFormController {

	private static Logger logger = Logger.getLogger(ProduitController.class);

	private ProduitService produitService;
	private RubriqueService rubriqueService;
	
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {
		
		logger.info("In onSubmit ProduitController...");
		Rubrique currentRubrique = (Rubrique)request.getAttribute("rubrique");

		String lang = (String)request.getSession().getAttribute(WebConstants.LANGUE); 
		
		logger.debug("Visu rubrique dans HomeProduitController : " + ToStringBuilder.reflectionToString(currentRubrique));
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("rubrique", currentRubrique);
		
		request.setAttribute(WebConstants.LANGUE, ((HttpServletRequest)request).getSession().getAttribute(WebConstants.LANGUE));
		
		//debut traitement
		String friendlyName = request.getParameter("produitFriendlyName");
		Produit produit = produitService.getProduitByFriendlyName(lang, friendlyName);
		model.put("produit", produit);
		
		String idColoris = request.getParameter("idColoris");
		logger.debug("Visu du coloris : " + idColoris);

		if (idColoris == null || StringUtils.isBlank(idColoris)) {
			if (produit.getColoris() != null && !produit.getColoris().isEmpty()) {
				produit.setColId(String.valueOf(((Coloris)produit.getColoris().get(0)).getColId()));
			}
		} else {
			produit.setColId(idColoris);
		}
		
		//gestion ajout au panier
		String action = request.getParameter("action");
		if (action != null && action.equals("1")) {
			logger.debug("Ajout panier");
			Panier monPanier = (Panier)((HttpServletRequest)request).getSession().getAttribute(WebConstants.MON_PANIER);
			monPanier = this.modifyPanier(monPanier, produit);
			request.getSession().setAttribute(WebConstants.MON_PANIER, monPanier);
		} else if (action != null && action.equals("2")) {
			logger.debug("Ajout location");
			Panier monPanierLocation = (Panier)((HttpServletRequest)request).getSession().getAttribute(WebConstants.MON_PANIER_LOCATION);
			monPanierLocation = this.modifyPanier(monPanierLocation, produit);
			request.getSession().setAttribute(WebConstants.MON_PANIER_LOCATION, monPanierLocation);
		} 
		
		//recuperation produits associ�s
		List<Produit> produitAssociated = produitService.getProduitAssociatedById(lang, String.valueOf(produit.getProId()));
		for (Produit prod : produitAssociated) {
			List<Rubrique> rubriques = rubriqueService.getRubriquesByProduitId(lang, prod.getProId());
			if (rubriques != null) {
				prod.setRubId(String.valueOf(rubriques.get(0).getRubId()));
			}
		}
		model.put("produitAssociated", produitAssociated);
		model.put("nbProduit", produitAssociated.size());
		
		//traitement Pager
		int pageIndex = 0;
		String index = request.getParameter("pageIndex");
		if (index != null) {
			pageIndex = Integer.parseInt(index);
		}
		if (produitAssociated.size() > ParamConstants.MAX_PRODUCT_ASSOC_BY_PAGE) {
			model.put("pager", "pager");
			int nbPages = produitAssociated.size()/ParamConstants.MAX_PRODUCT_ASSOC_BY_PAGE;
			if (produitAssociated.size()%ParamConstants.MAX_PRODUCT_ASSOC_BY_PAGE > 0)
				nbPages++;
			model.put("nbPages", nbPages);
			logger.debug("Visu nbPages : " + nbPages);
			model.put("pageIndex", pageIndex);
			model.put("currentPage", pageIndex+1);
			model.put("produitAssociated", produitAssociated.subList(pageIndex*ParamConstants.MAX_PRODUCT_ASSOC_BY_PAGE, Math.min(pageIndex*ParamConstants.MAX_PRODUCT_ASSOC_BY_PAGE+ParamConstants.MAX_PRODUCT_ASSOC_BY_PAGE, produitAssociated.size())));
		} else {
			model.put("produitAssociated", produitAssociated);
		}
		
		return new ModelAndView(this.getSuccessView(), model);
	}
	
	protected ModelAndView showForm(HttpServletRequest request,
			HttpServletResponse response, BindException errors)
			throws Exception {
		
		logger.info("In showForm ProduitController...");
		Rubrique currentRubrique = (Rubrique)request.getAttribute("rubrique");

		String lang = (String)request.getSession().getAttribute(WebConstants.LANGUE); 
		
		logger.debug("Visu rubrique dans HomeProduitController : " + ToStringBuilder.reflectionToString(currentRubrique));
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("rubrique", currentRubrique);
		
		request.setAttribute(WebConstants.LANGUE, ((HttpServletRequest)request).getSession().getAttribute(WebConstants.LANGUE));
		
		//debut traitement
		String friendlyName = request.getParameter("produitFriendlyName");
		logger.debug("Visu du friendlt name du produit : " + friendlyName);
		Produit prod = produitService.getProduitByFriendlyName(lang, friendlyName);
		prod.setPrix(prod.getPrix());
		model.put("produit", prod);
		
		//recuperation produits associ�s
		List<Produit> produitAssociated = produitService.getProduitAssociatedById(lang, String.valueOf(prod.getProId()));
		for (Produit produit : produitAssociated) {
			List<Rubrique> rubriques = rubriqueService.getRubriquesByProduitId(lang, produit.getProId());
			if (rubriques != null) {
				produit.setRubId(String.valueOf(rubriques.get(0).getRubId()));
			}
		}
		model.put("produitAssociated", produitAssociated);
		model.put("nbProduit", produitAssociated.size());
		
		//traitement Pager
		int pageIndex = 0;
		String index = request.getParameter("pageIndex");
		if (index != null) {
			pageIndex = Integer.parseInt(index);
		}
		if (produitAssociated.size() > ParamConstants.MAX_PRODUCT_ASSOC_BY_PAGE) {
			model.put("pager", "pager");
			int nbPages = produitAssociated.size()/ParamConstants.MAX_PRODUCT_ASSOC_BY_PAGE;
			if (produitAssociated.size()%ParamConstants.MAX_PRODUCT_ASSOC_BY_PAGE > 0)
				nbPages++;
			model.put("nbPages", nbPages);
			logger.debug("Visu nbPages : " + nbPages);
			model.put("pageIndex", pageIndex);
			model.put("currentPage", pageIndex+1);
			model.put("produitAssociated", produitAssociated.subList(pageIndex*ParamConstants.MAX_PRODUCT_ASSOC_BY_PAGE, Math.min(pageIndex*ParamConstants.MAX_PRODUCT_ASSOC_BY_PAGE+ParamConstants.MAX_PRODUCT_ASSOC_BY_PAGE, produitAssociated.size())));
		} else {
			model.put("produitAssociated", produitAssociated);
		}
		
		//Gestion des commentaires
		if (request.getSession().getAttribute("commentaireSent") != null) {
			model.put("commentaireSent", "commentaireSent");
			request.getSession().removeAttribute("commentaireSent");
		}
		
		return new ModelAndView(this.getSuccessView(), model);
	}
	
	private Panier modifyPanier(Panier monPanier, Produit produit) {
		if (monPanier == null) {
			monPanier = new Panier();
		}
		boolean trouve = false;
		for (Produit prod : monPanier.getMesProduits()) {
			if (produit.getProId() == prod.getProId() && produit.getColId().equals(prod.getColId())) {
				trouve = true;
				prod.setQuantiteReservee(prod.getQuantiteReservee() + 1);
			}
		}
		if (!trouve) {
			produit.setQuantiteReservee(1);
			monPanier.getMesProduits().add(produit);
		}
		return monPanier;
	}

	public void setProduitService(ProduitService produitService) {
		this.produitService = produitService;
	}

	public void setRubriqueService(RubriqueService rubriqueService) {
		this.rubriqueService = rubriqueService;
	}
}
