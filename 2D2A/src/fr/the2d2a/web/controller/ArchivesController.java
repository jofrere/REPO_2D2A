package fr.the2d2a.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.log4j.Logger;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import fr.the2d2a.bean.Artiste;
import fr.the2d2a.bean.Produit;
import fr.the2d2a.bean.Rubrique;
import fr.the2d2a.beanform.ArchivesForm;
import fr.the2d2a.exception.FonctionalException;
import fr.the2d2a.service.DesignerService;
import fr.the2d2a.service.EditeurService;
import fr.the2d2a.service.ProduitService;
import fr.the2d2a.service.RubriqueService;
import fr.the2d2a.web.constants.ParamConstants;
import fr.the2d2a.web.constants.WebConstants;



public class ArchivesController extends SimpleFormController {

	private Logger logger = Logger.getLogger(ArchivesController.class);
	
	private static final String[] ALPHABET = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"};
	
	private DesignerService designerService;
	private EditeurService editeurService;
	private ProduitService produitService;
	private RubriqueService rubriqueService;

	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {

        logger.debug("In onSubmit ArchivesController");
        ArchivesForm filter = (ArchivesForm) command;
        logger.debug("Visu du filtre : " + ToStringBuilder.reflectionToString(filter));
        this.getArtistes(request, filter);
        
        Map<String, Object> model = new HashMap<String, Object>();
    	model.put("filter", filter);
        
        return new ModelAndView(this.getSuccessView(), model);
	}
	
	protected ModelAndView showForm(HttpServletRequest request, HttpServletResponse response, BindException errors) throws Exception {
		
    	logger.debug("In showForm ArchivesController...");
    	
    	ArchivesForm filter = new ArchivesForm();
    	
    	this.getArtistes(request, filter);
    	
    	Map<String, Object> model = new HashMap<String, Object>();
    	model.put("filter", filter);
    	
		return new ModelAndView(this.getFormView(), model);
	}
	
	private void getArtistes(HttpServletRequest request, ArchivesForm filter) throws Exception {
		String lang = (String) ((HttpServletRequest)request).getSession().getAttribute(WebConstants.LANGUE);
		Rubrique currentRubrique = (Rubrique) request.getAttribute("rubrique");

		List<Artiste> artistes = new ArrayList<Artiste>(); 
		if (currentRubrique.getFriendlyName().equals(WebConstants.ARCHIVES_EN) || currentRubrique.getFriendlyName().equals(WebConstants.ARCHIVES_FR)) {
			List<Artiste> designers = designerService.getAllDesignerByLang(lang);
			if (designers != null && !designers.isEmpty()) {
				artistes.addAll(designers);
			}
			List<Artiste> editeurs = editeurService.getAllEditeurByLang(lang);
			if (editeurs != null && !editeurs.isEmpty()) {
				artistes.addAll(editeurs);
			}
		} else if (currentRubrique.getFriendlyName().equals(WebConstants.DESIGNER_EN) || currentRubrique.getFriendlyName().equals(WebConstants.DESIGNER_FR)) {
			List<Artiste> designers = designerService.getAllDesignerByLang(lang);
			if (designers != null && !designers.isEmpty()) {
				artistes.addAll(designers);
			}
		} else if (currentRubrique.getFriendlyName().equals(WebConstants.EDITEUR_EN) || currentRubrique.getFriendlyName().equals(WebConstants.EDITEUR_FR)) {
			List<Artiste> editeurs = editeurService.getAllEditeurByLang(lang);
			if (editeurs != null && !editeurs.isEmpty()) {
				artistes.addAll(editeurs);
			}
		}

		logger.debug("Visu de la liste d'artistes : " + ToStringBuilder.reflectionToString(artistes));

		//Gestion des lettres du haut
		SortedMap<String, List<Artiste>> lettresUtiles = new TreeMap<String, List<Artiste>>();
		for (int i = 0; i < ALPHABET.length; i++) {
			lettresUtiles.put(ALPHABET[i].toUpperCase(), new ArrayList<Artiste>());
		}
		
		String key = null;
		for (Iterator<Artiste> it = artistes.iterator(); it.hasNext(); ) {
			Artiste current = it.next();
			key = current.getNom().substring(0, 1).toUpperCase();
			List<Artiste> listeArtiste = lettresUtiles.get(key);
			listeArtiste.add(current);
		}
		
		request.setAttribute("lettresUtiles", lettresUtiles);
		
		//Gestion de la liste d'artiste en dessous
		List<Artiste> selectedArtistes = null;
		if (filter.getSelectedLetter() != null) {
			selectedArtistes = lettresUtiles.get(filter.getSelectedLetter());
		} else {
			List<Artiste> tmpList = null;
			for (Iterator<String> it = lettresUtiles.keySet().iterator(); it.hasNext(); ) {
				String letterKey = it.next();
				tmpList = lettresUtiles.get(letterKey);
				if (!tmpList.isEmpty()) {
					selectedArtistes = tmpList;
					filter.setSelectedLetter(letterKey);
					break;
				}
			}
		}
		
		if (selectedArtistes != null) {
			request.setAttribute("selectedArtistes", selectedArtistes);
			
			//Gestion de l'artiste spécifiquement sélectionné
			String artisteName = request.getParameter("artiste");
			logger.debug("Visu artiste : " + artisteName);
			Artiste currentArtiste = null;
			if (artisteName != null) {
				String[] nameSplitted = artisteName.split("_");
				String prenom = nameSplitted[0];
				String nom = nameSplitted[1];
				try {
					currentArtiste = designerService.getDesignerByNameAndLang(lang, prenom, nom);
				} catch(FonctionalException e) {
					currentArtiste = editeurService.getEditeurByNameAndLang(lang, prenom, nom);
				}
				filter.setSelectedArtisteId(currentArtiste.getId());
				filter.setTypeArtiste(currentArtiste.getTypeArtiste());
			} else {
				currentArtiste = selectedArtistes.get(0);
				filter.setSelectedArtisteId(currentArtiste.getId());
				filter.setTypeArtiste(currentArtiste.getTypeArtiste());
			}
			request.setAttribute("currentArtiste", currentArtiste);
			
			//gestion des oeuvres de l'artistes
			List<Produit> produits = null;
			if (currentArtiste.getTypeArtiste().equals(ParamConstants.DESIGNER)) {
				produits = produitService.getProduitsByDesigner(lang, currentArtiste.getId());
			} else {
				produits = produitService.getProduitsByEditeur(lang, currentArtiste.getId());
			}
			if (produits != null) {
				for (Produit produit : produits) {
					List<Rubrique> rubriques = rubriqueService.getRubriquesByProduitId(lang, produit.getProId());
					if (rubriques != null) {
						produit.setRubId(String.valueOf(rubriques.get(0).getRubId()));
					}
				}
				logger.debug("Visu des produits rapportés : " + produits.toString());
				request.setAttribute("produitsAssociated", produits);
				request.setAttribute("nbProduitsAssociated", produits.size());
			}
		}
	}

	public void setDesignerService(DesignerService designerService) {
		this.designerService = designerService;
	}

	public void setEditeurService(EditeurService editeurService) {
		this.editeurService = editeurService;
	}

	public void setProduitService(ProduitService produitService) {
		this.produitService = produitService;
	}

	public void setRubriqueService(RubriqueService rubriqueService) {
		this.rubriqueService = rubriqueService;
	}
}
