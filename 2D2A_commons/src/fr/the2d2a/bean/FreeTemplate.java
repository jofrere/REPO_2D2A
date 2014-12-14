package fr.the2d2a.bean;

import java.io.Serializable;

public class FreeTemplate implements Serializable {

	private static final long serialVersionUID = -1940390090024857951L;

	private int id;
	private String nom;
	private String contenu;
	
	private int action;
	
	public FreeTemplate() {
		
	}
	
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
	public String getContenu() {
		return contenu;
	}
	public void setContenu(String contenu) {
		this.contenu = contenu;
	}

	public int getAction() {
		return action;
	}

	public void setAction(int action) {
		this.action = action;
	}
}
