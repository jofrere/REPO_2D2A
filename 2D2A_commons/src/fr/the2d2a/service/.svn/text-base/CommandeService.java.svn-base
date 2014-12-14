package fr.the2d2a.service;

import java.util.List;

import fr.the2d2a.bean.Commande;
import fr.the2d2a.exception.TechnicalException;
import fr.the2d2a_bo.beanform.FilterCommandeForm;

public interface CommandeService {

	public int insertCommande(Commande commande) throws TechnicalException; 
	
	public List<Commande> getAllCommande() throws TechnicalException;
	
	public Commande getCommandeById(String cmdId) throws TechnicalException;
	
	public void updateCommande(Commande commande) throws TechnicalException;
	
	public List<Commande> getAllCommandeWithFilter(FilterCommandeForm fcf) throws TechnicalException;
	
	public List<Commande> getCommandesByMemberAndState(String memberId, String state) throws TechnicalException;
}
