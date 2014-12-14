package fr.the2d2a.service.impl;

import java.util.List;

import fr.the2d2a.bean.Evenement;
import fr.the2d2a.bean.ImageEvenement;
import fr.the2d2a.bean.TypeEvenement;
import fr.the2d2a.beanform.EvenementForm;
import fr.the2d2a.dao.EvenementDao;
import fr.the2d2a.exception.TechnicalException;
import fr.the2d2a.service.EvenementService;
import fr.the2d2a_bo.beanform.FilterEvenementForm;

public class EvenementServiceImpl implements EvenementService {
	
	private EvenementDao dao;

	public List<Evenement> getEvenementByRubriqueId(String lang, String rubId) throws TechnicalException {
		return dao.getEvenementByRubriqueId(lang, rubId);
	}
	
	public List<String> getAllDepartement(String lang, String rubId) throws TechnicalException {
		return dao.getAllDepartement(lang, rubId);
	}
	
	public List<TypeEvenement> getAllType(String lang) throws TechnicalException {
		return dao.getAllType(lang);
	}
	
	public List<Evenement> getEvenementByRubriqueIdWithFilter(String lang, String rubId, EvenementForm evtForm) throws TechnicalException {
		return dao.getEvenementByRubriqueIdWithFilter(lang, rubId, evtForm);
	}
	
	public List<Evenement> getAllEvenements(String lang) throws TechnicalException {
		return dao.getAllEvenements(lang);
	}
	
	public Evenement getEvenementById(String id, String lang) throws TechnicalException {
		return dao.getEvenementById(id, lang);
	}
	
	public List<ImageEvenement> getAllImageEvenement(String eveId) throws TechnicalException {
		return dao.getAllImageEvenement(eveId);
	}
	
	public List<Evenement> getAllEvenementWithFilter(String lang, FilterEvenementForm filter) throws TechnicalException {
		return dao.getAllEvenementWithFilter(lang, filter);
	}
	
	public void insertEvenement(Evenement evt, String lang) throws TechnicalException {
		dao.insertEvenement(evt, lang);
	}
	
	public void updateEvenement(Evenement evt, String lang) throws TechnicalException {
		dao.updateEvenement(evt, lang);
	}
	
	public void deleteEvenement(Evenement evt) throws TechnicalException {
		dao.deleteEvenement(evt);
	}

	public void setDao(EvenementDao dao) {
		this.dao = dao;
	}
}
