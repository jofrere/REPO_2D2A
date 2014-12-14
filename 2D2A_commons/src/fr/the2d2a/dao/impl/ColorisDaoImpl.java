package fr.the2d2a.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import fr.the2d2a.bean.Coloris;
import fr.the2d2a.dao.ColorisDao;

public class ColorisDaoImpl extends SqlMapClientDaoSupport implements ColorisDao {

	protected final Logger logger = Logger.getLogger(ColorisDaoImpl.class);

	@Transactional
	@SuppressWarnings("unchecked")
	public List<Coloris> getAllColoris() throws DataAccessException {
        logger.info("Getting all coloris");
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("lang", "FR");
        List<Coloris> liste = (List<Coloris>)template.queryForList("getAllColoris", map);
        for (Coloris coloris : liste) {
        	coloris.setNom_FR(coloris.getNom());
        	map.put("lang", "EN");
        	map.put("id", coloris.getColId());
        	coloris.setNom_EN((String)template.queryForObject("getNomColorisById", map));
        }
        return liste;
    }

	@Transactional
	public void updateColoris(Coloris coloris) throws DataAccessException {
		logger.debug("Updating Coloris d'id: " + coloris.getColId());
		SqlMapClientTemplate template = getSqlMapClientTemplate();
		coloris.setLang("FR");
		coloris.setNom(coloris.getNom_FR());
		int nbRows = template.update("updateColoris", coloris);
		logger.debug(nbRows + " updated en FR");
		coloris.setLang("EN");
		coloris.setNom(coloris.getNom_EN());
		nbRows = template.update("updateColoris", coloris);
		logger.debug(nbRows + " updated en EN");
	}
	
	@Transactional
	public void insertColoris(Coloris coloris) throws DataAccessException {
		logger.debug("Insertion d'un Coloris " + coloris.getPicto());
		SqlMapClientTemplate template = getSqlMapClientTemplate();
		int id = (Integer)template.insert("insertColoris", coloris);
		logger.debug("Visu de l'id " + id);
		coloris.setColId(id);
		coloris.setLang("FR");
		coloris.setNom(coloris.getNom_FR());
		template.insert("insertColorisLangue", coloris);
		coloris.setLang("EN");
		coloris.setNom(coloris.getNom_EN());
		template.insert("insertColorisLangue", coloris);
	}
	
	@Transactional
	public void deleteColoris(int id) throws DataAccessException {
		logger.debug("Suppression d'un Coloris " + id);
		SqlMapClientTemplate template = getSqlMapClientTemplate();
		Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", id);
		int nbRows = template.delete("deleteColorisLangueById", map);
		logger.debug(nbRows + " deleted pour les langues");
		nbRows = template.delete("deleteColorisProduitById", map);
		logger.debug(nbRows + " deleted pour les produits");
		nbRows = template.delete("deleteColorisById", map);
		logger.debug(nbRows + " deleted pour le coloris");
	}
}
