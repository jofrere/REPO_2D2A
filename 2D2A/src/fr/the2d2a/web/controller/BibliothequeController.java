package fr.the2d2a.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import fr.the2d2a.bean.Ouvrage;
import fr.the2d2a.bean.Panier;
import fr.the2d2a.beanform.OuvrageForm;
import fr.the2d2a.service.OuvrageService;
import fr.the2d2a.web.constants.ParamConstants;
import fr.the2d2a.web.constants.WebConstants;

public class BibliothequeController extends SimpleFormController  {

    protected static Logger logger = Logger.getLogger(BibliothequeController.class);
    
    private OuvrageService ouvrageService;

    @Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {
		
		logger.debug("in onSubmit");
        
		String lang = (String) ((HttpServletRequest)request).getSession().getAttribute(WebConstants.LANGUE);
        request.setAttribute(WebConstants.LANGUE, lang);
		
        OuvrageForm ouvForm = (OuvrageForm) command;
        
      //gestion ajout au panier
		String action = request.getParameter("action");
		if (action != null && action.equals("1")) {
			logger.debug("Ajout panier");
			Panier monPanier = (Panier)((HttpServletRequest)request).getSession().getAttribute(WebConstants.MON_PANIER);
			if (monPanier == null) {
				monPanier = new Panier();
			}
			Ouvrage ouvrage = ouvrageService.getOuvrageById(ouvForm.getOuvId(), lang);
			boolean trouve = false;
			for (Ouvrage ouv : monPanier.getMesOuvrages()) {
				if (ouvrage.getId().equals(ouv.getId())) {
					trouve = true;
					ouv.setQuantiteReservee(ouv.getQuantiteReservee() + 1);
				}
			}
			if (!trouve) {
				ouvrage.setQuantiteReservee(1);
				monPanier.getMesOuvrages().add(ouvrage);
			}
			request.getSession().setAttribute(WebConstants.MON_PANIER, monPanier);
			logger.debug("Ajout d'un ouvrage au panier");
		}
        
        Map<String, Object> model = this.getModel(request, ouvForm);
        
        return new ModelAndView(this.getSuccessView(), model);
    }
    
    protected ModelAndView showForm(HttpServletRequest request, HttpServletResponse response, BindException errors) throws Exception {
		logger.debug("In showForm EvenementController...");
		
		OuvrageForm ouvForm = new OuvrageForm();
		ouvForm.setPageIndex(0);
		
    	Map<String, Object> model = this.getModel(request, ouvForm);
		
		return new ModelAndView(this.getFormView(), model);
	}
    
    private Map<String, Object> getModel(HttpServletRequest request, OuvrageForm ouvForm) throws Exception {
		
		this.referenceData(request);
		
		String lang = (String) ((HttpServletRequest)request).getSession().getAttribute(WebConstants.LANGUE);
        request.setAttribute(WebConstants.LANGUE, lang);
        
        Map<String, Object> model = new HashMap<String, Object>();
        
        //debut traitement
		int pageIndex = ouvForm.getPageIndex();
		logger.debug("Visu pageIndex : " + pageIndex);
        
        List<Ouvrage> ouvrages = ouvrageService.getAllOuvrage(lang);
        model.put("nbOuvrages", ouvrages.size());
        
        //traitement Pager
		if (ouvrages.size() > ParamConstants.MAX_OUVRAGE_BY_PAGE) {
			model.put("pager", "pager");
			int nbPages = ouvrages.size()/ParamConstants.MAX_OUVRAGE_BY_PAGE;
			if (ouvrages.size()%ParamConstants.MAX_OUVRAGE_BY_PAGE > 0)
				nbPages++;
			model.put("nbPages", nbPages);
			logger.debug("Visu nbPages : " + nbPages);
			model.put("pageIndex", pageIndex);
			model.put("currentPage", pageIndex+1);
			model.put("ouvrages", ouvrages.subList(pageIndex*ParamConstants.MAX_OUVRAGE_BY_PAGE, Math.min(pageIndex*ParamConstants.MAX_OUVRAGE_BY_PAGE+ParamConstants.MAX_OUVRAGE_BY_PAGE, ouvrages.size())));
		} else {
			model.put("ouvrages", ouvrages);
		}
        
        model.put("actualite", "actualite");
        model.put("ouvrageForm", ouvForm);
        
        return model;
	}
    
	public void setOuvrageService(OuvrageService presseService) {
		this.ouvrageService = presseService;
	}
}
