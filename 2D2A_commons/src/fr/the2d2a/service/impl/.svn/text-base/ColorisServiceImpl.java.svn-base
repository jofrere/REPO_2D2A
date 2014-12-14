package fr.the2d2a.service.impl;

import java.util.List;

import fr.the2d2a.bean.Coloris;
import fr.the2d2a.dao.ColorisDao;
import fr.the2d2a.exception.FonctionalException;
import fr.the2d2a.exception.TechnicalException;
import fr.the2d2a.service.ColorisService;

public class ColorisServiceImpl implements ColorisService {

	private ColorisDao dao;

	public List<Coloris> getAllColoris() throws TechnicalException, FonctionalException {
		return dao.getAllColoris();
	}
	
	public void updateColoris(Coloris coloris) throws TechnicalException, FonctionalException {
		dao.updateColoris(coloris);
	}
	
	public void insertColoris(Coloris coloris) throws TechnicalException, FonctionalException {
		dao.insertColoris(coloris);
	}
	
	public void deleteColoris(int id) throws TechnicalException, FonctionalException {
		dao.deleteColoris(id);
	}
	
	public void setDao(ColorisDao dao) {
		this.dao = dao;
	}
}
