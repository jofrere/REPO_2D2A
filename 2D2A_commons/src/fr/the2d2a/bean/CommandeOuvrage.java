package fr.the2d2a.bean;

import java.io.Serializable;

public class CommandeOuvrage implements Serializable {

	private static final long serialVersionUID = -6494387073659727201L;

	private int id;
	private int quantite;
	private int prixUnitaire;
	private Ouvrage ouvrage;
	private int ouvId;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getQuantite() {
		return quantite;
	}
	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}
	public int getPrixUnitaire() {
		return prixUnitaire;
	}
	public void setPrixUnitaire(int prixUnitaire) {
		this.prixUnitaire = prixUnitaire;
	}
	public Ouvrage getOuvrage() {
		return ouvrage;
	}
	public void setOuvrage(Ouvrage ouvrage) {
		this.ouvrage = ouvrage;
	}
	public int getOuvId() {
		return ouvId;
	}
	public void setOuvId(int ouvId) {
		this.ouvId = ouvId;
	}
}
