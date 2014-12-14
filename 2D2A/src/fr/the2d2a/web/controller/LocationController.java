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

import fr.the2d2a.bean.Coloris;
import fr.the2d2a.bean.Ouvrage;
import fr.the2d2a.bean.Panier;
import fr.the2d2a.bean.Produit;
import fr.the2d2a.service.ProduitService;
import fr.the2d2a.web.constants.WebConstants;

public class LocationController extends SimpleFormController {

	private static Logger logger = Logger.getLogger(LocationController.class);
	
	private ProduitService produitService;
	
	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		
		logger.debug("In onSubmit de LocationController");
		String lang = (String) ((HttpServletRequest)request).getSession().getAttribute(WebConstants.LANGUE);
		Map<String, Object> model = new HashMap<String, Object>();
		
		Panier monPanierLocation = (Panier)((HttpServletRequest)request).getSession().getAttribute(WebConstants.MON_PANIER_LOCATION);
		if (monPanierLocation == null) {
			monPanierLocation = new Panier();
		}
		
		if (request.getParameter("action") == null) {
			return this.showForm(request, response, errors);
		}
		int action = Integer.parseInt(request.getParameter("action"));
		
		//MAJ quantite reservee
		if (action != 1) {
			for (int j = 0; j < monPanierLocation.getMesProduits().size(); j++) {
				logger.debug("Visu du j : " + j);
				String q = request.getParameter("quantiteReservee["+j+"]");
				monPanierLocation.getMesProduits().get(j).setQuantiteReservee(Integer.parseInt(q));
			}
			for (int j = 0; j < monPanierLocation.getMesOuvrages().size(); j++) {
				String q = request.getParameter("quantiteReserveeOuvrage["+j+"]");
				monPanierLocation.getMesOuvrages().get(j).setQuantiteReservee(Integer.parseInt(q));
			}
		}
		
		String idProduit = null;
		String idOuvrage = null;
		Produit produit = null;
		
		String idColoris = request.getParameter("idColoris");
		logger.debug("Visu du coloris : " + idColoris);
		
		
		switch (action) {
			case 1 :
				//case of add a product
				idProduit = request.getParameter("idProduit");
				produit = produitService.getProduitById(lang, idProduit);
				if (idColoris == null) {
					if (produit.getColoris() != null && !produit.getColoris().isEmpty()) {
						produit.setColId(String.valueOf(((Coloris)produit.getColoris().get(0)).getColId()));
					}
				} else {
					produit.setColId(idColoris);
				}
				boolean trouve = false;
				for (Produit prod : monPanierLocation.getMesProduits()) {
					if (produit.getProId() == prod.getProId() && produit.getColId().equals(prod.getColId())) {
						trouve = true;
						prod.setQuantiteReservee(prod.getQuantiteReservee() + 1);
					}
				}
				if (!trouve) {
					produit.setQuantiteReservee(1);
					monPanierLocation.getMesProduits().add(produit);
				}
				break;
			case 2 : 
				
				int index = -1, i = 0;
				
				idProduit = request.getParameter("idProduit");
				if (idProduit != null && !idProduit.equals("")) {
					//case of delete a product
					for (Produit current : monPanierLocation.getMesProduits()) {
						if (current.getProId() == Integer.parseInt(idProduit) && current.getColId().equals(idColoris)) {
							index = i;
							break;
						}
						i++;
					}
					monPanierLocation.getMesProduits().remove(index);
				} else {
					idOuvrage = request.getParameter("idOuvrage");
					if (idOuvrage != null && !idOuvrage.equals("")) {
						//case of delete a product
						for (Ouvrage current : monPanierLocation.getMesOuvrages()) {
							if (current.getId().equals(idOuvrage)) {
								index = i;
								break;
							}
							i++;
						}
						monPanierLocation.getMesOuvrages().remove(index);
					}
				}
				break;
			case 3 :
				//case of delete all products
				monPanierLocation.getMesProduits().clear();
				monPanierLocation.getMesOuvrages().clear();
				break;
			case 4 : 
				model.put("location", monPanierLocation);
				request.getSession().setAttribute(WebConstants.MON_PANIER_LOCATION, monPanierLocation);
				return new ModelAndView(new RedirectView("./" + this.getSuccessView()), model);
			default :
				break;
		}
		
		model.put("location", monPanierLocation);
		request.getSession().setAttribute(WebConstants.MON_PANIER_LOCATION, monPanierLocation);
		
		return new ModelAndView(this.getFormView(), model);		
		
	}
	
	@Override
	protected ModelAndView showForm(HttpServletRequest request, HttpServletResponse response, BindException errors)
			throws Exception {
		logger.debug("In showForm de LocationController");
		Map<String, Object> model = new HashMap<String, Object>();
		Panier monPanierLocation = (Panier)((HttpServletRequest)request).getSession().getAttribute(WebConstants.MON_PANIER_LOCATION);
		if (monPanierLocation == null) {
			monPanierLocation = new Panier();
		}
		model.put("location", monPanierLocation);
		return new ModelAndView(this.getFormView(), model);
	}

	public void setProduitService(ProduitService produitService) {
		this.produitService = produitService;
	}
}
