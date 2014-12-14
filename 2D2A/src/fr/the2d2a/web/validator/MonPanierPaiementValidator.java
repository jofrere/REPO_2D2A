package fr.the2d2a.web.validator;

import org.apache.log4j.Logger;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import fr.the2d2a.bean.Banque;

public class MonPanierPaiementValidator implements Validator {

	private static Logger logger = Logger.getLogger(MonPanierPaiementValidator.class);
	
	@SuppressWarnings("unchecked")
	public boolean supports(Class clazz) {
		return Banque.class.equals(clazz);
	}

	public void validate(Object obj, Errors errors) {
		logger.debug("in validate");
	}
}
