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

import fr.the2d2a.bean.Coloris;
import fr.the2d2a.bean.ImageProduit;
import fr.the2d2a.bean.Pays;
import fr.the2d2a.bean.Produit;
import fr.the2d2a.bean.SpecificiteProduit;
import fr.the2d2a.dao.ProduitDao;
import fr.the2d2a.web.constants.WebConstants;
import fr.the2d2a_bo.beanform.FilterProduitForm;

public class ProduitDaoImpl extends SqlMapClientDaoSupport implements ProduitDao {

	protected final Logger logger = Logger.getLogger(ProduitDaoImpl.class);
	
	@SuppressWarnings("unchecked")
	public Produit getProduitById(String lang, String proId) throws DataAccessException {
		logger.debug("Recup Produit en " + lang + " pour l'id : " + proId);
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("lang", lang);
        map.put("proId", proId);
        
        Produit produit = (Produit) template.queryForObject("getProduitByProduitId", map);
        map.put("id", produit.getProId());
        List<SpecificiteProduit> specs = template.queryForList("getSpecificiteByProductId", map);
        produit.setSpecs(specs);
        Pays pays = (Pays) template.queryForObject("getPaysByProductId", map);
        produit.setPays(pays);        	
        List<Coloris> coloris = template.queryForList("getColorisByProductId", map);
        produit.setColoris(coloris);
        logger.debug("coloris : " + coloris.size());
        
        //logger.debug("Produit : " + ToStringBuilder.reflectionToString(produit,ToStringStyle.MULTI_LINE_STYLE));
        
        return produit;
	}

	@SuppressWarnings("unchecked")
	public List<Produit> getProduitByRubriqueId(String lang, String rubId) throws DataAccessException {
		logger.debug("Recup Produits en " + lang);
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("lang", lang);
        map.put("rubId", rubId);
        String visuLang = "1";
        if (lang.equals(WebConstants.LANGUE_EN)) {
        	visuLang = "2";
        }
        map.put("visuLang", visuLang);
        List<Produit> produits = template.queryForList("getProduitByRubriqueId", map);
        logger.debug("Liste de produits : " + produits.toString());
        
        for (Produit produit : produits) {
        	map.put("id", produit.getProId());
        	List<SpecificiteProduit> specs = template.queryForList("getSpecificiteByProductId", map);
        	produit.setSpecs(specs);
        	Pays pays = (Pays) template.queryForObject("getPaysByProductId", map);
        	produit.setPays(pays);        	
        	List<Coloris> coloris = template.queryForList("getColorisByProductId", map);
        	produit.setColoris(coloris);
        }
        
		return produits;
	}
	
	@SuppressWarnings("unchecked")
	public Produit getProduitByFriendlyName(String lang, String friendlyName) throws DataAccessException {
		logger.debug("Recup Produit en " + lang + " pour : " + friendlyName);
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("lang", lang);
        map.put("friendlyName", friendlyName);
        
        Produit produit = (Produit) template.queryForObject("getProduitByFriendlyName", map);
        map.put("id", produit.getProId());
        List<SpecificiteProduit> specs = template.queryForList("getSpecificiteByProductId", map);
        produit.setSpecs(specs);
        Pays pays = (Pays) template.queryForObject("getPaysByProductId", map);
        produit.setPays(pays);        	
        List<Coloris> coloris = template.queryForList("getColorisByProductId", map);
        produit.setColoris(coloris);
        logger.debug("coloris : " + coloris.size());
        
        logger.debug("Produit : " + produit.toString());
        
        return produit;
	}

	@SuppressWarnings("unchecked")
	public List<Produit> getProduitAssociatedById(String lang, String proId) throws DataAccessException {
		logger.debug("Recup Produits Accociated pour ID : " + proId);
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("lang", lang);
        map.put("proId", proId);
        
        List<Produit> produits = template.queryForList("getProduitAssociatedByProduitId", map);
        logger.debug("Liste de produits associés : " + produits.toString());
        return produits;
	}

	@SuppressWarnings("unchecked")
	public List<Produit> getAllProduit(String lang) throws DataAccessException {
		logger.debug("Recup all Produits en " + lang);
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("lang", lang);
        
        List<Produit> produits = template.queryForList("getAllProduit", map);
        logger.debug("Liste de produits : " + produits.toString());
        
        for (Produit produit : produits) {
        	map.put("id", produit.getProId());
        	List<SpecificiteProduit> specs = template.queryForList("getSpecificiteByProductId", map);
        	produit.setSpecs(specs);
        	Pays pays = (Pays) template.queryForObject("getPaysByProductId", map);
        	produit.setPays(pays);        	
        	List<Coloris> coloris = template.queryForList("getColorisByProductId", map);
        	produit.setColoris(coloris);
        }
		return produits;
	}
	
	@SuppressWarnings("unchecked")
	public List<Produit> getAllProduitWithFilter(String lang, FilterProduitForm filter) throws DataAccessException {
		logger.debug("Recup all Produits with filter en " + lang);
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("lang", lang);
        
        //gestion du filtre
        map.put("achatDepot", filter.getAchatDepot());
        map.put("visuLang", filter.getVisuLang());
        map.put("rubrique", filter.getRubrique());
        
        List<Produit> produits = template.queryForList("getAllProduitWithFilter", map);
        logger.debug("Liste de produits : " + produits.toString());
        
        return produits;
	}
	
	@SuppressWarnings("unchecked")
	public List<Produit> getAllProduitByReference(String lang, String reference) throws DataAccessException {
		logger.debug("Recup all ProduitsByReference en " + lang);
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("lang", lang);
        map.put("reference", reference);
        
        List<Produit> produits = template.queryForList("getAllProduitByReference", map);
        logger.debug("Liste de produits : " + produits.toString());
        
        return produits;
	}

	@Transactional
	public void insertProduit(Produit produit) throws DataAccessException {
		logger.debug("Insertion d'un Produit ");
		SqlMapClientTemplate template = getSqlMapClientTemplate();
		int id = (Integer)template.insert("insertProduit", produit);
		logger.debug("Visu de l'id " + id);
		produit.setProId(id);
		produit.setLang("FR");
		template.insert("insertProduitLangue", produit);
		produit.setLang("EN");
		template.insert("insertProduitLangue", produit);
		
		//gestion des images
		for (ImageProduit img : produit.getImages()) {
			img.setProdId(id);
			int imgId = (Integer)template.insert("insertImageProduit", img);
			img.setImgId(imgId);
		}
		logger.debug("Apres gestion des images");
		
		//gestion des coloris
		for (String colId : produit.getColorisId()) {
			produit.setColId(colId);
			template.insert("insertProduitColoris", produit);
		}
		logger.debug("Apres gestion des coloris");
		
		//gestion des specificites
		for (String speId : produit.getSpecId()) {
			produit.setSpeId(speId);
			template.insert("insertProduitSpecificite", produit);
		}
		logger.debug("Apres gestion des spec");

		//gestion des rubriques
		for (String rubId : produit.getRubriquesId()) {
			produit.setRubId(rubId);
			template.insert("insertProduitRubrique", produit);
		}
		logger.debug("Apres gestion des rub");

		//gestion des produits associés
		for (String proId : produit.getProdsAssocId()) {
			produit.setProdAssocId(proId);
			template.insert("insertProduitProduit", produit);
		}
		logger.debug("Apres gestion des prod asso");

	}
	
	@Transactional
	public void updateProduit(Produit produit) throws DataAccessException {
		logger.debug("Updating Produit d'id: " + produit.getProId());
		SqlMapClientTemplate template = getSqlMapClientTemplate();
		logger.debug("Visu du designerid : " + produit.getDesId());
		int nbRows = template.update("updateProduit", produit);
		logger.debug(nbRows + " updated en " + produit.getLang());
		
		//gestion des images produits
		nbRows = template.delete("deleteImageProduit", produit);
		logger.debug(nbRows + " deleted pour les images");
		
		for (ImageProduit img : produit.getImages()) {
			logger.debug("Visu des images : " + ToStringBuilder.reflectionToString(img));
			//pour les anciennes ki sont deleted
			if (img != null) {
				img.setProdId(produit.getProId());
				int imgId = (Integer)template.insert("insertImageProduit", img);
				img.setImgId(imgId);
			}
		}
		
		//gestion des coloris
		nbRows = template.delete("deleteProduitColoris", produit);
		logger.debug(nbRows + " deleted pour les coloris");
		
		if (produit.getColorisId() != null)
			for (String colId : produit.getColorisId()) {
				produit.setColId(colId);
				template.insert("insertProduitColoris", produit);
			}
		
		//gestion des specificites
		nbRows = template.delete("deleteProduitSpecificite", produit);
		logger.debug(nbRows + " deleted pour les specs");
		
		if (produit.getSpecId() != null)
			for (String speId : produit.getSpecId()) {
				produit.setSpeId(speId);
				template.insert("insertProduitSpecificite", produit);
			}
		
		//gestion des rubriques
		nbRows = template.delete("deleteProduitRubrique", produit);
		logger.debug(nbRows + " deleted pour les rubriques");
		
		if (produit.getRubriquesId() != null)
			for (String rubId : produit.getRubriquesId()) {
				produit.setRubId(rubId);
				template.insert("insertProduitRubrique", produit);
			}
		
		//gestion des produits associés
		nbRows = template.delete("deleteProduitProduit", produit);
		logger.debug(nbRows + " deleted pour les produits associés");
		
		if (produit.getProdsAssocId() != null)
			for (String proId : produit.getProdsAssocId()) {
				produit.setProdAssocId(proId);
				template.insert("insertProduitProduit", produit);
			}
	}
	
	public void destockProduit(Produit produit) throws DataAccessException {
		logger.debug("Destockage Produit d'id: " + produit.getProId());
		SqlMapClientTemplate template = getSqlMapClientTemplate();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", produit.getProId());
		int newQuantite = produit.getQuantite()-produit.getQuantiteReservee();
		map.put("newQuantite", newQuantite);
		template.update("destockProduit", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<ImageProduit> getAllImageProduit(String proId) throws DataAccessException {
		logger.debug("Recup all Image Produit for id : " + proId);
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", proId);
        List<ImageProduit> liste = template.queryForList("getImageProduitByProductId", map);
        return liste;
	}
	
	@SuppressWarnings("unchecked")
	public List<Produit> getProduitByRubriqueIdAndNouveaute(String lang, String rubId) throws DataAccessException {
		logger.debug("Recup Produits nouveaute en " + lang + " pour la rubrique " + rubId);
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("lang", lang);
        map.put("rubId", rubId);
        String visuLang = "1";
        if (lang.equals(WebConstants.LANGUE_EN)) {
        	visuLang = "2";
        }
        map.put("visuLang", visuLang);
        List<Produit> produits = template.queryForList("getProduitByRubriqueIdAndNouveaute", map);
        logger.debug("Liste de produits : " + produits.toString());
        
        for (Produit produit : produits) {
        	map.put("id", produit.getProId());
        	List<SpecificiteProduit> specs = template.queryForList("getSpecificiteByProductId", map);
        	produit.setSpecs(specs);
        	Pays pays = (Pays) template.queryForObject("getPaysByProductId", map);
        	produit.setPays(pays);        	
        	List<Coloris> coloris = template.queryForList("getColorisByProductId", map);
        	produit.setColoris(coloris);
        }
        
		return produits;
	}
	
	@SuppressWarnings("unchecked")
	public List<Produit> getProduitByRubriqueIdAndCoupDeCoeur(String lang, String rubId) throws DataAccessException {
		logger.debug("Recup Produits coup de coeur en " + lang);
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("lang", lang);
        map.put("rubId", rubId);
        String visuLang = "1";
        if (lang.equals(WebConstants.LANGUE_EN)) {
        	visuLang = "2";
        }
        map.put("visuLang", visuLang);
        List<Produit> produits = template.queryForList("getProduitByRubriqueIdAndCoupDeCoeur", map);
        logger.debug("Liste de produits : " + produits.toString());
        
        for (Produit produit : produits) {
        	map.put("id", produit.getProId());
        	List<SpecificiteProduit> specs = template.queryForList("getSpecificiteByProductId", map);
        	produit.setSpecs(specs);
        	Pays pays = (Pays) template.queryForObject("getPaysByProductId", map);
        	produit.setPays(pays);        	
        	List<Coloris> coloris = template.queryForList("getColorisByProductId", map);
        	produit.setColoris(coloris);
        }
        
		return produits;
	}

	@SuppressWarnings("unchecked")
	public List<Produit> getProduitsByDesigner(String lang, String id)
			throws DataAccessException {
		logger.debug("Recup Produits par designer en " + lang);
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("lang", lang);
        map.put("id", id);
        List<Produit> produits = template.queryForList("getProduitsByDesigner", map);
        logger.debug("Liste de produits : " + produits.toString());
        return produits;
	}

	@SuppressWarnings("unchecked")
	public List<Produit> getProduitsByEditeur(String lang, String id)
			throws DataAccessException {
		logger.debug("Recup Produits par editeur en " + lang);
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("lang", lang);
        map.put("id", id);
        List<Produit> produits = template.queryForList("getProduitsByEditeur", map);
        logger.debug("Liste de produits : " + produits.toString());
        return produits;
	}
}
