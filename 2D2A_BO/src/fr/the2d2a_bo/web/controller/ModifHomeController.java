package fr.the2d2a_bo.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.log4j.Logger;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.validation.BindException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import fr.the2d2a.bean.Accueil;
import fr.the2d2a.bean.AccueilMaster;
import fr.the2d2a.exception.FonctionalException;
import fr.the2d2a.exception.TechnicalException;
import fr.the2d2a.service.AccueilService;
import fr.the2d2a.utils.FileHelper;
import fr.the2d2a.web.constants.WebConstants;

public class ModifHomeController extends SimpleFormController {

	protected static Logger logger = Logger.getLogger(ModifHomeController.class);
	
	private AccueilService accueilService;
	
	private ResourceBundleMessageSource messageSource;
			
	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {
		
		logger.info("In onSubmit ModifHomeController...");
		
		AccueilMaster accueils = (AccueilMaster) command;
		
		logger.debug(ToStringBuilder.reflectionToString(accueils));
		
		//Gestion du path des images sur le disque
		String path = messageSource.getMessage("home.path.contribution.image", null, null);
		logger.debug("Visu du path : " + path);
		
		String pathServer = messageSource.getMessage("home.path.image", null, null);
		
		for (Accueil accueil : accueils.getAccueils()) {
			//Gestion de l'imageTitre
			MultipartFile imageTitreFile = accueil.getImageAccueilFile();
			if (imageTitreFile != null) {
				String newImageTitreFileName = FileHelper.manageUploadedFile(imageTitreFile, accueil.getImageAccueil(), path, pathServer);
				accueil.setImageAccueil(newImageTitreFileName);
			}
			
			accueilService.updateAccueil(accueil);
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("accueils", accueils);
		model.put("lang", accueils.getLang());
		
		return new ModelAndView(this.getSuccessView(), model);
	}
	
	@Override
	protected ModelAndView showForm(HttpServletRequest request, HttpServletResponse response, BindException errors) throws Exception {
		logger.info("In showForm ModifHomeController...");
		Map<String, Object> model = new HashMap<String, Object>();
		
		//Récupération de la langue
		String lang = (String)request.getSession().getAttribute(WebConstants.LANGUE);
//		if (lang == null || lang.equals(""))
//			lang = WebConstants.LANGUE_FR;
		
		AccueilMaster accueils = new AccueilMaster();
		try {
			accueils.setAccueils(accueilService.getAllAccueils(lang));
			//logger.debug("Accueil : " + ToStringBuilder.reflectionToString(accueil));
		} catch (TechnicalException e) {
			// TODO 
			e.printStackTrace();
		} catch (FonctionalException e) {
			// TODO 
			e.printStackTrace();
		}
		accueils.setLang(lang);
		model.put("accueils", accueils);
		model.put("lang", lang);
		
		return new ModelAndView(this.getFormView(), model);
		//return super.showForm(request, response, errors);
	}
	
	public void setAccueilService(AccueilService accueilService) {
		this.accueilService = accueilService;
	}

	public void setMessageSource(ResourceBundleMessageSource messageSource) {
		this.messageSource = messageSource;
	}
}
