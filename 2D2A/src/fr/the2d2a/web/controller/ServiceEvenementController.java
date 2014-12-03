package fr.the2d2a.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.log4j.Logger;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.validation.BindException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import fr.the2d2a.bean.ImageProduit;
import fr.the2d2a.bean.Mail;
import fr.the2d2a.bean.ServiceEvenement;
import fr.the2d2a.exception.TechnicalException;
import fr.the2d2a.service.MailService;
import fr.the2d2a.utils.FileHelper;
import fr.the2d2a.web.constants.ParamConstants;
import fr.the2d2a.web.constants.WebConstants;

public class ServiceEvenementController extends SimpleFormController {

	private static Logger logger = Logger.getLogger(ServiceEvenementController.class);

	private MailService mailService;
	private ResourceBundleMessageSource messageSource;
	
	@SuppressWarnings("unchecked")
	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		
		logger.debug("In onSubmit de ServiceEvenementController");
		
		ServiceEvenement serviceEvt = (ServiceEvenement)command;
		
		logger.info("Visu demande de service : " + ToStringBuilder.reflectionToString(serviceEvt));
			
		String lang = (String)request.getSession().getAttribute(WebConstants.LANGUE);
		
		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
		final Map<Object, MultipartFile> files = multiRequest.getFileMap();
        
        
        //Gestion du path des images sur le disque
		Locale locale = null;
		if (lang.equals(WebConstants.LANGUE_FR)) {
			locale = Locale.FRENCH;
		} else {
			locale = Locale.ENGLISH;
		}
		String path = messageSource.getMessage("service.general.path.contribution.fichier", null, locale);
		logger.debug("Visu du path : " + path);
		
		List<ImageProduit> filesToSend = new ArrayList<ImageProduit>();
		for (MultipartFile file : files.values()) {
			if (file != null && !file.isEmpty()) {
				logger.info("Visu image : " + file.getOriginalFilename());
				//Gestion des images
				String newPhotoFileName = FileHelper.manageUploadedImageFile(file, null, path, "");
				ImageProduit img = new ImageProduit();
				img.setPhoto(path + newPhotoFileName);
				img.setPhotoFile(file);
				filesToSend.add(img);
			}
		}
		serviceEvt.setFiles(filesToSend);
		
		try {
			Mail mail = mailService.getMail(ParamConstants.MAIL_FORM_EVE_ID, lang);
			this.manageMail(mail, serviceEvt, lang);
			mailService.sendMailToAdmin(mail, filesToSend);
			for (ImageProduit img : filesToSend) {
				FileHelper.deleteFile(img.getPhoto());
			}
			
		} catch (TechnicalException e) {
			e.printStackTrace();
			//TODO : enlever ce catch et gérer les technicals dans les pages (error 500 custo)
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("service", serviceEvt);
		
		return new ModelAndView(this.getSuccessView(), model);
	}
	
	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		logger.debug("In formBackingObject");
		return new ServiceEvenement();
	}
	
	private void manageMail(Mail mail, ServiceEvenement serviceEvt, String lang) {
		String contenu = mail.getContenu();
		
		// données Pros
		contenu = contenu.replace("$organisationPro", serviceEvt.getOrganisationPro());
		contenu = contenu.replace("$adressePro", serviceEvt.getAdressePro());
		contenu = contenu.replace("$complAdressePro", serviceEvt.getComplementAdressePro());
		contenu = contenu.replace("$villePro", serviceEvt.getVillePro());
		contenu = contenu.replace("$codePostalPro", serviceEvt.getCodePostalPro());
		contenu = contenu.replace("$telPro", serviceEvt.getTelPro());
		contenu = contenu.replace("$faxPro", serviceEvt.getFaxPro());
		contenu = contenu.replace("$sitePro", serviceEvt.getSitePro());
		contenu = contenu.replace("$sadresser", serviceEvt.getSadresserPro());
		contenu = contenu.replace("$direction", serviceEvt.getDirectionPro());
		
		contenu = contenu.replace("$adresse", serviceEvt.getAdresse());
		contenu = contenu.replace("$lieu", serviceEvt.getLieu());
		contenu = contenu.replace("$ville", serviceEvt.getVille());
		contenu = contenu.replace("$departement", serviceEvt.getDepartement());

				
		contenu = contenu.replace("$demande", serviceEvt.getObjetDemandeStr());
		contenu = contenu.replace("$titre", serviceEvt.getTitre());
		contenu = contenu.replace("$dateDebut", serviceEvt.getDateDebut());
		contenu = contenu.replace("$dateFin", serviceEvt.getDateFin());
		contenu = contenu.replace("$horaire", serviceEvt.getHoraire());
		contenu = contenu.replace("$designationInfo", serviceEvt.getDesignationInfo());
		contenu = contenu.replace("$description", serviceEvt.getDescription());
		contenu = contenu.replace("$theme", serviceEvt.getTheme());
		contenu = contenu.replace("$tel", serviceEvt.getTel());
		contenu = contenu.replace("$fax", serviceEvt.getFax());
		contenu = contenu.replace("$website", serviceEvt.getTel());
		contenu = contenu.replace("$email", serviceEvt.getEmail());
		contenu = contenu.replace("$prix", String.valueOf(serviceEvt.getPrix()));
		
		mail.setContenu(contenu);
	}

	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}

	public void setMessageSource(ResourceBundleMessageSource messageSource) {
		this.messageSource = messageSource;
	}
}
