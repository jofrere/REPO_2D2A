package fr.the2d2a.web.validator;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.apache.log4j.Logger;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import fr.the2d2a.bean.Adresse;

public class MesAdressesValidator implements Validator {

	private static Logger logger = Logger.getLogger(MesAdressesValidator.class);
	
	@SuppressWarnings("unchecked")
	public boolean supports(Class clazz) {
		return Adresse.class.equals(clazz);
	}

	public void validate(Object obj, Errors errors) {
		
		logger.debug("In validate");
		Adresse adresse = (Adresse) obj;
		this.validateCoordonnees(adresse, errors);		
	}
	

	public void validateCoordonnees(Adresse adresse, Errors errors) {
		logger.debug("Avant erreur : " + ToStringBuilder.reflectionToString(adresse, ToStringStyle.MULTI_LINE_STYLE));
		if (StringUtils.isEmpty(adresse.getNomAdresse()) || StringUtils.isBlank(adresse.getNomAdresse()))
			errors.rejectValue("nomAdresse", "inscription.error.nomAdresse", null, null);
		
		if (adresse.getCivId() == 0)
			errors.rejectValue("civId", "inscription.error.civilite", null, null);
		
		if (StringUtils.isEmpty(adresse.getNom()) || StringUtils.isBlank(adresse.getNom()))
			errors.rejectValue("nom", "inscription.error.nom", null, null);
		
		if (StringUtils.isEmpty(adresse.getPrenom()) || StringUtils.isBlank(adresse.getPrenom()))
			errors.rejectValue("prenom", "inscription.error.prenom", null, null);
		
		if (StringUtils.isEmpty(adresse.getAdresse()) || StringUtils.isBlank(adresse.getAdresse()))
			errors.rejectValue("adresse", "inscription.error.adresse", null, null);
		
		if (StringUtils.isEmpty(adresse.getCodePostal()) || StringUtils.isBlank(adresse.getCodePostal()))
			errors.rejectValue("codePostal", "inscription.error.codePostal", null, null);
		else {
			if (!StringUtils.isNumeric(adresse.getCodePostal()))
				errors.rejectValue("codePostal", "inscription.error.codePostal.invalid", null, null);
		}
		
		if (StringUtils.isEmpty(adresse.getVille()) || StringUtils.isBlank(adresse.getVille()))
			errors.rejectValue("ville", "inscription.error.ville", null, null);
		
		if (adresse.getPayId() == 0)
			errors.rejectValue("payId", "inscription.error.pays", null, null);
	}	
}
