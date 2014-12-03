package fr.the2d2a.web.validator;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.validator.EmailValidator;
import org.apache.log4j.Logger;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import fr.the2d2a.bean.ServiceGeneral;

public class ServiceGeneralValidator implements Validator {

	private static Logger logger = Logger.getLogger(ServiceGeneralValidator.class);
	
	@SuppressWarnings("unchecked")
	public boolean supports(Class clazz) {
		return ServiceGeneral.class.equals(clazz);
	}
	
	public void validate(Object obj, Errors errors) {
		
		logger.debug("In validate");
		
		this.validateIdentity(obj, errors);
	}
	
	public void validateIdentity(Object obj, Errors errors) {
		ServiceGeneral service = (ServiceGeneral) obj;
		
		if (StringUtils.isEmpty(service.getObjetDemandeStr()) || StringUtils.isBlank(service.getObjetDemandeStr())) {
			errors.rejectValue("objetDemandeStr", "service.error.objetDemande", null, null);
		} 
		
		if (StringUtils.isEmpty(service.getEmail()) || StringUtils.isBlank(service.getEmail())) {
			errors.rejectValue("email", "depot.error.mail", null, null);
		} else if (!EmailValidator.getInstance().isValid(service.getEmail())) {
			errors.rejectValue("email", "depot.error.mail.invalid", null, null);
		}
		
		if (StringUtils.isEmpty(service.getNom()) || StringUtils.isBlank(service.getNom())) {
			errors.rejectValue("nom", "depot.error.nom", null, null);
		}
		
		if (StringUtils.isEmpty(service.getPrenom()) || StringUtils.isBlank(service.getPrenom())) {
			errors.rejectValue("prenom", "depot.error.prenom", null, null);
		}
	}
}
