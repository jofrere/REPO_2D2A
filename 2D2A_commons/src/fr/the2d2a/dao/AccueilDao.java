package fr.the2d2a.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import fr.the2d2a.bean.Accueil;

public interface AccueilDao {

	public Accueil getAccueil(String lang, String id) throws DataAccessException;
	
	public List<Accueil> getAllAccueils(String lang) throws DataAccessException;
	
	public void updateAccueil(Accueil accueil) throws DataAccessException;
}
