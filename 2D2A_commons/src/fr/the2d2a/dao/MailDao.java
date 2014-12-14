package fr.the2d2a.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import fr.the2d2a.bean.FreeTemplate;
import fr.the2d2a.bean.Mail;

public interface MailDao {

	public Mail getMail(String id, String lang) throws DataAccessException;
	
	public List<Mail> getAllMails(String lang) throws DataAccessException;
	
	public void updateMailById(Mail mail, String lang) throws DataAccessException;
	
	public String getConditionsGenerales(String lang, String id) throws DataAccessException;
	
	public List<FreeTemplate> getAllFreeTemplates(String lang) throws DataAccessException;
	
	public void updateConditionsGenerales(String lang, String contenu, String id) throws DataAccessException;
}
