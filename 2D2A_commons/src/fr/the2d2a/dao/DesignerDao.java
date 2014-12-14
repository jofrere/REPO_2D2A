package fr.the2d2a.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import fr.the2d2a.bean.Artiste;

public interface DesignerDao {
	
	public List<Artiste> getAllDesignerByLang(String lang) throws DataAccessException;
	
	public Artiste getDesignerByNameAndLang(String lang, String prenom, String nom) throws DataAccessException;
}
