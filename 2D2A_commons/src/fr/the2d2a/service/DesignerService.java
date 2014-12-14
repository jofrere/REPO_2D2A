package fr.the2d2a.service;

import java.util.List;

import fr.the2d2a.bean.Artiste;
import fr.the2d2a.exception.FonctionalException;
import fr.the2d2a.exception.TechnicalException;

public interface DesignerService {

	public List<Artiste> getAllDesignerByLang(String lang) throws TechnicalException, FonctionalException;
	
	public Artiste getDesignerByNameAndLang(String lang, String prenom, String nom) throws TechnicalException, FonctionalException;
}
