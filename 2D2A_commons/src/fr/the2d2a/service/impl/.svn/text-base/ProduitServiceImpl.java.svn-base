package fr.the2d2a.service.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.dao.DataAccessException;

import fr.the2d2a.bean.Commande;
import fr.the2d2a.bean.ImageProduit;
import fr.the2d2a.bean.Produit;
import fr.the2d2a.dao.ProduitDao;
import fr.the2d2a.exception.FonctionalException;
import fr.the2d2a.exception.TechnicalException;
import fr.the2d2a.service.ProduitService;
import fr.the2d2a_bo.beanform.FilterProduitForm;

public class ProduitServiceImpl implements ProduitService {

	private ProduitDao dao;
	
	public List<Produit> getProduitByRubriqueId(String lang, String rubId)
			throws TechnicalException, FonctionalException {
		List<Produit> produits = null;
		try {
			produits = dao.getProduitByRubriqueId(lang, rubId);
		} catch(DataAccessException e) {
			throw new TechnicalException(e);
		}
		if (produits == null || produits.isEmpty())
			throw new FonctionalException();
		return produits;
	}

	public Produit getProduitById(String lang, String proId)
			throws TechnicalException, FonctionalException {
		Produit produit = null;
		try {
			produit = dao.getProduitById(lang, proId);
		} catch(DataAccessException e) {
			throw new TechnicalException(e);
		}
		if (produit == null)
			throw new FonctionalException();
		return produit;
	}
	
	public Produit getProduitByFriendlyName(String lang, String friendlyName) throws TechnicalException, FonctionalException {
		Produit produit = null;
		try {
			produit = dao.getProduitByFriendlyName(lang, friendlyName);
		} catch(DataAccessException e) {
			throw new TechnicalException(e);
		}
		if (produit == null)
			throw new FonctionalException();
		return produit;
	}
	
	
	public void setDao(ProduitDao dao) {
		this.dao = dao;
	}

	public List<Produit> getProduitAssociatedById(String lang, String proId) throws TechnicalException {
		List<Produit> produits = null;
		try {
			produits = dao.getProduitAssociatedById(lang, proId);
		} catch(DataAccessException e) {
			throw new TechnicalException(e);
		}		
		return produits;
	}

	public List<Produit> getAllProduit(String lang) throws TechnicalException {
		return dao.getAllProduit(lang);
	}
	
	public List<Produit> getAllProduitWithFilter(String lang, FilterProduitForm filter) throws TechnicalException {
		if (StringUtils.isEmpty(filter.getReference()))
			return dao.getAllProduitWithFilter(lang, filter);
		else
			return dao.getAllProduitByReference(lang, filter.getReference());
	}

	public void insertProduit(Produit produit) throws TechnicalException {
		dao.insertProduit(produit);
	}
	
	public void updateProduit(Produit produit) throws TechnicalException {
		dao.updateProduit(produit);
	}
	
	public void destockProduit(Commande commande) throws TechnicalException {
		for (Produit produit : commande.getMonPanier().getMesProduits()) {
			dao.destockProduit(produit);
		}
	}
	
	public List<ImageProduit> getAllImageProduit(String proId) throws TechnicalException {
		return dao.getAllImageProduit(proId);
	}
	
	public List<Produit> getProduitByRubriqueIdAndNouveaute(String lang, String id) throws TechnicalException {
		List<Produit> produits = null;
		try {
			produits = dao.getProduitByRubriqueIdAndNouveaute(lang, id);
		} catch(DataAccessException e) {
			throw new TechnicalException(e);
		}
		return produits;
	}
	
	public List<Produit> getProduitByRubriqueIdAndCoupDeCoeur(String lang, String id) throws TechnicalException {
		List<Produit> produits = null;
		try {
			produits = dao.getProduitByRubriqueIdAndCoupDeCoeur(lang, id);
		} catch(DataAccessException e) {
			throw new TechnicalException(e);
		}
		return produits;
	}

	public List<Produit> getProduitsByDesigner(String lang, String id)
			throws TechnicalException {
		List<Produit> produits = null;
		try {
			produits =dao.getProduitsByDesigner(lang, id);
		} catch(DataAccessException e) {
			throw new TechnicalException(e);
		}
		return produits;
	}

	public List<Produit> getProduitsByEditeur(String lang, String id)
			throws TechnicalException {
		List<Produit> produits = null;
		try {
			produits = dao.getProduitsByEditeur(lang, id);
		} catch(DataAccessException e) {
			throw new TechnicalException(e);
		}
		return produits;
	}
}
