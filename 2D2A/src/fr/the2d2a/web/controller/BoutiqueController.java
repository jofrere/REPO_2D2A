package fr.the2d2a.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import fr.the2d2a.bean.Produit;
import fr.the2d2a.bean.Rubrique;
import fr.the2d2a.exception.FonctionalException;
import fr.the2d2a.exception.TechnicalException;
import fr.the2d2a.service.ProduitService;
import fr.the2d2a.web.constants.ParamConstants;
import fr.the2d2a.web.constants.WebConstants;

public class BoutiqueController implements Controller {
	
	private static Logger logger = Logger.getLogger(BoutiqueController.class);
	
	private ProduitService produitService;
	private String successView;

	public void setProduitService(ProduitService produitService) {
		this.produitService = produitService;
	}

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response)
			throws Exception {
		
		logger.info("BoutiqueController starts...");
		
		Rubrique rubrique = (Rubrique)request.getAttribute("rubrique");
		logger.debug("Visu rubrique " + rubrique.toString());
		int pageIndex = 0;
		String index = request.getParameter("pageIndex");
		if (index != null) {
			pageIndex = Integer.parseInt(index);
		}
		
		Map<String, Object> model = getModel(request, rubrique, pageIndex);
		
		return new ModelAndView(this.getSuccessView(), model);
	}
	
	private Map<String, Object> getModel(HttpServletRequest request, Rubrique rubrique, int pageIndex) {
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		String lang = (String)request.getSession().getAttribute(WebConstants.LANGUE);
		model.put("rubrique", rubrique);
		
		//Recupérer les produits
		try {
			List<Produit> produits = produitService.getProduitByRubriqueId(lang, String.valueOf(rubrique.getRubId()));
			for (Produit produit : produits) {
				produit.setRubId(String.valueOf(rubrique.getRubId()));
			}
			logger.debug("Liste de produits : " + produits.toString());
			model.put("nbProduits", produits.size());
		
			//traitement Pager
			if (produits.size() > ParamConstants.MAX_PRODUCT_BY_PAGE) {
				model.put("pager", "pager");
				int nbPages = produits.size()/ParamConstants.MAX_PRODUCT_BY_PAGE;
				if (produits.size()%ParamConstants.MAX_PRODUCT_BY_PAGE > 0)
					nbPages++;
				model.put("nbPages", nbPages);
				logger.debug("Visu nbPages : " + nbPages);
				model.put("pageIndex", pageIndex);
				model.put("currentPage", pageIndex+1);
				model.put("produits", produits.subList(pageIndex*ParamConstants.MAX_PRODUCT_BY_PAGE, Math.min(pageIndex*ParamConstants.MAX_PRODUCT_BY_PAGE+ParamConstants.MAX_PRODUCT_BY_PAGE, produits.size())));
			} else {
				model.put("produits", produits);
			}
		}
		catch(TechnicalException e) {
			logger.error("TechnicalException : " + e.getMessage());
			model.put(WebConstants.TECHNICAL, WebConstants.TECHNICAL);
		}
		catch(FonctionalException e) {
			logger.error("FonctionalException : " + e.getMessage());
			model.put(WebConstants.FONCTIONAL, WebConstants.FONCTIONAL);
		}
		
		request.setAttribute(WebConstants.LANGUE, ((HttpServletRequest)request).getSession().getAttribute(WebConstants.LANGUE));
		
		return model;
	}

	public String getSuccessView() {
		return successView;
	}

	public void setSuccessView(String successView) {
		this.successView = successView;
	}
}
