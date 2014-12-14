package fr.the2d2a.bean;

import java.io.Serializable;

public class TypeEvenement implements Serializable {

	private static final long serialVersionUID = -2336523098826044742L;
	
	private int id;
	private String nom;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	
	
}
