package fr.the2d2a_bo.beanform;

import java.io.Serializable;

public class FilterMembreForm implements Serializable {

	private static final long serialVersionUID = -7949342375762226935L;

	private String login;
	private String nom;
	private String prenom;
	private int activation = -1;
	private String codePostal;
	
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getCodePostal() {
		return codePostal;
	}
	public void setCodePostal(String codePostal) {
		this.codePostal = codePostal;
	}
	public int getActivation() {
		return activation;
	}
	public void setActivation(int activation) {
		this.activation = activation;
	}
}
