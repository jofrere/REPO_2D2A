package fr.the2d2a_bo.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.servlet.view.RedirectView;

import fr.the2d2a.bean.ImageOuvrage;
import fr.the2d2a.bean.Ouvrage;
import fr.the2d2a.service.OuvrageService;
import fr.the2d2a.utils.FileHelper;
import fr.the2d2a.web.constants.WebConstants;

public class ModifOuvrageController extends SimpleFormController {

	protected static Logger logger = Logger.getLogger(ModifOuvrageController.class);
	
	private OuvrageService ouvrageService;
	
	private ResourceBundleMessageSource messageSource;
	
	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {
		
		logger.info("In onSubmit ModifOuvrageController...");
		
		Ouvrage ouv = (Ouvrage)command;
		
		String lang = (String)request.getSession().getAttribute(WebConstants.LANGUE);
		
		logger.debug("Visu de la current action : " + ouv.getAction());
		switch (ouv.getAction()) {
			case 1:
			case 2:
				request.setAttribute("command", command);
				return this.showForm(request, response, errors);				
			case 3:
				ouvrageService.deleteOuvrage(ouv);
				break;
			case 4:				
			case 5:	
				
				//Gestion du path des images sur le disque
				String path = messageSource.getMessage("ouvrage.path.contribution.image", null, null);
				logger.debug("Visu du path : " + path);
				
				String pathServer = messageSource.getMessage("ouvrage.path.image", null, null);
				List<ImageOuvrage> imgToDelete = new ArrayList<ImageOuvrage>();
				for (ImageOuvrage img : ouv.getImages()) {
					if (img != null) {
						logger.info("Visu image : " + img.getPhotoFile().getOriginalFilename());
						
						//Gestion des images
						MultipartFile photoFile = img.getPhotoFile();
						String newPhotoFileName = FileHelper.manageUploadedImageFile(photoFile, img.getPathPhoto(), path, pathServer);
						if (newPhotoFileName == null)
							imgToDelete.add(img);
						else {
							img.setPathPhoto(newPhotoFileName);							
						}
					}
				}
				
				for (ImageOuvrage img : imgToDelete) {
					logger.debug("Image à deleted : ");
					ouv.getImages().remove(img);
				}
				
				if (ouv.getAction() == 5) {
					
					List<ImageOuvrage> listeToDelete = ouvrageService.getAllImageOuvrage(ouv.getId());
					logger.debug("ImgToDelete : " + ToStringBuilder.reflectionToString(listeToDelete));
					for (ImageOuvrage img : listeToDelete) {
						boolean found = false;
						for (ImageOuvrage img2 : ouv.getImages()) {
							if (img2!=null && (img2.getPathPhoto().equals(img.getPathPhoto()))) {
								logger.debug("On ne delete pas sur le file");
								found = true;
							}
						}
						if (! found) {
							logger.debug("On delete sur le file");
							String fileName = img.getPathPhoto().substring(pathServer.length()); 
							FileHelper.deleteFile(path, fileName);
						}
					}
					ouvrageService.updateOuvrage(ouv, lang);
				}
				else {
					logger.debug("Creation de la specificite dans les 2 langues.");
					ouvrageService.insertOuvrage(ouv, lang);
				}
				
				break;
			default:
				break;
		}
		

		return new ModelAndView(new RedirectView(this.getSuccessView()));
	}

	@Override
	protected ModelAndView showForm(HttpServletRequest request, HttpServletResponse response, BindException errors) throws Exception {
		logger.info("In showForm ModifSpecificiteController...");
		
		String lang = (String)request.getSession().getAttribute(WebConstants.LANGUE);
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		//cas update
		Ouvrage ouv = (Ouvrage)request.getAttribute("command");
		Ouvrage reel = new Ouvrage();
		if (ouv.getAction() == 2 || ouv.getAction() == 5)
			reel = ouvrageService.getOuvrageById(String.valueOf(ouv.getId()),lang);
		
		reel.setAction(ouv.getAction());
		model.put("ouvrage", reel);
		
		if (reel.getAction() == 2)
			reel.setAction(5);
		if (reel.getAction() == 1)
			reel.setAction(4);
		
		return new ModelAndView(this.getFormView(), model);
	}

	public void setOuvrageService(OuvrageService ouvrageService) {
		this.ouvrageService = ouvrageService;
	}

	public void setMessageSource(ResourceBundleMessageSource messageSource) {
		this.messageSource = messageSource;
	}
}
