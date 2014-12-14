package fr.the2d2a.service.impl;

import java.util.List;

import org.springframework.dao.DataAccessException;

import fr.the2d2a.bean.Accueil;
import fr.the2d2a.dao.AccueilDao;
import fr.the2d2a.exception.FonctionalException;
import fr.the2d2a.exception.TechnicalException;
import fr.the2d2a.service.AccueilService;


public class AccueilServiceImpl implements AccueilService {

	private AccueilDao dao;
	
	public Accueil getAccueilById(String lang, String id) throws TechnicalException, FonctionalException {
		Accueil accueil = null;
		try {
			accueil = dao.getAccueil(lang, id);
		} catch(DataAccessException e) {
			throw new TechnicalException(e);
		}
		if (accueil == null)
			throw new FonctionalException();
		return accueil;
	}

	public void updateAccueil(Accueil accueil) throws TechnicalException, FonctionalException {
		dao.updateAccueil(accueil);
	}
	
	public void setDao(AccueilDao dao) {
		this.dao = dao;
	}

	public List<Accueil> getAllAccueils(String lang) throws TechnicalException,
			FonctionalException {
		return dao.getAllAccueils(lang);
	}
}
