package fr.the2d2a_bo.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import fr.the2d2a.bean.Rubrique;
import fr.the2d2a.exception.FonctionalException;
import fr.the2d2a.service.RubriqueService;
import fr.the2d2a.utils.RubriqueHelper;
import fr.the2d2a.web.constants.WebConstants;

public class RubriqueController extends SimpleFormController {

	protected static Logger logger = Logger.getLogger(RubriqueController.class);
	
	private RubriqueService rubriqueService;
	
	
	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		
		logger.info("In onSubmit RubriqueController...");
		
		Rubrique currentRubrique = (Rubrique)command;
		
		logger.debug("Visu de la current action : " + currentRubrique.getAction() + " sur rub d'ID : " + currentRubrique.getRubId());
		
		Map<String, Object> model = new HashMap<String, Object>();
		
				
		String rootParent = request.getParameter("rootParent");
		logger.debug("Visu root : " + rootParent);
		String lang = (String)request.getSession().getAttribute(WebConstants.LANGUE);
		logger.debug("Visu lang : " + lang);
		
		model.put("lang", lang);
		
		Map<Integer, List<Rubrique>> mapRubriques = new HashMap<Integer, List<Rubrique>>();
		try {
			List<Rubrique> rubriquesFils = rubriqueService.getRubriquesListWithInvisible(lang, currentRubrique.getRubId());
			mapRubriques.put(currentRubrique.getRubId(), rubriquesFils);
		}
		catch(FonctionalException e) {
			logger.info("Pas de sous rubriques pour " + currentRubrique.getRubId());
		}
		Rubrique currentParent = rubriqueService.getRubriqueById(lang, currentRubrique.getRubId());
		do {
			List<Rubrique> rubriquesParents = rubriqueService.getRubriquesListWithInvisible(lang, currentParent.getRub_rubId());
			mapRubriques.put(currentParent.getRub_rubId(), rubriquesParents);
			currentParent = rubriqueService.getRubriqueById(lang, currentParent.getRub_rubId());
		} while (currentParent != null && currentParent.getRubId() > 0);
		
		List<Rubrique> listeDisplay = new ArrayList<Rubrique>();
		RubriqueHelper.displayRubriqueInOrder(mapRubriques, mapRubriques.get(Integer.parseInt(rootParent)), listeDisplay, 0);
		logger.debug(listeDisplay.toString());
		if (rootParent.equals("-1")) {
			model.put("rubriques1", listeDisplay);
			List<Rubrique> rubriques2 = rubriqueService.getRubriquesListWithInvisible(lang, -3);
			model.put("rubriques2", rubriques2);
		}
		else {
			model.put("rubriques2", listeDisplay);
			List<Rubrique> rubriques1 = rubriqueService.getRubriquesListWithInvisible(lang, -1);
			model.put("rubriques1", rubriques1);
		}
		
		return new ModelAndView(this.getFormView(), model);
	}

	@Override
	protected ModelAndView showForm(HttpServletRequest request, HttpServletResponse response, BindException errors) throws Exception {
		logger.info("In showForm RubriqueController...");
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		String lang = (String)request.getSession().getAttribute(WebConstants.LANGUE);
				
		List<Rubrique> rubriques1 = rubriqueService.getRubriquesListWithInvisible(lang, -1);
		model.put("rubriques1", rubriques1);
		
		List<Rubrique> rubriques2 = rubriqueService.getRubriquesListWithInvisible(lang, -3);
		model.put("rubriques2", rubriques2);
		
		return new ModelAndView(this.getFormView(), model);
	}

	public void setRubriqueService(RubriqueService rubriqueService) {
		this.rubriqueService = rubriqueService;
	}
}
