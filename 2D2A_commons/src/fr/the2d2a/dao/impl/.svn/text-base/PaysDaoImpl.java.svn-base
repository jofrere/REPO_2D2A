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

import fr.the2d2a.bean.Pays;
import fr.the2d2a.dao.PaysDao;

public class PaysDaoImpl extends SqlMapClientDaoSupport implements PaysDao {

	protected final Logger logger = Logger.getLogger(PaysDaoImpl.class);
	
	@Transactional
	public void deletePays(int id) throws DataAccessException {
		logger.info("Suppression d'un pays " + id);
		SqlMapClientTemplate template = getSqlMapClientTemplate();
		Map<String, Object> map = new HashMap<String, Object>();
        map.put("payId", id);
		int nbRows = template.delete("deletePaysLangueById", map);
		logger.debug(nbRows + " deleted pour les langues");
		nbRows = template.delete("deletePaysProduitById", map);
		logger.debug(nbRows + " deleted pour les produits");
		nbRows = template.delete("deletePaysById", map);
		logger.debug(nbRows + " deleted pour le pays");
	}

	@Transactional
	@SuppressWarnings("unchecked")
	public List<Pays> getAllPays() throws DataAccessException {
		logger.info("Getting all Pays");
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("lang", "FR");
        List<Pays> liste = (List<Pays>)template.queryForList("getAllPays", map);
        Pays temp = null;
        for (Pays pays : liste) {
        	pays.setNom_FR(pays.getNom());        	
        	map.put("lang", "EN");
        	map.put("payId", pays.getPayId());
        	temp = (Pays)template.queryForObject("getPaysById", map);
        	pays.setNom_EN(temp.getNom());
        }
        return liste;
	}

	@Transactional
	public void insertPays(Pays pays) throws DataAccessException {
		logger.info("Insertion d'un pays " + ToStringBuilder.reflectionToString(pays));
		SqlMapClientTemplate template = getSqlMapClientTemplate();
		int id = (Integer)template.insert("insertPays", pays);
		logger.debug("Visu de l'id " + id);
		pays.setPayId(id);
		pays.setLang("FR");
		pays.setNom(pays.getNom_FR());
		template.insert("insertPaysLangue", pays);
		pays.setLang("EN");
		pays.setNom(pays.getNom_EN());
		template.insert("insertPaysLangue", pays);
	}

	@Transactional
	public void updatePays(Pays pays) throws DataAccessException {
		logger.info("Updating Pays d'id: " + pays.getPayId());
		SqlMapClientTemplate template = getSqlMapClientTemplate();
		pays.setLang("FR");
		pays.setNom(pays.getNom_FR());		
		int nbRows = template.update("updatePays", pays);
		logger.debug(nbRows + " updated en FR");
		pays.setLang("EN");
		pays.setNom(pays.getNom_EN());
		nbRows = template.update("updatePays", pays);
		logger.debug(nbRows + " updated en EN");
	}

}
