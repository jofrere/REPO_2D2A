package fr.the2d2a.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import fr.the2d2a.bean.ImageOuvrage;
import fr.the2d2a.bean.Ouvrage;
import fr.the2d2a_bo.beanform.FilterOuvrageForm;

public interface OuvrageDao {
	
	public List<Ouvrage> getAllOuvrage(String lang) throws DataAccessException;

	public Ouvrage getOuvrageById(String ouvId, String lang) throws DataAccessException;
	
	public void destockOuvrage(Ouvrage ouvrage) throws DataAccessException;
	
	public List<Ouvrage> getAllOuvrageWithFilter(String lang, FilterOuvrageForm filter) throws DataAccessException;
	
	public void insertOuvrage(Ouvrage ouv, String lang) throws DataAccessException;
	
	public void updateOuvrage(Ouvrage ouv, String lang) throws DataAccessException;
	
	public void deleteOuvrage(Ouvrage ouv) throws DataAccessException;
	
	public List<ImageOuvrage> getAllImageOuvrage(String ouvId) throws DataAccessException;
}
