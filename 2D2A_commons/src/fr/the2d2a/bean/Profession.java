package fr.the2d2a.bean;

import java.io.Serializable;

public class Profession implements Serializable {

	private static final long serialVersionUID = -8601201668865724551L;

	private int profId;
	private String titre;
	
	//pour le BO
	private int action;	
	private String lang;
	private String titre_FR;
	private String titre_EN;
	
	public int getProfId() {
		return profId;
	}
	public void setProfId(int id) {
		this.profId = id;
	}
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
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
	public String getTitre_FR() {
		return titre_FR;
	}
	public void setTitre_FR(String titre_FR) {
		this.titre_FR = titre_FR;
	}
	public String getTitre_EN() {
		return titre_EN;
	}
	public void setTitre_EN(String titre_EN) {
		this.titre_EN = titre_EN;
	}	
}
