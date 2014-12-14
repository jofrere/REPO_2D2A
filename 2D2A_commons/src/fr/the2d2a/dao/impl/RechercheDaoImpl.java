package fr.the2d2a.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import fr.the2d2a.bean.Produit;
import fr.the2d2a.bean.Rubrique;
import fr.the2d2a.beanform.RechercheForm;
import fr.the2d2a.dao.RechercheDao;
import fr.the2d2a.web.constants.WebConstants;

public class RechercheDaoImpl extends SqlMapClientDaoSupport implements RechercheDao {

	protected final Logger logger = Logger.getLogger(RechercheDaoImpl.class);
	
	@SuppressWarnings("unchecked")
	public List<Produit> getAllProduitsByContent(RechercheForm rechercheForm) throws DataAccessException {
		logger.info("Getting all produit by content");
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("lang", rechercheForm.getLang());
        logger.debug("Contenu recherche : " + rechercheForm.getSearchField());
        map.put("content", rechercheForm.getSearchField());
        String visuLang = "1";
        if (rechercheForm.getLang().equals(WebConstants.LANGUE_EN)) {
        	visuLang = "2";
        }
        map.put("visuLang", visuLang);
        map.put("edi_id", rechercheForm.getEditeur());
        
        String prix = rechercheForm.getPrix();
        if (prix != null && !StringUtils.isEmpty(prix)) {
        	String prixMin = prix.split("-")[0];
        	String prixMax = prix.split("-")[1];
        	map.put("prixMin", prixMin);
        	map.put("prixMax", prixMax);
        }
        map.put("rubId", rechercheForm.getRubrique());
        
        List<Produit> liste = (List<Produit>)template.queryForList("getAllProduitsByContent", map);
        
        for (Produit prod : liste) {
        	map.put("proId", prod.getProId());
            List<Rubrique> listeRub = (List<Rubrique>)template.queryForList("selectAllRubriquesByProductId", map);
            prod.setRubriques(listeRub);
        }
        return liste;
	}
	
	
}
