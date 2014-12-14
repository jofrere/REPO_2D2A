package fr.the2d2a_bo.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.validation.BindException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import fr.the2d2a.bean.Rubrique;
import fr.the2d2a.service.RubriqueService;
import fr.the2d2a.utils.FileHelper;
import fr.the2d2a.web.constants.WebConstants;

public class ModifRubriqueController extends SimpleFormController {

	protected static Logger logger = Logger.getLogger(ModifRubriqueController.class);
	
	private RubriqueService rubriqueService;
	private ResourceBundleMessageSource messageSource;
	
	
	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		logger.info("In onSubmit ModifRubriqueController...");
		
		String lang = (String)request.getSession().getAttribute(WebConstants.LANGUE);
		
		Rubrique currentRubrique = (Rubrique)command;
		currentRubrique.setLang(lang);
		
		logger.debug("Visu de la current action : " + currentRubrique.getAction());
		switch (currentRubrique.getAction()) {
			case 1:
				logger.debug("Visu du current id pere de la nouvelle rubrique : " + currentRubrique.getRubId());
				currentRubrique.setRub_rubId(currentRubrique.getRubId());
				currentRubrique.setRubId(0);
				request.setAttribute("rub", currentRubrique);
				
				return this.showForm(request, response, errors);
				
			case 2:
				logger.debug("Visu du current id rubrique : " + currentRubrique.getRubId());
				Rubrique rub = rubriqueService.getRubriqueById(currentRubrique.getLang(), currentRubrique.getRubId());
				rub.setAction(currentRubrique.getAction());
				rub.setLang(currentRubrique.getLang());
				request.setAttribute("rub", rub);
				
				return this.showForm(request, response, errors);
				
			case 3:
				rubriqueService.deleteRubrique(currentRubrique.getRubId());
				break;
			case 4 :
			case 5 :
				if (currentRubrique.getPictoFile() != null) {
					//Gestion du path des images sur le disque
					String pathImage = messageSource.getMessage("rubrique.path.contribution.image", null, null);
					logger.debug("Visu du pathImage : " + pathImage);
					String pathServerImage = messageSource.getMessage("rubrique.path.image", null, null);
					
					//Gestion du picto
					MultipartFile pictoFile = currentRubrique.getPictoFile();
					String newPictoFileName = FileHelper.manageUploadedFile(pictoFile, currentRubrique.getPicto(), pathImage, pathServerImage);
					currentRubrique.setPicto(newPictoFileName);
				}
				
				if (currentRubrique.getCss() != null) {
					//Gestion du path des css sur le disque
					String pathCss = messageSource.getMessage("rubrique.path.contribution.css", null, null);
					logger.debug("Visu du pathCss : " + pathCss);
					String pathServerCss = messageSource.getMessage("rubrique.path.css", null, null);
					
					//Gestion du picto
					MultipartFile cssFile = currentRubrique.getPictoFile();
					String newCssFileName = FileHelper.manageUploadedFile(cssFile, currentRubrique.getCss(), pathCss, pathServerCss);
					currentRubrique.setCss(newCssFileName);
				}
								
				if (currentRubrique.getAction() == 5) {
					logger.debug("Modification de la rubrique.");
					rubriqueService.updateRubrique(currentRubrique);
				}
				else {
					logger.debug("Creation de la rubrique.");
					rubriqueService.insertRubrique(currentRubrique);
				}	
				break;
		}
		
		return new ModelAndView(new RedirectView(this.getSuccessView()));
	}

	@Override
	protected ModelAndView showForm(HttpServletRequest request, HttpServletResponse response, BindException errors) throws Exception {
		logger.info("In showForm ModifRubriqueController...");
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		Rubrique current = (Rubrique) request.getAttribute("rub");
						
		if (current.getAction() == 2)
			current.setAction(5);
		if (current.getAction() == 1)
			current.setAction(4);
		
		model.put("rubrique", current);
		
		return new ModelAndView(this.getFormView(), model);
	}

	public void setRubriqueService(RubriqueService rubriqueService) {
		this.rubriqueService = rubriqueService;
	}

	public void setMessageSource(ResourceBundleMessageSource messageSource) {
		this.messageSource = messageSource;
	}

}
