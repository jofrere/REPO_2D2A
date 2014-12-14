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

import fr.the2d2a.bean.Evenement;
import fr.the2d2a.bean.ImageEvenement;
import fr.the2d2a.bean.Rubrique;
import fr.the2d2a.service.EvenementService;
import fr.the2d2a.service.RubriqueService;
import fr.the2d2a.utils.FileHelper;
import fr.the2d2a.web.constants.WebConstants;

public class ModifEvenementController extends SimpleFormController {

	protected static Logger logger = Logger.getLogger(ModifEvenementController.class);
	
	private EvenementService evenementService;
	private RubriqueService rubriqueService;
	private ResourceBundleMessageSource messageSource;
	
	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {
		
		logger.info("In onSubmit ModifEvenementController...");
		
		Evenement evt = (Evenement)command;
		
		String lang = (String)request.getSession().getAttribute(WebConstants.LANGUE);
		
		logger.debug("Visu de la current action : " + evt.getAction());
		switch (evt.getAction()) {
			case 1:
			case 2:
				request.setAttribute("command", command);
				return this.showForm(request, response, errors);				
			case 3:
				evenementService.deleteEvenement(evt);
				break;
			case 4:				
			case 5:	
				
				//Gestion du path des images sur le disque
				String path = messageSource.getMessage("evenement.path.contribution.image", null, null);
				logger.debug("Visu du path : " + path);
				
				String pathServer = messageSource.getMessage("evenement.path.image", null, null);
				List<ImageEvenement> imgToDelete = new ArrayList<ImageEvenement>();
				for (ImageEvenement img : evt.getImages()) {
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
				
				for (ImageEvenement img : imgToDelete) {
					logger.debug("Image à deleted : ");
					evt.getImages().remove(img);
				}
				
				if (evt.getAction() == 5) {
					List<ImageEvenement> listeToDelete = evenementService.getAllImageEvenement(String.valueOf(evt.getEveId()));
					logger.debug("ImgToDelete : " + ToStringBuilder.reflectionToString(listeToDelete));
					for (ImageEvenement img : listeToDelete) {
						boolean found = false;
						for (ImageEvenement img2 : evt.getImages()) {
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
					evenementService.updateEvenement(evt, lang);
				}
				else {
					logger.debug("Creation de la specificite dans les 2 langues.");
					evenementService.insertEvenement(evt, lang);
				}
				
				break;
			default:
				break;
		}
		

		return new ModelAndView(new RedirectView(this.getSuccessView()));
	}

	@Override
	protected ModelAndView showForm(HttpServletRequest request, HttpServletResponse response, BindException errors) throws Exception {
		logger.info("In showForm ModifEvenementController...");
		
		String lang = (String)request.getSession().getAttribute(WebConstants.LANGUE);
		
		Map<String, Object> model = new HashMap<String, Object>();
		this.referenceData(request);
		
		//cas update
		Evenement evt = (Evenement)request.getAttribute("command");
		
		logger.debug("Visu evt : " + ToStringBuilder.reflectionToString(evt));
		
		Evenement reel = new Evenement();
		if (evt.getAction() == 2 || evt.getAction() == 5)
			reel = evenementService.getEvenementById(String.valueOf(evt.getEveId()),lang);
		
		reel.setAction(evt.getAction());
		model.put("event", reel);
		
		if (reel.getAction() == 2)
			reel.setAction(5);
		if (reel.getAction() == 1)
			reel.setAction(4);

		logger.debug("Visu reel : " + ToStringBuilder.reflectionToString(reel));
		
		return new ModelAndView(this.getFormView(), model);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		
		logger.debug("In referenceData de ModifEvenementController");
		
		String lang = (String)request.getSession().getAttribute(WebConstants.LANGUE);
			
		//gestion liste de rubrique
		List<Rubrique> rubriques = rubriqueService.getRubriquesListWithInvisible(lang, 15);
		List<Rubrique> rubriques2 = rubriqueService.getRubriquesListWithInvisible(lang, 16);
		request.setAttribute("listeRubrique", rubriques);
		request.setAttribute("listeRubrique2", rubriques2);
		
		return super.referenceData(request);
	}
	
	public void setMessageSource(ResourceBundleMessageSource messageSource) {
		this.messageSource = messageSource;
	}

	public void setEvenementService(EvenementService evenementService) {
		this.evenementService = evenementService;
	}

	public void setRubriqueService(RubriqueService rubriqueService) {
		this.rubriqueService = rubriqueService;
	}
}
