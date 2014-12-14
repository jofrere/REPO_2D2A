package fr.the2d2a.service;

import java.util.List;

import fr.the2d2a.bean.Accueil;
import fr.the2d2a.exception.FonctionalException;
import fr.the2d2a.exception.TechnicalException;

public interface AccueilService {

	public Accueil getAccueilById(String lang, String id) throws TechnicalException, FonctionalException;
	
	public List<Accueil> getAllAccueils(String lang) throws TechnicalException, FonctionalException;
	
	public void updateAccueil(Accueil accueil) throws TechnicalException, FonctionalException;
}
