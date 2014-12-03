package fr.the2d2a.web.validator;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.validator.EmailValidator;
import org.apache.log4j.Logger;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import fr.the2d2a.bean.ServiceEvenement;

public class ServiceEvenementValidator implements Validator {

	private static Logger logger = Logger.getLogger(ServiceEvenementValidator.class);
	
	@SuppressWarnings("unchecked")
	public boolean supports(Class clazz) {
		return ServiceEvenement.class.equals(clazz);
	}
	
	public void validate(Object obj, Errors errors) {
		
		logger.debug("In validate");
		
		this.validateIdentity(obj, errors);
	}
	
	public void validateIdentity(Object obj, Errors errors) {
		ServiceEvenement service = (ServiceEvenement) obj;
		
		if (StringUtils.isEmpty(service.getObjetDemandeStr()) || StringUtils.isBlank(service.getObjetDemandeStr())) {
			errors.rejectValue("objetDemandeStr", "service.error.objetDemande", null, null);
		} 
		
		if (StringUtils.isEmpty(service.getEmail()) || StringUtils.isBlank(service.getEmail())) {
			errors.rejectValue("email", "depot.error.mail", null, null);
		} else if (!EmailValidator.getInstance().isValid(service.getEmail())) {
			errors.rejectValue("email", "depot.error.mail.invalid", null, null);
		}
	}
}
