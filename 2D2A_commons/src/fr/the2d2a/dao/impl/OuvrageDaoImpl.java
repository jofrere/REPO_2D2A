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

import fr.the2d2a.bean.ImageOuvrage;
import fr.the2d2a.bean.Ouvrage;
import fr.the2d2a.dao.OuvrageDao;
import fr.the2d2a.exception.TechnicalException;
import fr.the2d2a_bo.beanform.FilterOuvrageForm;

public class OuvrageDaoImpl extends SqlMapClientDaoSupport implements OuvrageDao {

	protected final Logger logger = Logger.getLogger(OuvrageDaoImpl.class);
	
	@SuppressWarnings("unchecked")
	public List<Ouvrage> getAllOuvrage(String lang) throws TechnicalException {
		logger.debug("Recup Ouvrages en " + lang);
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("lang", lang);
        
        List<Ouvrage> ouvrages = (List<Ouvrage>)template.queryForList("getAllOuvrages", map);
        logger.debug("Visu ouvrages : " + ouvrages.toString());
        
        return ouvrages; 
	}

	public Ouvrage getOuvrageById(String ouvId, String lang) throws DataAccessException {
		logger.debug("Recup Ouvrage en " + lang);
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("lang", lang);
        map.put("ouvId", ouvId);
        Ouvrage ouvrage = (Ouvrage)template.queryForObject("getOuvrageById", map);
        
        return ouvrage; 
	}

	public void destockOuvrage(Ouvrage ouvrage) throws DataAccessException {
		logger.debug("Destockage Ouvrage d'id: " + ouvrage.getId());
		SqlMapClientTemplate template = getSqlMapClientTemplate();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", ouvrage.getId());
		int newQuantite = ouvrage.getQuantite()-ouvrage.getQuantiteReservee();
		map.put("newQuantite", newQuantite);
		template.update("destockOuvrage", map);
	}

	@SuppressWarnings("unchecked")
	public List<Ouvrage> getAllOuvrageWithFilter(String lang,
			FilterOuvrageForm filter) throws DataAccessException {
		logger.debug("Recup all Produits with filter en " + lang);
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("lang", lang);
        
        //gestion du filtre
        map.put("type", filter.getType());
        map.put("reference", filter.getReference());
        map.put("titre", filter.getTitre());
        map.put("auteur", filter.getAuteur());
        
        List<Ouvrage> ouvrages = template.queryForList("getAllOuvrageWithFilter", map);
        logger.debug("Liste de ouvrages : " + ouvrages.toString());
        
        return ouvrages;
	}
	
	@Transactional
	public void insertOuvrage(Ouvrage ouv, String lang) throws DataAccessException {
		logger.debug("Creation d'un ouvrage");
		
		SqlMapClientTemplate template = getSqlMapClientTemplate();
		String id = (String)template.insert("insertOuvrage", ouv);
		logger.debug("Visu de l'id " + id);
		ouv.setId(id);
		ouv.setLang("FR");
		template.insert("insertOuvrageLangue", ouv);
		ouv.setLang("EN");
		template.insert("insertOuvrageLangue", ouv);
		
		//gestion des images
		for (ImageOuvrage img : ouv.getImages()) {
			img.setOuvId(Integer.parseInt(id));
			int imgId = (Integer)template.insert("insertImageOuvrage", img);
			img.setId(imgId);
		}
		logger.debug("Apres gestion des images");
	}
	
	@Transactional
	public void updateOuvrage(Ouvrage ouv, String lang) throws DataAccessException {
		logger.debug("Modification de l'ouvrage d'id : " + ouv.getId());
		SqlMapClientTemplate template = getSqlMapClientTemplate();
		ouv.setLang(lang);
		int nbRows = template.update("updateOuvrage", ouv);
		logger.debug(nbRows + " updated en " + ouv.getLang());
		
		//gestion des images ouvrages
		nbRows = template.delete("deleteImageOuvrage", ouv);
		logger.debug(nbRows + " deleted pour les images");
		
		for (ImageOuvrage img : ouv.getImages()) {
			logger.debug("Visu des images : " + ToStringBuilder.reflectionToString(img));
			//pour les anciennes ki sont deleted
			if (img != null) {
				img.setOuvId(Integer.parseInt(ouv.getId()));
				int imgId = (Integer)template.insert("insertImageOuvrage", img);
				img.setId(imgId);
			}
		}
	}
	
	@Transactional
	public void deleteOuvrage(Ouvrage ouv) throws DataAccessException {
		logger.debug("Suppression d'un ouvrage " + ouv.getId());
		SqlMapClientTemplate template = getSqlMapClientTemplate();
		Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", ouv.getId());
		int nbRows = template.update("deleteOuvrage", map);
		logger.debug(nbRows + " updated");
	}
	
	@SuppressWarnings("unchecked")
	public List<ImageOuvrage> getAllImageOuvrage(String ouvId) throws DataAccessException {
		logger.debug("Recup all Image Produit for id : " + ouvId);
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", ouvId);
        List<ImageOuvrage> liste = template.queryForList("getImageOuvrageByOuvrageId", map);
        return liste;
	}
}
