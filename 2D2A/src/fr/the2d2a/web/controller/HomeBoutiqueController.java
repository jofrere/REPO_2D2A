package fr.the2d2a.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import fr.the2d2a.bean.Rubrique;
import fr.the2d2a.beanform.RubriqueForm;
import fr.the2d2a.web.constants.ParamConstants;
import fr.the2d2a.web.constants.WebConstants;

public class HomeBoutiqueController extends SimpleFormController {
	
	private static Logger logger = Logger.getLogger(HomeBoutiqueController.class);

	@SuppressWarnings("unchecked")
	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		
		logger.info("HomeBoutiqueController starts...");
		
		String idBoutique = ((RubriqueForm) command).getRubrique();
		String lang = (String)request.getSession().getAttribute(WebConstants.LANGUE);
		
		//Recupérer la boutique
		Map<Integer, Rubrique> menuMap = (Map<Integer, Rubrique>)request.getSession().getAttribute(WebConstants.MENU_ + WebConstants.MAP_ + lang);
		Rubrique rubrique = menuMap.get(Integer.parseInt(idBoutique));
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("rubrique", rubrique);
		
		//ici construction de la FlashVar
		StringBuffer flashVar = new StringBuffer();
		flashVar.append("service=http://localhost:8080/").append(this.getServletContext().getAttribute(WebConstants.ROOT));
		flashVar.append(ParamConstants.HOME_BOUTIQUE_SERVICE).append("&LANGUE=").append(lang).append("&idBoutique=").append(idBoutique);
		
		logger.debug("Visu de l'url du httpService : " + flashVar.toString());
		
		model.put("flashVar", flashVar.toString());
		
		return new ModelAndView(this.getSuccessView(), model);
	}
}
