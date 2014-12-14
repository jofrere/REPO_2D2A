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
import org.springframework.web.servlet.view.InternalResourceView;

import fr.the2d2a.bean.Coloris;
import fr.the2d2a.service.ColorisService;
import fr.the2d2a.utils.FileHelper;

public class ModifColorisController extends SimpleFormController {

	protected static Logger logger = Logger.getLogger(ModifColorisController.class);
	
	private ColorisService colorisService;
	private ResourceBundleMessageSource messageSource;
	
	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		
		logger.info("In onSubmit ModifColorisController...");
		
		Coloris coloris = (Coloris)command;
		logger.debug("Visu de la current action : " + coloris.getAction());
		switch (coloris.getAction()) {
			case 1:
			case 2:
				request.setAttribute("command", command);
				return this.showForm(request, response, errors);				
			case 3:
				colorisService.deleteColoris(coloris.getColId());
				break;
			case 4:				
			case 5:	
				//Gestion du path des images sur le disque
				String path = messageSource.getMessage("coloris.path.contribution.image", null, null);
				logger.debug("Visu du path : " + path);
				
				String pathServer = messageSource.getMessage("coloris.path.image", null, null);
				
				//Gestion du picto
				MultipartFile pictoFile = coloris.getPictoFile();
				String newPictoFileName = FileHelper.manageUploadedFile(pictoFile, coloris.getPicto(), path, pathServer);
				coloris.setPicto(newPictoFileName);
				
				if (coloris.getAction() == 5) {
					colorisService.updateColoris(coloris);
				}
				else {
					logger.debug("Creation du coloris dans les 2 langues.");
					colorisService.insertColoris(coloris);
				}
				
				break;
			default:
				break;
		}
		

		return new ModelAndView(new InternalResourceView(this.getSuccessView()));
	}

	@Override
	protected ModelAndView showForm(HttpServletRequest request, HttpServletResponse response, BindException errors) throws Exception {
		logger.info("In showForm ModifColorisController...");
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		//cas update
		Coloris coloris = (Coloris)request.getAttribute("command");
		model.put("coloris", coloris);
		
		if (coloris.getAction() == 2)
			coloris.setAction(5);
		if (coloris.getAction() == 1)
			coloris.setAction(4);
		
		return new ModelAndView(this.getFormView(), model);
	}

	public void setColorisService(ColorisService colorisService) {
		this.colorisService = colorisService;
	}

	public void setMessageSource(ResourceBundleMessageSource messageSource) {
		this.messageSource = messageSource;
	}
}
