package fr.the2d2a_bo.web.validator;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import fr.the2d2a.bean.Produit;

public class ProduitValidator implements Validator {

	private Logger logger = Logger.getLogger(ProduitValidator.class);
	
	private Object currentCommand;
	
	@SuppressWarnings("unchecked")
	public boolean supports(Class clazz) {
		return Produit.class.equals(clazz);
	}

	public void validate(Object command, Errors errors) {
		Produit produit = (Produit)command;
		logger.info("Entree dans le validator");
		
		if (produit.getAction() == 4 || produit.getAction() == 5) {
		
			//ValidationUtils.rejectIfEmpty(errors, "nom", "produit.nom.obligatoire");
			if(StringUtils.isEmpty(produit.getNom())) {
				errors.rejectValue("nom", "produit.nom.obligatoire", null, null);
			}
			if(produit.getDesId() == 0) {
				errors.rejectValue("desId", "produit.designer.obligatoire", null, null);
			}
			if(produit.getEdiId() == 0) {
				errors.rejectValue("ediId", "produit.editor.obligatoire", null, null);
			}
			this.setCurrentCommand(command);
		}
	}

	public Object getCurrentCommand() {
		return currentCommand;
	}

	public void setCurrentCommand(Object currentCommand) {
		this.currentCommand = currentCommand;
	}


	
}
