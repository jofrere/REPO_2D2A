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

import fr.the2d2a.bean.Ouvrage;
import fr.the2d2a.service.OuvrageService;
import fr.the2d2a.web.constants.WebConstants;
import fr.the2d2a_bo.beanform.FilterOuvrageForm;

public class OuvrageController extends SimpleFormController {

	protected static Logger logger = Logger.getLogger(OuvrageController.class);
	private static NumberFormat nbFormat = NumberFormat.getIntegerInstance();
	
	private OuvrageService ouvrageService;
	
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {
		logger.debug("In onSubmit OuvrageController...");
		
		this.referenceData(request);
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		FilterOuvrageForm filter = (FilterOuvrageForm) command; 
		
		//gestion des filtres
		logger.debug("Visu de type : " + filter.getType());
		logger.debug("Visu de ref : " + filter.getReference());
		logger.debug("Visu de titre : " + filter.getTitre());
		logger.debug("Visu de auteur : " + filter.getAuteur());
		
		List<Ouvrage> ouvrages = ouvrageService.getAllOuvrageWithFilter(getLang(request), filter);
		model.put("ouvrages", ouvrages);
		model.put("filter", filter);
		this.calculateStock(ouvrages, model);
		
		return new ModelAndView(this.getSuccessView(), model);
	}
	
	protected ModelAndView showForm(HttpServletRequest request, HttpServletResponse response, BindException errors) throws Exception {
		logger.debug("In handleRequest OuvrageController...");
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		List<Ouvrage> ouvrages = ouvrageService.getAllOuvrage(getLang(request));
		model.put("ouvrages", ouvrages);
		model.put("filter", new FilterOuvrageForm());
		this.calculateStock(ouvrages, model);
		
		return new ModelAndView("ouvrage", model);
	}
	
	public void setOuvrageService(OuvrageService ouvrageService) {
		this.ouvrageService = ouvrageService;
	}
	
	private String getLang(HttpServletRequest request) {
		return (String)request.getSession().getAttribute(WebConstants.LANGUE);
	}
	
	private void calculateStock(List<Ouvrage> ouvrages, Map<String, Object> model) {
		int qtte = 0;
		float prix = 0;
		for (Ouvrage ouv : ouvrages) {
			qtte += ouv.getQuantite();
			prix += (ouv.getPrix()*qtte);
		}
		model.put("qtte", qtte);
		model.put("prix", getFormate(prix));
	}
	
	private String getFormate(float p) {
		nbFormat.setMaximumFractionDigits(2);
		nbFormat.setMinimumFractionDigits(2);
		return nbFormat.format(p);
	}
}
