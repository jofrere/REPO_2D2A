package fr.the2d2a.service;

import java.util.List;

import fr.the2d2a.bean.FreeTemplate;
import fr.the2d2a.bean.ImageProduit;
import fr.the2d2a.bean.Mail;
import fr.the2d2a.exception.TechnicalException;

public interface MailService {

	public void sendMail(String adresseMail, Mail mail) throws TechnicalException;
	
	public void sendMailToAdmin(Mail mail) throws TechnicalException;
	
	public Mail getMail(String id, String lang) throws TechnicalException;
	
	public List<Mail> getAllMails(String lang) throws TechnicalException;
	
	public void updateMailById(Mail mail, String lang) throws TechnicalException;
	
	public String getConditionsGenerales(String lang, String id) throws TechnicalException;
	
	public List<FreeTemplate> getAllFreeTemplates(String lang) throws TechnicalException;
	
	public void updateConditionsGenerales(String lang, String contenu, String id) throws TechnicalException;
	
	public void sendMailToAdmin(Mail mail, List<ImageProduit> files) throws TechnicalException;
	
}
