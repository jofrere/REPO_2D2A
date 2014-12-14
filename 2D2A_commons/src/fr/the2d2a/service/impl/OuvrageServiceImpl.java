package fr.the2d2a.service.impl;

import java.util.List;

import org.apache.log4j.Logger;

import fr.the2d2a.bean.Commande;
import fr.the2d2a.bean.ImageOuvrage;
import fr.the2d2a.bean.Ouvrage;
import fr.the2d2a.dao.OuvrageDao;
import fr.the2d2a.exception.TechnicalException;
import fr.the2d2a.service.OuvrageService;
import fr.the2d2a_bo.beanform.FilterOuvrageForm;

public class OuvrageServiceImpl implements OuvrageService {

	private static Logger logger = Logger.getLogger(OuvrageServiceImpl.class);
	
	private OuvrageDao dao;
	
	public List<Ouvrage> getAllOuvrage(String lang) throws TechnicalException {
		logger.debug("Getting all ouvrages");
		return dao.getAllOuvrage(lang);
	}
	
	public Ouvrage getOuvrageById(String ouvId, String lang) throws TechnicalException {
		logger.debug("Getting 1 ouvrage");
		return dao.getOuvrageById(ouvId, lang);
	}

	public void setDao(OuvrageDao dao) {
		this.dao = dao;
	}

	public void destockOuvrage(Commande maCommande) throws TechnicalException {
		for (Ouvrage ouvrage : maCommande.getMonPanier().getMesOuvrages()) {
			dao.destockOuvrage(ouvrage);
		}
	}

	public List<Ouvrage> getAllOuvrageWithFilter(String lang,
			FilterOuvrageForm filter) throws TechnicalException {
		return dao.getAllOuvrageWithFilter(lang, filter);
	}
	
	public void insertOuvrage(Ouvrage ouv, String lang) throws TechnicalException {
		dao.insertOuvrage(ouv, lang);
	}
	
	public void updateOuvrage(Ouvrage ouv, String lang) throws TechnicalException {
		dao.updateOuvrage(ouv, lang);
	}
	
	public void deleteOuvrage(Ouvrage ouv) throws TechnicalException {
		dao.deleteOuvrage(ouv);
	}
	
	public List<ImageOuvrage> getAllImageOuvrage(String ouvId) throws TechnicalException {
		return dao.getAllImageOuvrage(ouvId);
	}
}
