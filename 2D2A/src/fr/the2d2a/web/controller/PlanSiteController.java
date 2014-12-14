package fr.the2d2a.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.springframework.web.servlet.support.WebContentGenerator;

import fr.the2d2a.bean.Rubrique;
import fr.the2d2a.utils.RubriqueHelper;
import fr.the2d2a.web.constants.WebConstants;

public class PlanSiteController extends WebContentGenerator implements Controller {

	private static Logger logger = Logger.getLogger(PlanSiteController.class);
	
	@SuppressWarnings("unchecked")
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		logger.debug("in handleRequest");
		
		String lang = (String)request.getSession().getAttribute(WebConstants.LANGUE);
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put(WebConstants.LANGUE, lang);
		
		Map<Integer, Rubrique> menuMap = (Map<Integer, Rubrique>)request.getSession().getAttribute(WebConstants.MENU_ + WebConstants.MAP_ + lang);
		
		String root = (String)this.getServletContext().getAttribute(WebConstants.ROOT);
		
		//gestion liste de rubrique
		List<Rubrique> rubriques = (List<Rubrique>)request.getSession().getAttribute(WebConstants.MENU_ + lang);
		List<Rubrique> listeBoutique = new ArrayList<Rubrique>();
		RubriqueHelper.displayAllRubriqueInOrderWithLink(rubriques, listeBoutique, -1, 0, root, menuMap, "1");
		RubriqueHelper.displayAllRubriqueInOrderWithLink(rubriques, listeBoutique, -2, 0, root, menuMap, "1");
		request.setAttribute("boutique", listeBoutique);
		
		List<Rubrique> listeActu = new ArrayList<Rubrique>();
		RubriqueHelper.displayAllRubriqueInOrderWithLink(rubriques, listeActu, -3, 0, root, menuMap, "2");
		request.setAttribute("actualite", listeActu);
		
		
		return new ModelAndView("planSite", model);
	}
}
