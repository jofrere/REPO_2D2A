package fr.the2d2a.web.validator;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.validator.EmailValidator;
import org.apache.log4j.Logger;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import fr.the2d2a.bean.Adresse;
import fr.the2d2a.bean.Filleul;
import fr.the2d2a.bean.Membre;

public class InscriptionValidator implements Validator {

	private static Logger logger = Logger.getLogger(InscriptionValidator.class);
	
	@SuppressWarnings("unchecked")
	public boolean supports(Class clazz) {
		return Membre.class.equals(clazz);
	}

	public void validate(Object obj, Errors errors) {
		
		logger.debug("In validate");
		
		this.validateCivility(obj, errors);
		this.validateCoordonnees(obj, errors);
		this.validateIdentifiant(obj, errors);
		this.validateSecurity(obj, errors);
//		this.validateFilleuls(obj, errors);
	}
	
	public void validateCivility(Object obj, Errors errors) {
		Membre membre = (Membre) obj;
				
		if (membre.getCivId() == 0)
			errors.rejectValue("civId", "inscription.error.civilite", null, null);
		
		if (StringUtils.isEmpty(membre.getNom()) || StringUtils.isBlank(membre.getNom()))
			errors.rejectValue("nom", "inscription.error.nom", null, null);
		
		if (StringUtils.isEmpty(membre.getPrenom()) || StringUtils.isBlank(membre.getPrenom()))
			errors.rejectValue("prenom", "inscription.error.prenom", null, null);
		
		//traitement dNaiss
		if (!StringUtils.isEmpty(membre.getCalendar())) {
			try {
				SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
				Date d = sdf.parse(membre.getCalendar());
				Calendar c = Calendar.getInstance();
				c.setTime(d);
				membre.setJourNaiss(c.get(Calendar.DAY_OF_MONTH));
				membre.setMoisNaiss(c.get(Calendar.MONTH) + 1);
				membre.setAnneeNaiss(c.get(Calendar.YEAR));
			} catch(ParseException e) {
				errors.rejectValue("calendar", "inscription.error.dNaiss.invalid", null, null);
			}
		}
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
			errors.rejectValue("adresses[0].payId", "inscription.error.pays", null, null);
	}

	public void validateIdentifiant(Object obj, Errors errors) {
		Membre membre = (Membre) obj;
		
		if (StringUtils.isEmpty(membre.getLogin()) || StringUtils.isBlank(membre.getLogin()))
			errors.rejectValue("login", "inscription.error.login", null, null);
		else {
			if (!EmailValidator.getInstance().isValid(membre.getLogin()))
				errors.rejectValue("login", "inscription.error.login.invalid", null, null);
			else {
				if (StringUtils.isEmpty(membre.getLoginConf()) || StringUtils.isBlank(membre.getLoginConf()))
					errors.rejectValue("loginConf", "inscription.error.loginConf", null, null);
				else {
					if (!membre.getLogin().equals(membre.getLoginConf()))
						errors.rejectValue("loginConf", "inscription.error.loginConf.invalid", null, null);
				}
			}
		}
		
		if (StringUtils.isEmpty(membre.getPassword()) || StringUtils.isBlank(membre.getPassword()))
			errors.rejectValue("password", "inscription.error.password", null, null);
		else {
			if (StringUtils.isEmpty(membre.getPasswordConf()) || StringUtils.isBlank(membre.getPasswordConf()))
				errors.rejectValue("passwordConf", "inscription.error.passwordConf", null, null);
			else {
				if (!membre.getPassword().equals(membre.getPasswordConf()))
					errors.rejectValue("passwordConf", "inscription.error.passwordConf.invalid", null, null);
			}
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
	
	public void validateSecurity(Object obj, Errors errors) {
		Membre membre = (Membre) obj;
		
		if (StringUtils.isEmpty(membre.getCaptcha()) || StringUtils.isBlank(membre.getCaptcha()))
			errors.rejectValue("captcha", "inscription.error.captcha", null, null);
		
		if (membre.getAcceptation() == 0)
			errors.rejectValue("acceptation", "inscription.error.acceptation", null, null);
	}
}
