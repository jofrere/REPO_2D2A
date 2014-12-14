package fr.the2d2a.bean;

import java.io.Serializable;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;

public class Panier implements Serializable {

	private static final long serialVersionUID = 2720184149296171276L;
	
	private static NumberFormat nbFormat = NumberFormat.getIntegerInstance();

	private List<Produit> mesProduits;
	private List<Ouvrage> mesOuvrages;
	
	private int action;
	
	
	@SuppressWarnings("unchecked")
	public Panier() {
		mesProduits = LazyList.decorate(new ArrayList<Produit>(), FactoryUtils.instantiateFactory(Produit.class));
		mesOuvrages = LazyList.decorate(new ArrayList<Ouvrage>(), FactoryUtils.instantiateFactory(Ouvrage.class));
	}

	public List<Produit> getMesProduits() {
		return mesProduits;
	}
	
	public void setMesProduits(List<Produit> mesProduits) {
		this.mesProduits = mesProduits;
	}

	public int getAction() {
		return action;
	}

	public void setAction(int action) {
		this.action = action;
	}

	public float getPrix() {
		float prix = 0f;
		for (Produit prod : mesProduits) {
			prix += prod.getPrixTotal();
		}
		for (Ouvrage ouv : mesOuvrages) {
			prix += ouv.getPrixTotal();
		}
		
		return prix;
	}
	
	public String getPrixFormate() {
		nbFormat.setMaximumFractionDigits(2);
		nbFormat.setMinimumFractionDigits(2);
		return nbFormat.format(getPrix());
	}
	
	public float getPrixLoc() {
		float prix = 0f;
		for (Produit prod : mesProduits) {
			prix += prod.getPrixLocTotal();
		}
		return prix;
	}
	
	public String getPrixLocFormate() {
		nbFormat.setMaximumFractionDigits(2);
		nbFormat.setMinimumFractionDigits(2);
		return nbFormat.format(getPrixLoc());
	}
	
	public int getSize() {
		int quantiteTotale = 0;
		for (Produit prod : mesProduits) {
			quantiteTotale += prod.getQuantiteReservee();
		}
		for (Ouvrage ouv : mesOuvrages) {
			quantiteTotale += ouv.getQuantiteReservee();
		}
		return quantiteTotale;
	}

	public List<Ouvrage> getMesOuvrages() {
		return mesOuvrages;
	}

	public void setMesOuvrages(List<Ouvrage> mesOuvrages) {
		this.mesOuvrages = mesOuvrages;
	}	
}
