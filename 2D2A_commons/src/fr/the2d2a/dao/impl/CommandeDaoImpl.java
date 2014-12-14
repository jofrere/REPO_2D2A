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

import fr.the2d2a.bean.Commande;
import fr.the2d2a.bean.Ouvrage;
import fr.the2d2a.bean.Produit;
import fr.the2d2a.dao.CommandeDao;
import fr.the2d2a.web.constants.ParamConstants;
import fr.the2d2a_bo.beanform.FilterCommandeForm;

public class CommandeDaoImpl extends SqlMapClientDaoSupport implements CommandeDao {

	protected final Logger logger = Logger.getLogger(CommandeDaoImpl.class);

	@Transactional
	public int insertCommande(Commande commande) throws DataAccessException {
		logger.info("insert commande : " + ToStringBuilder.reflectionToString(commande));
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        int commandeId = (Integer)template.insert("insertCommande", commande);		
		commande.setId(commandeId);
		
		logger.debug("Visu ID commande : " + commande.getId());
        
		Map<String, Object> map = new HashMap<String, Object>();
		for (Produit prod : commande.getMonPanier().getMesProduits()) {
			logger.debug("Visu du produit : " + ToStringBuilder.reflectionToString(prod));
			map.put("COM_ID", commande.getId());
			map.put("PRO_ID", prod.getProId());
			map.put("Quantite", prod.getQuantiteReservee());
			map.put("Prix", prod.getPrix());
			map.put("COL_ID", prod.getColId());
			template.insert("insertCommandeProduit", map);
			map.clear();
		}
		for (Ouvrage ouv : commande.getMonPanier().getMesOuvrages()) {
			map.put("COM_ID", commande.getId());
			map.put("OUV_ID", ouv.getId());
			map.put("Quantite", ouv.getQuantiteReservee());
			map.put("Prix", ouv.getPrix());
			template.insert("insertCommandeOuvrage", map);
			map.clear();
		}
        
		return commandeId;
	}
	
	@SuppressWarnings("unchecked")
	public List<Commande> getAllCommande() throws DataAccessException {
		logger.info("get all commande");
        SqlMapClientTemplate template = getSqlMapClientTemplate();        
        List<Commande> commandes = template.queryForList("getAllCommande");        
        return commandes;
	}
	
	public Commande getCommandeById(String cmdId) throws DataAccessException {
		logger.debug("Recup Cmd");
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", cmdId);
        
        Commande cmd = (Commande) template.queryForObject("getCommandeById", map);
        return cmd;
	}
	
	public void updateCommande(Commande commande) throws DataAccessException {
		logger.debug("Updating commande d'id: " + commande.getId());
		SqlMapClientTemplate template = getSqlMapClientTemplate();
		int nbRows = template.update("updateCommande", commande);
		logger.debug(nbRows + " updated");
	}
	
	@SuppressWarnings("unchecked")
	public List<Commande> getAllCommandeWithFilter(FilterCommandeForm fcf) throws DataAccessException {
		logger.info("get all commande with filter");
        SqlMapClientTemplate template = getSqlMapClientTemplate();        
        Map<String, Object> map = new HashMap<String, Object>();
        //gestion du filtre
        map.put("etat", fcf.getEtat());
        map.put("membre", fcf.getMembre());
        map.put("reference", fcf.getReference());
        map.put("sort", fcf.getSort());
        logger.debug("Visu du sort ds la requete : " + fcf.getSort());
        List<Commande> commandes = template.queryForList("getAllCommandeWithFilter", map);        
        return commandes;
	}

	@SuppressWarnings("unchecked")
	public List<Commande> getCommandesByMemberAndState(String memberId, String state)
			throws DataAccessException {
		logger.info("getCommandesByMemberAndState");
        SqlMapClientTemplate template = getSqlMapClientTemplate();     
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("memberId", memberId);
        List<Commande> commandes = null;
        if (ParamConstants.COMMANDE_EN_COURS.equals(state)) {
        	commandes = template.queryForList("getCommandesByMemberAndState", map);
        } else {
        	commandes = template.queryForList("getCommandesByMemberAndHisto", map);            
        }
        return commandes;
	}

	
}
