package fr.the2d2a.service.impl;

import java.util.List;

import org.springframework.dao.DataAccessException;

import fr.the2d2a.bean.Artiste;
import fr.the2d2a.dao.EditeurDao;
import fr.the2d2a.exception.FonctionalException;
import fr.the2d2a.exception.TechnicalException;
import fr.the2d2a.service.EditeurService;

public class EditeurServiceImpl implements EditeurService {
	
	private EditeurDao dao;

	public void setDao(EditeurDao dao) {
		this.dao = dao;
	}


	public List<Artiste> getAllEditeurByLang(String lang) throws TechnicalException,
			FonctionalException {
		return dao.getAllEditeurByLang(lang);
	}
	
	public Artiste getEditeurByNameAndLang(String lang, String prenom, String nom) throws TechnicalException, FonctionalException {
		Artiste artiste = null;
		try {
			artiste = dao.getEditeurByNameAndLang(lang, prenom, nom);
			if (artiste == null) {
				throw new FonctionalException();
			}
		} catch(DataAccessException e) {
			throw new TechnicalException(e);
		}
		return artiste;
	}
}
