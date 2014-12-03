package fr.the2d2a.web.controller;

import java.util.HashMap;
import java.util.List;
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
import fr.the2d2a.bean.Coloris;
import fr.the2d2a.bean.Membre;
import fr.the2d2a.bean.Ouvrage;
import fr.the2d2a.bean.Panier;
import fr.the2d2a.bean.Produit;
import fr.the2d2a.exception.FonctionalException;
import fr.the2d2a.exception.TechnicalException;
import fr.the2d2a.service.MembreService;
import fr.the2d2a.service.ProduitService;
import fr.the2d2a.web.constants.WebConstants;

public class MonPanierController extends SimpleFormController {
	
	private static Logger logger = Logger.getLogger(MonPanierController.class);

	private ProduitService produitService;
	
	private MembreService membreService;
	
	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		
		logger.debug("In onSubmit de MonPanierController");
		String lang = (String) ((HttpServletRequest)request).getSession().getAttribute(WebConstants.LANGUE);
		Map<String, Object> model = new HashMap<String, Object>();
		
		Panier monPanier = (Panier)((HttpServletRequest)request).getSession().getAttribute(WebConstants.MON_PANIER);
		if (monPanier == null) {
			monPanier = new Panier();
		}
		
		if (request.getParameter("action") == null) {
			return this.showForm(request, response, errors);
		}
		int action = Integer.parseInt(request.getParameter("action"));
		
		
		//MAJ quantite reservee
		if (action != 1) {
			for (int j = 0; j < monPanier.getMesProduits().size(); j++) {
				String q = request.getParameter("quantiteReservee["+j+"]");
				monPanier.getMesProduits().get(j).setQuantiteReservee(Integer.parseInt(q));
			}
			for (int j = 0; j < monPanier.getMesOuvrages().size(); j++) {
				String q = request.getParameter("quantiteReserveeOuvrage["+j+"]");
				monPanier.getMesOuvrages().get(j).setQuantiteReservee(Integer.parseInt(q));
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
				break;
			case 2 : 
				
				int index = -1, i = 0;
				
				idProduit = request.getParameter("idProduit");
				if (idProduit != null && !idProduit.equals("")) {
					//case of delete a product
					for (Produit current : monPanier.getMesProduits()) {
						if (current.getProId() == Integer.parseInt(idProduit) && current.getColId().equals(idColoris)) {
							index = i;
							break;
						}
						i++;
					}
					monPanier.getMesProduits().remove(index);
				} else {
					idOuvrage = request.getParameter("idOuvrage");
					if (idOuvrage != null && !idOuvrage.equals("")) {
						//case of delete a product
						for (Ouvrage current : monPanier.getMesOuvrages()) {
							if (current.getId().equals(idOuvrage)) {
								index = i;
								break;
							}
							i++;
						}
						monPanier.getMesOuvrages().remove(index);
					}
				}
				break;
			case 3 :
				//case of delete all products
				monPanier.getMesProduits().clear();
				monPanier.getMesOuvrages().clear();
				break;
			case 4 :
				//case of buy products
				Membre membre = (Membre) request.getSession().getAttribute(WebConstants.AUTHENTICATED_MEMBER);
				if (membre == null) {
					model.put("achat", "achat");
				}
				else {
					List<Adresse> adresses = membre.getAdresses();
					for (Adresse adresse : adresses) {
						logger.debug("Visu adresse : " + ToStringBuilder.reflectionToString(adresse, ToStringStyle.MULTI_LINE_STYLE));
						logger.debug("Visu pays : " + ToStringBuilder.reflectionToString(adresse.getPays(), ToStringStyle.MULTI_LINE_STYLE));
					}
					model.put("monPanier", monPanier);
					request.getSession().setAttribute(WebConstants.MON_PANIER, monPanier);
					return new ModelAndView(new RedirectView(this.getSuccessView()), model);
				}
				break;
			case 5 :
				//authentication
				logger.debug("Authentification en cours...");
				try {
					String login = request.getParameter("login");
					String password = request.getParameter("password");
					membre = membreService.authenticateMember(login, password, lang);
					request.getSession().setAttribute(WebConstants.AUTHENTICATED_MEMBER, membre);
					return new ModelAndView(new RedirectView(this.getSuccessView()), model);
				} catch (FonctionalException e) {
					model.put("panierAuthenticationError", "panierAuthenticationError");
					model.put("achat", "achat");					
				} catch (TechnicalException e) {
					//TODO : gestion 500
					e.printStackTrace();
				}
				break;
			default : 
				break;
		}
		
		model.put("monPanier", monPanier);
		request.getSession().setAttribute(WebConstants.MON_PANIER, monPanier);
		
		return new ModelAndView(this.getFormView(), model);		
	}
	
	@Override
	protected ModelAndView showForm(HttpServletRequest request, HttpServletResponse response, BindException errors)
			throws Exception {
		logger.debug("In showForm");
		Map<String, Object> model = new HashMap<String, Object>();
		Panier monPanier = (Panier)((HttpServletRequest)request).getSession().getAttribute(WebConstants.MON_PANIER);
		if (monPanier == null) {
			monPanier = new Panier();
		}
		model.put("monPanier", monPanier);
		return new ModelAndView(this.getFormView(), model);
	}

	public void setProduitService(ProduitService produitService) {
		this.produitService = produitService;
	}

	public void setMembreService(MembreService membreService) {
		this.membreService = membreService;
	}
	
	
}
