package fr.the2d2a.bean;

import java.io.Serializable;

public class SpecificiteProduit implements Serializable {

	private static final long serialVersionUID = 4468845455412188841L;

	private int speId;
	private String nom;
	private String abbr;
	
	//pour le BO
	private String nom_FR;
	private String nom_EN;
	private String abbr_FR;
	private String abbr_EN;
	private int action;
	private String lang;
	
	public int getSpeId() {
		return speId;
	}
	public void setSpeId(int id) {
		this.speId = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getAbbr() {
		return abbr;
	}
	public void setAbbr(String abbr) {
		this.abbr = abbr;
	}
	public String getNom_FR() {
		return nom_FR;
	}
	public void setNom_FR(String nom_FR) {
		this.nom_FR = nom_FR;
	}
	public String getNom_EN() {
		return nom_EN;
	}
	public void setNom_EN(String nom_EN) {
		this.nom_EN = nom_EN;
	}
	public String getAbbr_FR() {
		return abbr_FR;
	}
	public void setAbbr_FR(String abbr_FR) {
		this.abbr_FR = abbr_FR;
	}
	public String getAbbr_EN() {
		return abbr_EN;
	}
	public void setAbbr_EN(String abbr_EN) {
		this.abbr_EN = abbr_EN;
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
}
