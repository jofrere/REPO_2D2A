package fr.the2d2a_bo.web.controller;

import java.text.NumberFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import fr.the2d2a.bean.Produit;
import fr.the2d2a.bean.Rubrique;
import fr.the2d2a.service.ProduitService;
import fr.the2d2a.service.RubriqueService;
import fr.the2d2a.web.constants.WebConstants;
import fr.the2d2a_bo.beanform.FilterProduitForm;

public class ProduitController extends SimpleFormController {

	protected static Logger logger = Logger.getLogger(ProduitController.class);
	private static NumberFormat nbFormat = NumberFormat.getIntegerInstance();
	
	private ProduitService produitService;
	private RubriqueService rubriqueService;
	
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {
		logger.debug("In onSubmit ProduitController...");
		
		this.referenceData(request);
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		FilterProduitForm filter = (FilterProduitForm) command; 
		
		//gestion des filtres
		logger.debug("Visu de achatDepot : " + filter.getAchatDepot());
		logger.debug("Visu de visuLang : " + filter.getVisuLang());
		logger.debug("Visu de rubrique : " + filter.getRubrique());
		logger.debug("Visu de la référene : " + filter.getReference());
		
		List<Produit> produits = produitService.getAllProduitWithFilter(getLang(request), filter);
		model.put("listeProduit", produits);
		
		model.put("filter", filter);
		this.calculateStock(produits, model);
		
		return new ModelAndView(this.getSuccessView(), model);
	}
	
	protected ModelAndView showForm(HttpServletRequest request, HttpServletResponse response, BindException errors) throws Exception {
		logger.debug("In showForm ProduitController...");
		
		this.referenceData(request);
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		List<Produit> produits = produitService.getAllProduit(getLang(request));
		model.put("listeProduit", produits);
		model.put("filter", new FilterProduitForm());
		this.calculateStock(produits, model);
		
		return new ModelAndView(this.getFormView(), model);
	}
	
	private void calculateStock(List<Produit> produits, Map<String, Object> model) {
		int qtte = 0;
		float prixAchat = 0;
		float prix = 0;
		for (Produit prod : produits) {
			qtte += prod.getQuantite();
			prixAchat += (prod.getPrixAchat()*qtte);
			prix += (prod.getPrix()*qtte);
		}
		float benef = prix - prixAchat;
		model.put("qtte", qtte);
		model.put("prixAchat", getFormate(prixAchat));
		model.put("prix", getFormate(prix));
		model.put("benef", getFormate(benef));
	}
	
	@SuppressWarnings("unchecked")
	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		
		logger.debug("In referenceData de ProduitController");
				
		//gestion liste de rubrique
		List<Rubrique> rubriques = rubriqueService.getRubriquesListWithInvisible(getLang(request), -1);
		request.setAttribute("listeRubrique", rubriques);
				
		return super.referenceData(request);
	}
	
	public void setProduitService(ProduitService produitService) {
		this.produitService = produitService;
	}
	
	public void setRubriqueService(RubriqueService rubriqueService) {
		this.rubriqueService = rubriqueService;
	}
	
	private String getLang(HttpServletRequest request) {
		return (String)request.getSession().getAttribute(WebConstants.LANGUE);
	}
	
	private String getFormate(float p) {
		nbFormat.setMaximumFractionDigits(2);
		nbFormat.setMinimumFractionDigits(2);
		return nbFormat.format(p);
	}
}
