package fr.the2d2a.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import fr.the2d2a.bean.Rubrique;

public interface RubriqueDao {

	public List<Rubrique> getRubriquesListFromParentId(String lang, int level) throws DataAccessException;
	
	public List<Rubrique> getAllRubriques(String lang) throws DataAccessException;
	
	public Rubrique getRubriqueById(String lang, int id) throws DataAccessException;
	
	public String getRubriqueIdByFriendlyNameForAccueil(String lang, String friendlyName) throws DataAccessException;
	
	public List<Rubrique> getRubriquesByProduitId(String lang, int id) throws DataAccessException;
	
	public List<Rubrique> getRubriquesListWithInvisible(String lang, int level) throws DataAccessException;
	
	public void updateRubrique(Rubrique rubrique) throws DataAccessException;
	
	public void insertRubrique(Rubrique rubrique) throws DataAccessException;
	
	public void deleteRubrique(int id) throws DataAccessException;
}
