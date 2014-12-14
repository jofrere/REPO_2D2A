package fr.the2d2a.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import fr.the2d2a.beanform.RechercheForm;
import fr.the2d2a.service.DesignerService;
import fr.the2d2a.service.EditeurService;
import fr.the2d2a.service.RechercheService;
import fr.the2d2a.service.RubriqueService;
import fr.the2d2a.web.constants.ParamConstants;
import fr.the2d2a.web.constants.WebConstants;

public class RechercheController extends SimpleFormController {
	
	private static Logger logger = Logger.getLogger(RechercheController.class);
	
	private RechercheService rechercheService;
	private EditeurService editeurService;
	private DesignerService designerService;
	private RubriqueService rubriqueService;
	private Map<String, String> tablePrix;

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {

        logger.debug("In onSubmit RechercheController");
        
        this.referenceData(request);
        
        Map<String, Object> model = new HashMap<String, Object>();
        
        String lang = (String) ((HttpServletRequest)request).getSession().getAttribute(WebConstants.LANGUE);
        RechercheForm rechercheForm = (RechercheForm) command;
        rechercheForm.setLang(lang);
        
      //debut traitement
		int pageIndex = rechercheForm.getPageIndex();
		logger.debug("Visu pageIndex : " + pageIndex);
        
        logger.debug("Visu du form : " + ToStringBuilder.reflectionToString(rechercheForm));
        
        List<Produit> produits = rechercheService.getAllProduitsByContent(rechercheForm);
        for (Produit produit : produits) {
			List<Rubrique> rubriques = rubriqueService.getRubriquesByProduitId(lang, produit.getProId());
			if (rubriques != null) {
				produit.setRubId(String.valueOf(rubriques.get(0).getRubId()));
			}
		}
		
        logger.debug("Nombre de resultats : " + produits.size());
        
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
        model.put("nombreResultats", produits.size());
        model.put("searchContent", rechercheForm.getSearchField());
        model.put("recherche", "recherche");
        model.put("rechercheForm", rechercheForm);
        
        return new ModelAndView(this.getSuccessView(), model);
	}
	
	@Override
	protected ModelAndView showForm(HttpServletRequest request, HttpServletResponse response, BindException errors) throws Exception {
		logger.debug("In showForm RechercheController...");
		
		this.referenceData(request);
		
		RechercheForm rechercheForm = new RechercheForm();
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("rechercheForm", rechercheForm);
		
		return new ModelAndView(this.getFormView(), model);
	}

	public void setRechercheService(RechercheService rechercheService) {
		this.rechercheService = rechercheService;
	}

	@SuppressWarnings("unchecked")
	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		
		logger.debug("In referenceData");

		String lang = (String) ((HttpServletRequest)request).getSession().getAttribute(WebConstants.LANGUE);
		//gestion des éditeurs
		List<Artiste> editeurs = editeurService.getAllEditeurByLang(lang);
		request.setAttribute("editeurs", editeurs);
		logger.debug(editeurs.toString());
		
		//gestion des designers
		List<Artiste> designers = designerService.getAllDesignerByLang(lang);
		request.setAttribute("designers", designers);
		logger.debug(designers.toString());
		
		//gestion des rubriques
		List<Rubrique> rubriques = rubriqueService.getRubriquesListFromParentId(lang, -1);
		request.setAttribute("rubriques", rubriques);
		logger.debug(rubriques.toString());
		
		//gestion des prix
		request.setAttribute("tablePrix", tablePrix);
		
		return super.referenceData(request);
	}

	public void setEditeurService(EditeurService editeurService) {
		this.editeurService = editeurService;
	}

	public void setTablePrix(Map<String, String> tablePrix) {
		this.tablePrix = tablePrix;
	}

	public DesignerService getDesignerService() {
		return designerService;
	}

	public void setDesignerService(DesignerService designerService) {
		this.designerService = designerService;
	}

	public RubriqueService getRubriqueService() {
		return rubriqueService;
	}

	public void setRubriqueService(RubriqueService rubriqueService) {
		this.rubriqueService = rubriqueService;
	}
}
