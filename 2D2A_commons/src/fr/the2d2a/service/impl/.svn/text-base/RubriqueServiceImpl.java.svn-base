package fr.the2d2a.service.impl;

import java.util.List;

import org.springframework.dao.DataAccessException;

import fr.the2d2a.bean.Rubrique;
import fr.the2d2a.dao.RubriqueDao;
import fr.the2d2a.exception.FonctionalException;
import fr.the2d2a.exception.TechnicalException;
import fr.the2d2a.service.RubriqueService;

public class RubriqueServiceImpl implements RubriqueService {

	private RubriqueDao dao;

	public void setDao(RubriqueDao dao) {
		this.dao = dao;
	}
	
	public List<Rubrique> getRubriquesListFromParentId(String lang, int level) throws FonctionalException, TechnicalException {
		List<Rubrique> liste;
		try {
			liste = dao.getRubriquesListFromParentId(lang, level);
		}
		catch(DataAccessException e) {
			throw new TechnicalException(e);
		}
		
		if (liste == null || liste.size() == 0) 
			throw new FonctionalException();
		
		return liste;
	}
	
	public List<Rubrique> getRubriquesListWithInvisible(String lang, int level) throws FonctionalException, TechnicalException {
		List<Rubrique> liste;
		try {
			liste = dao.getRubriquesListWithInvisible(lang, level);
		}
		catch(DataAccessException e) {
			throw new TechnicalException(e);
		}
		
		if (liste == null || liste.size() == 0) 
			throw new FonctionalException();
		
		return liste;
	}
	
	public List<Rubrique> getAllRubriques(String lang) throws FonctionalException, TechnicalException  {
		return dao.getAllRubriques(lang);
	}
	
	public Rubrique getRubriqueById(String lang, int id) throws FonctionalException, TechnicalException {
		Rubrique rub = null;
		try {
			rub = dao.getRubriqueById(lang, id);
		}
		catch(DataAccessException e) {
			throw new TechnicalException(e);
		}
		return rub;
	}
	
	public String getRubriqueIdByFriendlyNameForAccueil(String lang, String friendlyName) throws FonctionalException, TechnicalException {
		return dao.getRubriqueIdByFriendlyNameForAccueil(lang, friendlyName);
	}
	
	public List<Rubrique> getRubriquesByProduitId(String lang, int id) throws FonctionalException, TechnicalException  {
		return dao.getRubriquesByProduitId(lang, id);
	}
	
	public void updateRubrique(Rubrique rubrique) throws TechnicalException {
		dao.updateRubrique(rubrique);
	}
	
	public void insertRubrique(Rubrique rubrique) throws TechnicalException {
		dao.insertRubrique(rubrique);
	}
	
	public void deleteRubrique(int id) throws TechnicalException {
		dao.deleteRubrique(id);
	}
}
