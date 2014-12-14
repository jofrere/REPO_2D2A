package fr.the2d2a.service.impl;

import java.util.List;

import fr.the2d2a.bean.Pays;
import fr.the2d2a.dao.PaysDao;
import fr.the2d2a.exception.FonctionalException;
import fr.the2d2a.exception.TechnicalException;
import fr.the2d2a.service.PaysService;

public class PaysServiceImpl implements PaysService {
	
	private PaysDao dao;

	public void deletePays(int id) throws TechnicalException,
			FonctionalException {
		dao.deletePays(id);
	}

	public List<Pays> getAllPays() throws TechnicalException,
			FonctionalException {		
		return dao.getAllPays();
	}

	public void insertPays(Pays pays) throws TechnicalException,
			FonctionalException {
		dao.insertPays(pays);
	}

	public void updatePays(Pays pays) throws TechnicalException,
			FonctionalException {
		dao.updatePays(pays);
	}

	public void setDao(PaysDao dao) {
		this.dao = dao;
	}

}
