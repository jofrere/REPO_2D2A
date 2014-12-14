package fr.the2d2a.dao;

import java.math.BigInteger;
import java.util.List;

import org.springframework.dao.DataAccessException;

import fr.the2d2a.bean.Adresse;
import fr.the2d2a.bean.Civilite;
import fr.the2d2a.bean.Membre;
import fr.the2d2a.bean.Pays;
import fr.the2d2a.bean.Profession;
import fr.the2d2a_bo.beanform.FilterMembreForm;

public interface MembreDao {

	public List<Civilite> getAllCivilite(String lang) throws DataAccessException;
	
	public List<Profession> getAllProfession(String lang) throws DataAccessException;
	public List<Profession> getAllProfession() throws DataAccessException;
	public void updateProfession(Profession profession) throws DataAccessException;
	public void insertProfession(Profession profession) throws DataAccessException;
	public void deleteProfession(int id) throws DataAccessException;
	
	public List<Pays> getAllPays(String lang) throws DataAccessException;
	
	public int insertMembre(Membre membre) throws DataAccessException;
	
	public int activateMember(String id, BigInteger dateInscription) throws DataAccessException;
	
	public Membre authenticateMember(String login, String password, String lang) throws DataAccessException;
	
	public Civilite getCiviliteByMembreId(String lang, String id) throws DataAccessException;
	
	public Membre getMembreById(String lang, String id) throws DataAccessException;
	
	public Membre getMembreByLogin(String lang, String login) throws DataAccessException;
	
	public void updateMembre(Membre membre) throws DataAccessException;
	
	public void insertAdresse(Adresse adresse) throws DataAccessException;
	
	public Adresse getAdresseById(String id) throws DataAccessException;
	
	public void updateAdresse(Adresse adresse) throws DataAccessException;
	
	public void deleteAdresse(String id) throws DataAccessException;
	
	public void desinscription(String id) throws DataAccessException;
	
	public List<Membre> getAllMembres() throws DataAccessException;
	
	public List<Membre> getAllMembresWithFilter(FilterMembreForm filter) throws DataAccessException;
	
	public Membre getMembreByIdBO(String lang, String id) throws DataAccessException;
}
