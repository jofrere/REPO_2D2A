package fr.the2d2a.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import fr.the2d2a.bean.FreeTemplate;
import fr.the2d2a.bean.Mail;
import fr.the2d2a.dao.MailDao;

public class MailDaoImpl extends SqlMapClientDaoSupport implements MailDao {

	protected final Logger logger = Logger.getLogger(MailDaoImpl.class);

	public Mail getMail(String id, String lang) throws DataAccessException {
		logger.info("Getting a mail");
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("lang", lang);
        map.put("maiId", id);
        Mail mail = (Mail)template.queryForObject("getMail", map);
        return mail;
	}
	
	@SuppressWarnings("unchecked")
	public List<Mail> getAllMails(String lang) throws DataAccessException {
		logger.info("Getting all mails");
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("lang", lang);
        List<Mail> mails = (List<Mail>)template.queryForList("getAllMails", map);
        return mails;
	}
	
	public void updateMailById(Mail mail, String lang) throws DataAccessException {
		logger.debug("Updating Mail d'id: " + mail.getMaiId());
		mail.setLang(lang);
		SqlMapClientTemplate template = getSqlMapClientTemplate();
		int nbRows = template.update("updateMailById", mail);
		logger.debug(nbRows + " updated");
	}
	
	public String getConditionsGenerales(String lang, String id) throws DataAccessException {
		logger.info("Getting conditions generales");
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("lang", lang);
        map.put("conId", id);
        String contenu = (String)template.queryForObject("getConditionsGenerales", map);
        return contenu;
	}
	
	@SuppressWarnings("unchecked")
	public List<FreeTemplate> getAllFreeTemplates(String lang) throws DataAccessException {
		logger.info("Getting all free templates");
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("lang", lang);
        return (List<FreeTemplate>)template.queryForList("getAllFreeTemplates", map);
	}
	
	public void updateConditionsGenerales(String lang, String contenu, String id) throws DataAccessException {
		logger.debug("Updating conditions");
		SqlMapClientTemplate template = getSqlMapClientTemplate();
		Map<String, Object> map = new HashMap<String, Object>();
        map.put("lang", lang);
        map.put("contenu", contenu);
        map.put("conId", id);
		int nbRows = template.update("updateConditionsGenerales", map);
		logger.debug(nbRows + " updated");
	}
}
