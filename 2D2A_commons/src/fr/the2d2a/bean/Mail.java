package fr.the2d2a.bean;

import java.io.Serializable;

public class Mail implements Serializable {
	
	private static final long serialVersionUID = -2020340743409178882L;
	
	private String maiId;
	private String nom;
	private String sujet;
	private String contenu;
	private String expediteur;
	private String reponse;
	private boolean activation;
	
	//pour le BO
	private int action;
	private String lang;
	
	public String getMaiId() {
		return maiId;
	}
	public void setMaiId(String id) {
		this.maiId = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getSujet() {
		return sujet;
	}
	public void setSujet(String sujet) {
		this.sujet = sujet;
	}
	public String getContenu() {
		return contenu;
	}
	public void setContenu(String contenu) {
		this.contenu = contenu;
	}
	public String getExpediteur() {
		return expediteur;
	}
	public void setExpediteur(String expediteur) {
		this.expediteur = expediteur;
	}
	public String getReponse() {
		return reponse;
	}
	public void setReponse(String reponse) {
		this.reponse = reponse;
	}
	public int getAction() {
		return action;
	}
	public void setAction(int action) {
		this.action = action;
	}
	public String getLang() {
		return lang;
	}
	public void setLang(String lang) {
		this.lang = lang;
	}
	public boolean isActivation() {
		return activation;
	}
	public void setActivation(boolean activation) {
		this.activation = activation;
	}
}
