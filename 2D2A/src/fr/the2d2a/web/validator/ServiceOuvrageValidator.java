package fr.the2d2a.web.validator;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.validator.EmailValidator;
import org.apache.log4j.Logger;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import fr.the2d2a.bean.ServiceOuvrage;

public class ServiceOuvrageValidator implements Validator {

	private static Logger logger = Logger.getLogger(ServiceOuvrageValidator.class);
	
	@SuppressWarnings("unchecked")
	public boolean supports(Class clazz) {
		return ServiceOuvrage.class.equals(clazz);
	}
	
	public void validate(Object obj, Errors errors) {
		
		logger.debug("In validate");
		
		this.validateIdentity(obj, errors);
	}
	
	public void validateIdentity(Object obj, Errors errors) {
		ServiceOuvrage service = (ServiceOuvrage) obj;
		
		if (StringUtils.isEmpty(service.getEmail()) || StringUtils.isBlank(service.getEmail())) {
			errors.rejectValue("email", "depot.error.mail", null, null);
		} else if (!EmailValidator.getInstance().isValid(service.getEmail())) {
			errors.rejectValue("email", "depot.error.mail.invalid", null, null);
		}
	}
}
