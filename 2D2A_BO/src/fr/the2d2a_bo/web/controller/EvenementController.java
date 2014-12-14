package fr.the2d2a_bo.web.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import fr.the2d2a.bean.Evenement;
import fr.the2d2a.bean.Rubrique;
import fr.the2d2a.service.EvenementService;
import fr.the2d2a.service.RubriqueService;
import fr.the2d2a.web.constants.WebConstants;
import fr.the2d2a_bo.beanform.FilterEvenementForm;

public class EvenementController extends SimpleFormController {
	
	protected static Logger logger = Logger.getLogger(EvenementController.class);
	
	private EvenementService evenementService;
	private RubriqueService rubriqueService;
	
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {
		logger.debug("In onSubmit EvenementController...");
		
		this.referenceData(request);
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		FilterEvenementForm filter = (FilterEvenementForm) command;
		
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
		
		//gestion des filtres
		if (StringUtils.isNotBlank(filter.getDateDebut())) {
			Date debut = sdf.parse(filter.getDateDebut());
			filter.setDateDebutF(sdf2.format(debut));
		}
		
		if (StringUtils.isNotBlank(filter.getDateFin())) {
			Date fin = sdf.parse(filter.getDateFin());
			filter.setDateFinF(sdf2.format(fin));
		}
		
		logger.debug("Visu de dateDebut : " + filter.getDateDebut());
		logger.debug("Visu de dateFin : " + filter.getDateFin());
		logger.debug("Visu de visibilite : " + filter.getVisibilite());
		logger.debug("Visu de rubrique : " + filter.getRubrique());
		
		List<Evenement> events = evenementService.getAllEvenementWithFilter(getLang(request), filter);
		model.put("events", events);
		model.put("filter", filter);
		
		
		return new ModelAndView(this.getSuccessView(), model);
	}
	
	protected ModelAndView showForm(HttpServletRequest request, HttpServletResponse response, BindException errors) throws Exception {
		logger.debug("In handleRequest EvenementController...");
		
		this.referenceData(request);
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		List<Evenement> events = evenementService.getAllEvenements(getLang(request));
		model.put("events", events);
		model.put("filter", new FilterEvenementForm());
		
		
		return new ModelAndView(this.getFormView(), model);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		
		logger.debug("In referenceData de EvenementController");
				
		//gestion liste de rubrique
		List<Rubrique> rubriques = rubriqueService.getRubriquesListWithInvisible(getLang(request), 15);
		List<Rubrique> rubriques2 = rubriqueService.getRubriquesListWithInvisible(getLang(request), 16);
		request.setAttribute("listeRubrique", rubriques);
		request.setAttribute("listeRubrique2", rubriques2);
		return super.referenceData(request);
	}
	
	public void setEvenementService(EvenementService evenementService) {
		this.evenementService = evenementService;
	}
	
	private String getLang(HttpServletRequest request) {
		return (String)request.getSession().getAttribute(WebConstants.LANGUE);
	}

	public void setRubriqueService(RubriqueService rubriqueService) {
		this.rubriqueService = rubriqueService;
	}
}