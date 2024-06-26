package fr.the2d2a.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import fr.the2d2a.bean.SpecificiteProduit;
import fr.the2d2a.dao.SpecificiteDao;

public class SpecificiteDaoImpl extends SqlMapClientDaoSupport implements SpecificiteDao {

	protected final Logger logger = Logger.getLogger(SpecificiteDaoImpl.class);

	@Transactional
	@SuppressWarnings("unchecked")
	public List<SpecificiteProduit> getAllSpec() throws DataAccessException {
        logger.info("Getting all SpecificiteProduit");
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("lang", "FR");
        List<SpecificiteProduit> liste = (List<SpecificiteProduit>)template.queryForList("getAllSpec", map);
        SpecificiteProduit temp = null;
        for (SpecificiteProduit spec : liste) {
        	spec.setNom_FR(spec.getNom());
        	spec.setAbbr_FR(spec.getAbbr());
        	map.put("lang", "EN");
        	map.put("speId", spec.getSpeId());
        	temp = (SpecificiteProduit)template.queryForObject("getSpecById", map);
        	spec.setNom_EN(temp.getNom());
        	spec.setAbbr_EN(temp.getAbbr());
        }
        return liste;
    }
	
	@Transactional
	public void updateSpec(SpecificiteProduit spec) throws DataAccessException {
		logger.info("Updating Specificite d'id: " + spec.getSpeId());
		SqlMapClientTemplate template = getSqlMapClientTemplate();
		spec.setLang("FR");
		spec.setNom(spec.getNom_FR());
		spec.setAbbr(spec.getAbbr_FR());
		int nbRows = template.update("updateSpec", spec);
		logger.debug(nbRows + " updated en FR");
		spec.setLang("EN");
		spec.setNom(spec.getNom_EN());
		spec.setAbbr(spec.getAbbr_EN());
		nbRows = template.update("updateSpec", spec);
		logger.debug(nbRows + " updated en EN");
	}
	
	@Transactional
	public void insertSpec(SpecificiteProduit spec) throws DataAccessException {
		logger.info("Insertion d'une specificite " + ToStringBuilder.reflectionToString(spec));
		SqlMapClientTemplate template = getSqlMapClientTemplate();
		int id = (Integer)template.insert("insertSpec", spec);
		logger.debug("Visu de l'id " + id);
		spec.setSpeId(id);
		spec.setLang("FR");
		spec.setNom(spec.getNom_FR());
		spec.setAbbr(spec.getAbbr_FR());
		template.insert("insertSpecLangue", spec);
		spec.setLang("EN");
		spec.setNom(spec.getNom_EN());
		spec.setAbbr(spec.getAbbr_EN());
		template.insert("insertSpecLangue", spec);
	}
	
	@Transactional
	public void deleteSpec(int id) throws DataAccessException {
		logger.info("Suppression d'une specificite " + id);
		SqlMapClientTemplate template = getSqlMapClientTemplate();
		Map<String, Object> map = new HashMap<String, Object>();
        map.put("speId", id);
		int nbRows = template.delete("deleteSpecLangueById", map);
		logger.debug(nbRows + " deleted pour les langues");
		nbRows = template.delete("deleteSpecProduitById", map);
		logger.debug(nbRows + " deleted pour les produits");
		nbRows = template.delete("deleteSpecById", map);
		logger.debug(nbRows + " deleted pour la specificite");
	}
}
