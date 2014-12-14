package fr.the2d2a.service.impl;

import java.util.List;

import org.springframework.dao.DataAccessException;

import fr.the2d2a.bean.Commande;
import fr.the2d2a.dao.CommandeDao;
import fr.the2d2a.exception.TechnicalException;
import fr.the2d2a.service.CommandeService;
import fr.the2d2a_bo.beanform.FilterCommandeForm;

public class CommandeServiceImpl implements CommandeService {
	
	private CommandeDao dao;

	public int insertCommande(Commande commande) throws DataAccessException {
		int result = dao.insertCommande(commande);
		return result;
	}
	
	public void setDao(CommandeDao dao) {
		this.dao = dao;
	}

	public List<Commande> getAllCommande() throws TechnicalException {
		return dao.getAllCommande();
	}

	public Commande getCommandeById(String cmdId) throws TechnicalException {
		return dao.getCommandeById(cmdId);
	}	
	
	public void updateCommande(Commande commande) throws TechnicalException {
		dao.updateCommande(commande);
	}
	
	public List<Commande> getAllCommandeWithFilter(FilterCommandeForm fcf) throws TechnicalException {
		return dao.getAllCommandeWithFilter(fcf);
	}

	public List<Commande> getCommandesByMemberAndState(String memberId, String state)
			throws TechnicalException {
		return dao.getCommandesByMemberAndState(memberId, state);
	}
}
