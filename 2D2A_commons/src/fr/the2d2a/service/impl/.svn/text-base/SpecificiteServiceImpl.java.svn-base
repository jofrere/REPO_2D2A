package fr.the2d2a.service.impl;

import java.util.List;

import fr.the2d2a.bean.SpecificiteProduit;
import fr.the2d2a.dao.SpecificiteDao;
import fr.the2d2a.exception.FonctionalException;
import fr.the2d2a.exception.TechnicalException;
import fr.the2d2a.service.SpecificiteService;

public class SpecificiteServiceImpl implements SpecificiteService {

	private SpecificiteDao dao;

	public void setDao(SpecificiteDao dao) {
		this.dao = dao;
	}
	
	public List<SpecificiteProduit> getAllSpec() throws TechnicalException, FonctionalException {
		return dao.getAllSpec();
	}

	public void updateSpec(SpecificiteProduit spec) throws TechnicalException, FonctionalException {
		dao.updateSpec(spec);
	}
	
	public void insertSpec(SpecificiteProduit spec) throws TechnicalException, FonctionalException {
		dao.insertSpec(spec);
	}
	
	public void deleteSpec(int id) throws TechnicalException, FonctionalException {
		dao.deleteSpec(id);
	}
}
