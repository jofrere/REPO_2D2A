package fr.the2d2a.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import fr.the2d2a.bean.Produit;
import fr.the2d2a.beanform.RechercheForm;

public interface RechercheDao {

	public List<Produit> getAllProduitsByContent(RechercheForm rechercheForm) throws DataAccessException;
}
