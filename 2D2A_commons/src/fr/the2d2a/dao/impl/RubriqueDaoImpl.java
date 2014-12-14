package fr.the2d2a.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import fr.the2d2a.bean.Rubrique;
import fr.the2d2a.dao.RubriqueDao;

public class RubriqueDaoImpl extends SqlMapClientDaoSupport implements RubriqueDao {

	protected final Logger logger = Logger.getLogger(RubriqueDaoImpl.class);

        
    @SuppressWarnings("unchecked")
	public List<Rubrique> getRubriquesListFromParentId(String lang, int level) throws DataAccessException {
        logger.info("Getting rubriques en " + lang);
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map map = new HashMap<String, Object>();
        map.put("lang", lang);
        map.put("rub_rubId", level);
        return (List<Rubrique>)template.queryForList("selectAllRubriquesFromParent", map);        
    }
    
    @SuppressWarnings("unchecked")
	public List<Rubrique> getRubriquesListWithInvisible(String lang, int level) throws DataAccessException {
    	logger.info("Getting rubriques en " + lang);
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("lang", lang);
        map.put("rub_rubId", level);
        return (List<Rubrique>)template.queryForList("selectAllRubriquesFromParentWithInvisible", map);
    }
    
	@SuppressWarnings("unchecked")
	public List<Rubrique> getAllRubriques(String lang) throws DataAccessException {
        logger.info("Getting rubriques en " + lang);
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("lang", lang);
        List<Rubrique> liste = (List<Rubrique>)template.queryForList("selectAllRubriques", map);        
        return liste;        
    }
	
	public Rubrique getRubriqueById(String lang, int id) throws DataAccessException {
        logger.info("Getting rubriques en " + lang);
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("lang", lang);
        map.put("rubId", id);
        Rubrique rub = (Rubrique)template.queryForObject("getRubriqueById", map);        
        return rub;
    }
	
	public String getRubriqueIdByFriendlyNameForAccueil(String lang, String friendlyName) throws DataAccessException {
		logger.info("Getting rubId en " + lang);
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("lang", lang);
        map.put("friendlyName", friendlyName);
        String rubId = null;
        Integer id = (Integer)template.queryForObject("getRubriqueIdByFriendlyNameForAccueil", map);
        if (id != null) {
        	rubId = id.toString();
        }
        return rubId;
	}

	@SuppressWarnings("unchecked")
	public List<Rubrique> getRubriquesByProduitId(String lang, int id) throws DataAccessException {
		logger.info("Getting rubriques en " + lang + " pour le produit " + id);
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("lang", lang);
        map.put("proId", id);
        List<Rubrique> liste = (List<Rubrique>)template.queryForList("selectAllRubriquesByProductId", map);        
        return liste;   
	}
    
	public void updateRubrique(Rubrique rubrique) throws DataAccessException {
		logger.debug("Updating Rubrique d'id: " + rubrique.getRubId());
		SqlMapClientTemplate template = getSqlMapClientTemplate();
		int nbRows = template.update("updateRubrique", rubrique);
		logger.debug(nbRows + " updated");
	}
	
	@Transactional
	public void insertRubrique(Rubrique rubrique) throws DataAccessException {
		logger.debug("Insertion d'une rubrique ");
		SqlMapClientTemplate template = getSqlMapClientTemplate();
		int id = (Integer)template.insert("insertRubrique", rubrique);
		logger.debug("Visu de l'id " + id);
		rubrique.setRubId(id);
		template.insert("insertRubriqueLangue", rubrique);
		if (rubrique.getLang().equals("FR"))
			rubrique.setLang("EN");
		else
			rubrique.setLang("FR");
		template.insert("insertRubriqueLangue", rubrique);
	}
	
	@Transactional
	public void deleteRubrique(int id) throws DataAccessException {
		logger.debug("Suppression d'une rubrique " + id);
		SqlMapClientTemplate template = getSqlMapClientTemplate();
		Map<String, Object> map = new HashMap<String, Object>();
        map.put("rubId", id);
        //pas besoin si base nickel avec delelete on cascade
//		int nbRows = template.delete("deleteRubriqueLangueById", map);
//		logger.debug(nbRows + " deleted pour les langues");
//		nbRows = template.delete("deleteRubriqueProduitById", map);
//		logger.debug(nbRows + " deleted pour les produits");
		int nbRows = template.delete("deleteRubrique", map);
		logger.debug(nbRows + " deleted pour la rubrique");
	}
}
