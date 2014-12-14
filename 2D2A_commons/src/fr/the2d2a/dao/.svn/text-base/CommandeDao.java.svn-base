package fr.the2d2a.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import fr.the2d2a.bean.Commande;
import fr.the2d2a_bo.beanform.FilterCommandeForm;

public interface CommandeDao {

	public int insertCommande(Commande commande) throws DataAccessException;
	
	public List<Commande> getAllCommande() throws DataAccessException;
	
	public Commande getCommandeById(String cmdId) throws DataAccessException;
	
	public void updateCommande(Commande commande) throws DataAccessException;
	
	public List<Commande> getAllCommandeWithFilter(FilterCommandeForm fcf) throws DataAccessException;
	
	public List<Commande> getCommandesByMemberAndState(String memberId, String state) throws DataAccessException;
}
