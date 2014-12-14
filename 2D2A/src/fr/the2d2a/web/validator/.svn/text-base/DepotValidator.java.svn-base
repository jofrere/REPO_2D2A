package fr.the2d2a.web.validator;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.validator.EmailValidator;
import org.apache.log4j.Logger;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import fr.the2d2a.bean.Depot;

public class DepotValidator implements Validator {

	private static Logger logger = Logger.getLogger(DepotValidator.class);
	
	@SuppressWarnings("unchecked")
	public boolean supports(Class clazz) {
		return Depot.class.equals(clazz);
	}
	
	public void validate(Object obj, Errors errors) {
		
		logger.debug("In validate");
		
		this.validateIdentity(obj, errors);
		this.validateSecurity(obj, errors);
	}
	
	public void validateIdentity(Object obj, Errors errors) {
		Depot depot = (Depot) obj;
		
		if (StringUtils.isEmpty(depot.getEmail()) || StringUtils.isBlank(depot.getEmail())) {
			errors.rejectValue("email", "depot.error.mail", null, null);
		} else if (!EmailValidator.getInstance().isValid(depot.getEmail())) {
			errors.rejectValue("email", "depot.error.mail.invalid", null, null);
		}
		
		if (StringUtils.isEmpty(depot.getNom()) || StringUtils.isBlank(depot.getNom())) {
			errors.rejectValue("nom", "depot.error.nom", null, null);
		}
		
		if (StringUtils.isEmpty(depot.getPrenom()) || StringUtils.isBlank(depot.getPrenom())) {
			errors.rejectValue("prenom", "depot.error.prenom", null, null);
		}
	}
	
	public void validateSecurity(Object obj, Errors errors) {
		Depot depot = (Depot) obj;
		
		if (depot.getAcceptation() == 0) {
			errors.rejectValue("acceptation", "depot.error.acceptation", null, null);
		}
	}
}
