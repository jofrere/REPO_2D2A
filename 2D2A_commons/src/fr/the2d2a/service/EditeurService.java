package fr.the2d2a.service;

import java.util.List;

import fr.the2d2a.bean.Artiste;
import fr.the2d2a.exception.FonctionalException;
import fr.the2d2a.exception.TechnicalException;

public interface EditeurService {
	
	public List<Artiste> getAllEditeurByLang(String lang) throws TechnicalException, FonctionalException;
	
	public Artiste getEditeurByNameAndLang(String lang, String prenom, String nom) throws TechnicalException, FonctionalException;
}
