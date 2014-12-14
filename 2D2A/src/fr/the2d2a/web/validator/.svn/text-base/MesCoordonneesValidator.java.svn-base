package fr.the2d2a.web.validator;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.validator.EmailValidator;
import org.apache.log4j.Logger;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import fr.the2d2a.bean.Adresse;
import fr.the2d2a.bean.Filleul;
import fr.the2d2a.bean.Membre;

public class MesCoordonneesValidator implements Validator {

	private static Logger logger = Logger.getLogger(MesCoordonneesValidator.class);
	
	@SuppressWarnings("unchecked")
	public boolean supports(Class clazz) {
		return Membre.class.equals(clazz);
	}

	public void validate(Object obj, Errors errors) {
		
		logger.debug("In validate");
		Membre membre = (Membre) obj;
		if (membre.getAction() == 0) {
			this.validateCivility(obj, errors);
			this.validateCoordonnees(obj, errors);
			this.validateIdentifiant(obj, errors);
			this.validateFilleuls(obj, errors);
		}
	}
	
	public void validateCivility(Object obj, Errors errors) {
		Membre membre = (Membre) obj;
				
		if (membre.getCivId() == 0)
			errors.rejectValue("civId", "inscription.error.civilite", null, null);
		
		if (StringUtils.isEmpty(membre.getNom()) || StringUtils.isBlank(membre.getNom()))
			errors.rejectValue("nom", "inscription.error.nom", null, null);
		
		if (StringUtils.isEmpty(membre.getPrenom()) || StringUtils.isBlank(membre.getPrenom()))
			errors.rejectValue("prenom", "inscription.error.prenom", null, null);
	}

	public void validateCoordonnees(Object obj, Errors errors) {
		Membre membre = (Membre) obj;
		
		Adresse adresse = membre.getAdresses().get(0);
		
		if (StringUtils.isEmpty(adresse.getAdresse()) || StringUtils.isBlank(adresse.getAdresse()))
			errors.rejectValue("adresses[0].adresse", "inscription.error.adresse", null, null);
		
		if (StringUtils.isEmpty(adresse.getCodePostal()) || StringUtils.isBlank(adresse.getCodePostal()))
			errors.rejectValue("adresses[0].codePostal", "inscription.error.codePostal", null, null);
		else {
			if (!StringUtils.isNumeric(adresse.getCodePostal()))
				errors.rejectValue("adresses[0].codePostal", "inscription.error.codePostal.invalid", null, null);
		}
		
		if (StringUtils.isEmpty(adresse.getVille()) || StringUtils.isBlank(adresse.getVille()))
			errors.rejectValue("adresses[0].ville", "inscription.error.ville", null, null);
		
		if (adresse.getPayId() == 0)
			errors.rejectValue("adresses[0].paysId", "inscription.error.pays", null, null);
	}

	public void validateIdentifiant(Object obj, Errors errors) {
		Membre membre = (Membre) obj;
		
		if ((!StringUtils.isEmpty(membre.getNewLogin())) && StringUtils.isEmpty(membre.getNewLoginConf()))
			errors.rejectValue("newLoginConf", "inscription.error.loginConf", null, null);
		else {
			if ((!StringUtils.isEmpty(membre.getNewLoginConf())) && StringUtils.isBlank(membre.getNewLogin()))
				errors.rejectValue("newLogin", "inscription.error.login", null, null);
		}
		if ((!StringUtils.isEmpty(membre.getNewLogin())) && !StringUtils.isBlank(membre.getNewLoginConf())) {
			if (!EmailValidator.getInstance().isValid(membre.getNewLogin()))
				errors.rejectValue("newLogin", "inscription.error.login.invalid", null, null);
			else {
				if (!membre.getNewLogin().equals(membre.getNewLoginConf()))
					errors.rejectValue("newLoginConf", "inscription.error.loginConf.invalid", null, null);
			}
		}
		
		if ((!StringUtils.isEmpty(membre.getNewPassword())) && StringUtils.isEmpty(membre.getNewPasswordConf()))
			errors.rejectValue("newPasswordConf", "inscription.error.passwordConf", null, null);
		else {
			if ((!StringUtils.isEmpty(membre.getNewPasswordConf())) && StringUtils.isBlank(membre.getNewPassword()))
				errors.rejectValue("newPassword", "inscription.error.password", null, null);
		}
		if ((!StringUtils.isEmpty(membre.getNewPassword())) && !StringUtils.isBlank(membre.getNewPasswordConf())) {
			if (!membre.getNewPassword().equals(membre.getNewPasswordConf()))
				errors.rejectValue("newPasswordConf", "inscription.error.passwordConf.invalid", null, null);
		}
	}
	
	public void validateFilleuls(Object obj, Errors errors) {
		Membre membre = (Membre) obj;
		
		int nbFilleul = 0;
		for (Filleul filleul : membre.getFilleuls()) {
			if (StringUtils.isNotEmpty(filleul.getMail())) {
				if (!EmailValidator.getInstance().isValid(filleul.getMail()))
					errors.rejectValue("filleuls["+nbFilleul+"].mail", "inscription.error.filleul.invalid", null, null);
			}
			nbFilleul++;
		}
	}
}
