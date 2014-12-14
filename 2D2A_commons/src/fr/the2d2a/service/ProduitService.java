package fr.the2d2a.service;

import java.util.List;

import fr.the2d2a.bean.Commande;
import fr.the2d2a.bean.ImageProduit;
import fr.the2d2a.bean.Produit;
import fr.the2d2a.exception.FonctionalException;
import fr.the2d2a.exception.TechnicalException;
import fr.the2d2a_bo.beanform.FilterProduitForm;

public interface ProduitService {

	public List<Produit> getProduitByRubriqueId(String lang, String rubId) throws TechnicalException, FonctionalException;
	
	public Produit getProduitById(String lang, String proId) throws TechnicalException, FonctionalException;
	
	public Produit getProduitByFriendlyName(String lang, String friendlyName) throws TechnicalException, FonctionalException;
	
	public List<Produit> getProduitAssociatedById(String lang, String proId) throws TechnicalException;
	
	public List<Produit> getAllProduit(String lang) throws TechnicalException;
	
	public List<Produit> getAllProduitWithFilter(String lang, FilterProduitForm filter) throws TechnicalException;
	
	public void insertProduit(Produit produit) throws TechnicalException;
	
	public void updateProduit(Produit produit) throws TechnicalException;
	
	public void destockProduit(Commande commande) throws TechnicalException;
	
	public List<ImageProduit> getAllImageProduit(String proId) throws TechnicalException;
	
	public List<Produit> getProduitByRubriqueIdAndNouveaute(String lang, String id) throws TechnicalException;
	
	public List<Produit> getProduitByRubriqueIdAndCoupDeCoeur(String lang, String id) throws TechnicalException;
	
	public List<Produit> getProduitsByDesigner(String lang, String id) throws TechnicalException;
	
	public List<Produit> getProduitsByEditeur(String lang, String id) throws TechnicalException;
}
