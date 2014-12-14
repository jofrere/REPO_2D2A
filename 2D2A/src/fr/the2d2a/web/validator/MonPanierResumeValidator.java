package fr.the2d2a.web.validator;

import org.apache.log4j.Logger;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import fr.the2d2a.bean.Commande;

public class MonPanierResumeValidator implements Validator {

	private static Logger logger = Logger.getLogger(MonPanierResumeValidator.class);
	
	@SuppressWarnings("unchecked")
	public boolean supports(Class clazz) {
		return Commande.class.equals(clazz);
	}

	public void validate(Object obj, Errors errors) {
		logger.debug("In validate");
		Commande cmd = (Commande) obj;
		
		if (cmd.getAcceptation() == 0) {
			errors.rejectValue("acceptation", "inscription.error.acceptation", null, null);
		}
	}
}
