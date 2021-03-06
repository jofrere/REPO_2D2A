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

import fr.the2d2a.bean.Evenement;
import fr.the2d2a.beanform.EvenementForm;
import fr.the2d2a.service.EvenementService;
import fr.the2d2a.web.constants.ParamConstants;
import fr.the2d2a.web.constants.WebConstants;

public class AgendaController extends SimpleFormController {

    protected static Logger logger = Logger.getLogger(AgendaController.class);
    
    private EvenementService evenementService;

    @Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {

        logger.debug("Start CalendrierController");
        String lang = (String) ((HttpServletRequest)request).getSession().getAttribute(WebConstants.LANGUE);
        request.setAttribute(WebConstants.LANGUE, lang);
        
        EvenementForm evtForm = (EvenementForm) command;
        
        Map<String, Object> model = this.getModel(request, evtForm);        
//        model.put("actualite", "actualite");
        
        return new ModelAndView(this.getSuccessView(), model);
    }
    
    protected ModelAndView showForm(HttpServletRequest request, HttpServletResponse response, BindException errors) throws Exception {
		logger.debug("In showForm EvenementController...");
		
		String idActualites = (String) request.getAttribute("currentRubriqueId");
		EvenementForm evtForm = new EvenementForm();
		evtForm.setRubrique(idActualites);
		evtForm.setPageIndex(0);
		evtForm.setTypeEvt(0);
    	
    	Map<String, Object> model = this.getModel(request, evtForm);
		
		return new ModelAndView(this.getFormView(), model);
	}
    
    @SuppressWarnings("unchecked")
	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		
		logger.debug("In referenceData");
		
		String lang = (String) ((HttpServletRequest)request).getSession().getAttribute(WebConstants.LANGUE);
		String rubId = (String) request.getAttribute("currentRubriqueId");
		
		//gestion des departements existants
		List<String> deps = evenementService.getAllDepartement(lang, rubId);
		request.setAttribute("deps", deps);
		
//		//gestion des type d'evenements
//		List<TypeEvenement> typeEvts = evenementService.getAllType(lang);
//		request.setAttribute("typeEvts", typeEvts);
		
		return super.referenceData(request);
	}
    
    private Map<String, Object> getModel(HttpServletRequest request, EvenementForm evtForm) throws Exception {
		
		this.referenceData(request);
		
		String lang = (String) ((HttpServletRequest)request).getSession().getAttribute(WebConstants.LANGUE);
        request.setAttribute(WebConstants.LANGUE, lang);
        
        Map<String, Object> model = new HashMap<String, Object>();
        
        //debut traitement
		int pageIndex = evtForm.getPageIndex();
		logger.debug("Visu pageIndex : " + pageIndex);
		
		String rubId = evtForm.getRubrique();
		model.put("rubId", rubId);
		
		
		logger.debug("Visu dep : " + evtForm.getDepartement());
		logger.debug("Visu type : " + evtForm.getTypeEvt());
		
		model.put("filter", evtForm);
		
        List<Evenement> evenements = evenementService.getEvenementByRubriqueIdWithFilter(lang, rubId, evtForm);
        model.put("nbEvenements", evenements.size());
        
        //traitement Pager
		if (evenements.size() > ParamConstants.MAX_EVENT_BY_PAGE) {
			model.put("pager", "pager");
			int nbPages = evenements.size()/ParamConstants.MAX_EVENT_BY_PAGE;
			if (evenements.size()%ParamConstants.MAX_EVENT_BY_PAGE > 0)
				nbPages++;
			model.put("nbPages", nbPages);
			logger.debug("Visu nbPages : " + nbPages);
			model.put("pageIndex", pageIndex);
			model.put("currentPage", pageIndex+1);
			model.put("evenements", evenements.subList(pageIndex*ParamConstants.MAX_EVENT_BY_PAGE, Math.min(pageIndex*ParamConstants.MAX_EVENT_BY_PAGE+ParamConstants.MAX_EVENT_BY_PAGE, evenements.size())));
		} else {
			model.put("evenements", evenements);
		}
        
        model.put("actualite", "actualite");
        
        return model;
	}

	public void setEvenementService(EvenementService evenementService) {
		this.evenementService = evenementService;
	}
}
