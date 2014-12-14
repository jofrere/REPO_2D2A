package fr.the2d2a.service.impl;

import java.util.List;

import org.springframework.dao.DataAccessException;

import fr.the2d2a.bean.Produit;
import fr.the2d2a.beanform.RechercheForm;
import fr.the2d2a.dao.RechercheDao;
import fr.the2d2a.exception.TechnicalException;
import fr.the2d2a.service.RechercheService;

public class RechercheServiceImpl implements RechercheService {
	
	private RechercheDao dao;

	public List<Produit> getAllProduitsByContent(RechercheForm rechercheForm) throws TechnicalException {
		List<Produit> produits = null;
		try {
			produits = dao.getAllProduitsByContent(rechercheForm);
		} catch(DataAccessException e) {
			throw new TechnicalException(e);
		}
		return produits;
	}
	
	public void setDao(RechercheDao dao) {
		this.dao = dao;
	}

}
