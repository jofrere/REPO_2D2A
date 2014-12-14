package fr.the2d2a.web.validator;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.validator.EmailValidator;
import org.apache.log4j.Logger;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import fr.the2d2a.bean.Location;

public class LocationValidator implements Validator {

	private static Logger logger = Logger.getLogger(LocationValidator.class);
	
	@SuppressWarnings("unchecked")
	public boolean supports(Class clazz) {
		return Location.class.equals(clazz);
	}
	
	public void validate(Object obj, Errors errors) {
		
		logger.debug("In validate");
		
		this.validateIdentity(obj, errors);
		
	}
	
	public void validateIdentity(Object obj, Errors errors) {
		Location location = (Location) obj;
		
		if (StringUtils.isEmpty(location.getEmail()) || StringUtils.isBlank(location.getEmail())) {
			errors.rejectValue("email", "depot.error.mail", null, null);
		} else if (!EmailValidator.getInstance().isValid(location.getEmail())) {
			errors.rejectValue("email", "depot.error.mail.invalid", null, null);
		}
		
		if (location.getCivId() == 0) {
			errors.rejectValue("civId", "inscription.error.civilite", null, null);
		}
		
		if (StringUtils.isEmpty(location.getNom()) || StringUtils.isBlank(location.getNom())) {
			errors.rejectValue("nom", "depot.error.nom", null, null);
		}
		
		if (StringUtils.isEmpty(location.getPrenom()) || StringUtils.isBlank(location.getPrenom())) {
			errors.rejectValue("prenom", "depot.error.prenom", null, null);
		}
	}
	
}
