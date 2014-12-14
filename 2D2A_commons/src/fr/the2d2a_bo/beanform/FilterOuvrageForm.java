package fr.the2d2a_bo.beanform;

import java.io.Serializable;

public class FilterOuvrageForm implements Serializable {
	
	private static final long serialVersionUID = -5797033441875556381L;
	
	private int type = -1;
	private String reference;
	private String titre;
	private String auteur;
	
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getReference() {
		return reference;
	}
	public void setReference(String reference) {
		this.reference = reference;
	}
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	public String getAuteur() {
		return auteur;
	}
	public void setAuteur(String auteur) {
		this.auteur = auteur;
	}
	
}
