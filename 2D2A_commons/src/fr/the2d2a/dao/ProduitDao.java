package fr.the2d2a.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import fr.the2d2a.bean.ImageProduit;
import fr.the2d2a.bean.Produit;
import fr.the2d2a_bo.beanform.FilterProduitForm;

public interface ProduitDao {

	public List<Produit> getProduitByRubriqueId(String lang, String rubId) throws DataAccessException;
	
	public Produit getProduitById(String lang, String proId) throws DataAccessException;
	
	public Produit getProduitByFriendlyName(String lang, String friendlyName) throws DataAccessException;
	
	public List<Produit> getProduitAssociatedById(String lang, String proId) throws DataAccessException;
	
	public List<Produit> getAllProduit(String lang) throws DataAccessException;
	
	public List<Produit> getAllProduitWithFilter(String lang, FilterProduitForm filter) throws DataAccessException;
	
	public List<Produit> getAllProduitByReference(String lang, String reference) throws DataAccessException;
	
	public void insertProduit(Produit produit) throws DataAccessException;
	
	public void updateProduit(Produit produit) throws DataAccessException;
	
	public void destockProduit(Produit produit) throws DataAccessException;
	
	public List<ImageProduit> getAllImageProduit(String proId) throws DataAccessException;
	
	public List<Produit> getProduitByRubriqueIdAndNouveaute(String lang, String id) throws DataAccessException;
	
	public List<Produit> getProduitByRubriqueIdAndCoupDeCoeur(String lang, String id) throws DataAccessException;
	
	public List<Produit> getProduitsByDesigner(String lang, String id) throws DataAccessException;
	
	public List<Produit> getProduitsByEditeur(String lang, String id) throws DataAccessException;
}
