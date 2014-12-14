package fr.the2d2a.service.impl;

import java.util.List;

import org.springframework.dao.DataAccessException;

import fr.the2d2a.bean.Artiste;
import fr.the2d2a.dao.DesignerDao;
import fr.the2d2a.exception.FonctionalException;
import fr.the2d2a.exception.TechnicalException;
import fr.the2d2a.service.DesignerService;

public class DesignerServiceImpl implements DesignerService {
	
	private DesignerDao dao;

	public List<Artiste> getAllDesignerByLang(String lang) throws TechnicalException, FonctionalException {
		return dao.getAllDesignerByLang(lang);
	}
	
	public Artiste getDesignerByNameAndLang(String lang, String prenom, String nom) throws TechnicalException, FonctionalException {
		Artiste artiste = null;
		try {
			artiste = dao.getDesignerByNameAndLang(lang, prenom, nom);
			if (artiste == null) {
				throw new FonctionalException();
			}
		} catch(DataAccessException e) {
			throw new TechnicalException(e);
		}
		return artiste;
	}
	
	public void setDao(DesignerDao dao) {
		this.dao = dao;
	}
}
