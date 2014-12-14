package fr.the2d2a.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import fr.the2d2a.bean.Accueil;
import fr.the2d2a.dao.AccueilDao;

public class AccueilDaoImpl extends SqlMapClientDaoSupport implements AccueilDao {

	protected final Logger logger = Logger.getLogger(AccueilDaoImpl.class);
	
	public Accueil getAccueil(String lang, String id) throws DataAccessException {
		logger.debug("Getting Accueil en " + lang);
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("lang", lang);        
        map.put("id", id);
        Accueil accueil = (Accueil)template.queryForObject("getAccueilById", map);
        return accueil;
	}
	
	@SuppressWarnings("unchecked")
	public List<Accueil> getAllAccueils(String lang) throws DataAccessException {
		logger.debug("Getting Accueil en " + lang);
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("lang", lang);        
        List<Accueil> accueils = (List<Accueil>)template.queryForList("getAllAccueils", map);
//        for (Accueil acc : accueils) {
//        	acc.setLang(lang);
//        }
        return accueils;
	}
	
	@Transactional
	public void updateAccueil(Accueil accueil) throws DataAccessException {
		logger.debug("Updating Accueil");
		SqlMapClientTemplate template = getSqlMapClientTemplate();
		int nbRows = template.update("updateAccueil", accueil);
		logger.debug(nbRows + " updated");
	}
}
