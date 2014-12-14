package fr.the2d2a_bo.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import fr.the2d2a.bean.Commande;
import fr.the2d2a.service.CommandeService;
import fr.the2d2a_bo.beanform.FilterCommandeForm;

public class CommandeController extends SimpleFormController {

	protected static Logger logger = Logger.getLogger(CommandeController.class);
	
	private CommandeService commandeService;
	
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {
		logger.debug("In onSubmit CommandeController...");
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		FilterCommandeForm filter = (FilterCommandeForm) command;
		
		//gestion des filtres
		logger.debug("Visu de etat : " + filter.getEtat());
		logger.debug("Visu de membre : " + filter.getMembre());
		logger.debug("Visu de la référene : " + filter.getReference());
		logger.debug("Visu du sort : " + filter.getSort());
		
		filter.setSort(this.manageSort(filter.getSort(), request));
		
		List<Commande> commandes = commandeService.getAllCommandeWithFilter(filter);
		model.put("listeCommande", commandes);
		
		model.put("filter", filter);
		
		return new ModelAndView(this.getSuccessView(), model);
	}
	
	private int manageSort(int newSort, HttpServletRequest request) {
		Integer oldSort = (Integer) request.getSession().getAttribute("oldSort");
		if (oldSort != null) {
			if (newSort == 1 && oldSort == 1)
				newSort = 2;
			if (newSort == 3 && oldSort == 3)
				newSort = 4;			
		} 
		request.getSession().setAttribute("oldSort", newSort);
		return newSort;
	}
	
	protected ModelAndView showForm(HttpServletRequest request, HttpServletResponse response, BindException errors) throws Exception {
		logger.debug("In showForm CommandeController...");
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		List<Commande> commandes = commandeService.getAllCommande();
		model.put("listeCommande", commandes);
		model.put("filter", new FilterCommandeForm());
		request.getSession().removeAttribute("oldSort");
		
		return new ModelAndView(this.getFormView(), model);
	}
	
	public void setCommandeService(CommandeService commandeService) {
		this.commandeService = commandeService;
	}
}
