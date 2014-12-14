package fr.the2d2a.service;

import java.util.List;

import fr.the2d2a.bean.Evenement;
import fr.the2d2a.bean.ImageEvenement;
import fr.the2d2a.bean.TypeEvenement;
import fr.the2d2a.beanform.EvenementForm;
import fr.the2d2a.exception.TechnicalException;
import fr.the2d2a_bo.beanform.FilterEvenementForm;

public interface EvenementService {

	public List<Evenement> getEvenementByRubriqueId(String lang, String rubId) throws TechnicalException;
	
	public List<String> getAllDepartement(String lang, String rubId) throws TechnicalException;
	
	public List<TypeEvenement> getAllType(String lang) throws TechnicalException;
	
	public List<Evenement> getEvenementByRubriqueIdWithFilter(String lang, String rubId, EvenementForm evtForm) throws TechnicalException;
	
	public List<Evenement> getAllEvenements(String lang) throws TechnicalException;
	
	public Evenement getEvenementById(String id, String lang) throws TechnicalException;
	
	public List<ImageEvenement> getAllImageEvenement(String eveId) throws TechnicalException;
	
	public List<Evenement> getAllEvenementWithFilter(String lang, FilterEvenementForm filter) throws TechnicalException;
	
	public void insertEvenement(Evenement evt, String lang) throws TechnicalException;
	
	public void updateEvenement(Evenement evt, String lang) throws TechnicalException;
	
	public void deleteEvenement(Evenement evt) throws TechnicalException;
}
