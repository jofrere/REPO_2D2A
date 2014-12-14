package fr.the2d2a.service;

import java.util.List;

import fr.the2d2a.bean.Rubrique;
import fr.the2d2a.exception.FonctionalException;
import fr.the2d2a.exception.TechnicalException;

public interface RubriqueService {

	public List<Rubrique> getRubriquesListFromParentId(String lang, int level) throws FonctionalException, TechnicalException ;
	
	public List<Rubrique> getAllRubriques(String lang) throws FonctionalException, TechnicalException ;
	
	public Rubrique getRubriqueById(String lang, int id) throws FonctionalException, TechnicalException ;
	
	public List<Rubrique> getRubriquesByProduitId(String lang, int id) throws FonctionalException, TechnicalException ;
	
	public List<Rubrique> getRubriquesListWithInvisible(String lang, int level) throws FonctionalException, TechnicalException ;
	
	public String getRubriqueIdByFriendlyNameForAccueil(String lang, String friendlyName) throws FonctionalException, TechnicalException ;
	
	public void updateRubrique(Rubrique rubrique) throws TechnicalException;
	
	public void insertRubrique(Rubrique rubrique) throws TechnicalException;
	
	public void deleteRubrique(int id) throws TechnicalException;
}
