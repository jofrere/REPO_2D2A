package fr.the2d2a.service;

import java.util.List;

import fr.the2d2a.bean.Commande;
import fr.the2d2a.bean.ImageOuvrage;
import fr.the2d2a.bean.Ouvrage;
import fr.the2d2a.exception.TechnicalException;
import fr.the2d2a_bo.beanform.FilterOuvrageForm;

public interface OuvrageService {

	public List<Ouvrage> getAllOuvrage(String lang) throws TechnicalException;

	public Ouvrage getOuvrageById(String ouvId, String lang)
			throws TechnicalException;

	public void destockOuvrage(Commande maCommande) throws TechnicalException;

	public List<Ouvrage> getAllOuvrageWithFilter(String lang,
			FilterOuvrageForm filter) throws TechnicalException;
	
	public void insertOuvrage(Ouvrage ouv, String lang) throws TechnicalException;

	public void updateOuvrage(Ouvrage ouv, String lang) throws TechnicalException;
	
	public void deleteOuvrage(Ouvrage ouv) throws TechnicalException;
	
	public List<ImageOuvrage> getAllImageOuvrage(String ouvId) throws TechnicalException;
}
