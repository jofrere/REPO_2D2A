package fr.the2d2a.service;

import java.math.BigInteger;
import java.util.List;

import org.springframework.dao.DataAccessException;

import fr.the2d2a.bean.Adresse;
import fr.the2d2a.bean.Civilite;
import fr.the2d2a.bean.Membre;
import fr.the2d2a.bean.Pays;
import fr.the2d2a.bean.Profession;
import fr.the2d2a.exception.FonctionalException;
import fr.the2d2a.exception.TechnicalException;
import fr.the2d2a_bo.beanform.FilterMembreForm;

public interface MembreService {

	public List<Civilite> getAllCivilite(String lang) throws TechnicalException;
	
	public List<Profession> getAllProfession(String lang) throws TechnicalException;
	public void updateProfession(Profession profession) throws TechnicalException, FonctionalException;
	public void insertProfession(Profession profession) throws TechnicalException, FonctionalException;
	public void deleteProfession(int id) throws TechnicalException, FonctionalException; 
	
	public List<Pays> getAllPays(String lang) throws TechnicalException;
	
	public void insertMembre(Membre membre) throws FonctionalException, TechnicalException;
	
	public void activateMember(String id, BigInteger dateInscription) throws FonctionalException, TechnicalException;
	
	public Membre authenticateMember(String login, String password, String lang) throws FonctionalException, TechnicalException;
	
	public Civilite getCiviliteByMembreId(String lang, String id) throws TechnicalException;
	
	public Membre getMembreById(String lang, String id) throws TechnicalException;
	
	public Membre getMembreByLogin(String lang, String login) throws FonctionalException, TechnicalException;
	
	public void updateMembre(Membre membre) throws FonctionalException, TechnicalException;
	
	public void insertAdresse(Adresse adresse) throws TechnicalException;
	
	public Adresse getAdresseById(String id) throws TechnicalException;
	
	public void updateAdresse(Adresse adresse) throws TechnicalException;
	
	public void deleteAdresse(String id) throws TechnicalException;
	
	public void desinscription(String id) throws TechnicalException;
	
	public List<Membre> getAllMembres() throws TechnicalException;
	
	public List<Membre> getAllMembresWithFilter(FilterMembreForm filter) throws TechnicalException;
	
	public Membre getMembreByIdBO(String lang, String id) throws DataAccessException;
}
