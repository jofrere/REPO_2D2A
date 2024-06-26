package fr.the2d2a.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import fr.the2d2a.bean.Artiste;
import fr.the2d2a.dao.EditeurDao;

public class EditeurDaoImpl extends SqlMapClientDaoSupport implements EditeurDao {

	protected final Logger logger = Logger.getLogger(EditeurDaoImpl.class);

	@SuppressWarnings("unchecked")
	public List<Artiste> getAllEditeurByLang(String lang) throws DataAccessException {
		logger.info("Getting all Editeurs by lang : " + lang);
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, String> map = new HashMap<String, String>();
        map.put("lang", lang);
        List<Artiste> liste = (List<Artiste>)template.queryForList("getAllEditeurByLang", map);
        return liste;
	}
	
	public Artiste getEditeurByNameAndLang(String lang, String prenom, String nom) throws DataAccessException {
		logger.info("Getting Editeur by name : " + prenom + " " + nom + " and lang : " + lang);
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, String> map = new HashMap<String, String>();
        map.put("lang", lang);
        map.put("prenom", prenom);
        map.put("nom", nom);
        Artiste artiste = (Artiste)template.queryForObject("getEditeurByNameAndLang", map);
        logger.debug("Visu editeur : " + artiste);
        return artiste;
	}
}
