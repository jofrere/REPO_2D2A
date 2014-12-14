package fr.the2d2a.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import fr.the2d2a.bean.Evenement;
import fr.the2d2a.bean.ImageEvenement;
import fr.the2d2a.bean.TypeEvenement;
import fr.the2d2a.beanform.EvenementForm;
import fr.the2d2a_bo.beanform.FilterEvenementForm;

public interface EvenementDao {

	public List<Evenement> getEvenementByRubriqueId(String lang, String rubId) throws DataAccessException;
	
	public List<String> getAllDepartement(String lang, String rubId) throws DataAccessException;
	
	public List<TypeEvenement> getAllType(String lang) throws DataAccessException;
	
	public List<Evenement> getEvenementByRubriqueIdWithFilter(String lang, String rubId, EvenementForm evtForm) throws DataAccessException;

	public List<Evenement> getAllEvenements(String lang) throws DataAccessException;
	
	public Evenement getEvenementById(String id, String lang) throws DataAccessException;
	
	public List<ImageEvenement> getAllImageEvenement(String eveId) throws DataAccessException;
	
	public List<Evenement> getAllEvenementWithFilter(String lang, FilterEvenementForm filter) throws DataAccessException;
	
	public void insertEvenement(Evenement evt, String lang) throws DataAccessException;
	
	public void updateEvenement(Evenement evt, String lang) throws DataAccessException;
	
	public void deleteEvenement(Evenement evt) throws DataAccessException;
}
