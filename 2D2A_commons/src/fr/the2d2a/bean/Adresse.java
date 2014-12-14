package fr.the2d2a.bean;

import java.io.Serializable;

public class Adresse implements Serializable {

	private static final long serialVersionUID = 5917614160444339182L;
	
	private int adrId;
	private String nomAdresse;
	private String prenom;
	private String nom;
	private String societe;
	private String adresse;
	private String complementAdresse;
	private String codePostal;
	private String ville;
	private String telPrive;
	private String telBureau;
	private String fax;
	private int typeAdresse;
	private Pays pays;
		
	private int civId;
	private int payId;
	private int memId;
	
	//pour le form
	private int action;
	
	public Adresse() {
		pays = new Pays();
	}
	
	public int getAdrId() {
		return adrId;
	}
	public void setAdrId(int id) {
		this.adrId = id;
	}
	public String getNomAdresse() {
		return nomAdresse;
	}
	public void setNomAdresse(String nomAdresse) {
		this.nomAdresse = nomAdresse;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getSociete() {
		return societe;
	}
	public void setSociete(String societe) {
		this.societe = societe;
	}
	public String getAdresse() {
		return adresse;
	}
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	public String getComplementAdresse() {
		return complementAdresse;
	}
	public void setComplementAdresse(String complementAdresse) {
		this.complementAdresse = complementAdresse;
	}
	public String getCodePostal() {
		return codePostal;
	}
	public void setCodePostal(String codePostal) {
		this.codePostal = codePostal;
	}
	public String getVille() {
		return ville;
	}
	public void setVille(String ville) {
		this.ville = ville;
	}
	public String getTelPrive() {
		return telPrive;
	}
	public void setTelPrive(String telPrive) {
		this.telPrive = telPrive;
	}
	public String getTelBureau() {
		return telBureau;
	}
	public void setTelBureau(String telBureau) {
		this.telBureau = telBureau;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public int getTypeAdresse() {
		return typeAdresse;
	}
	public void setTypeAdresse(int typeAdresse) {
		this.typeAdresse = typeAdresse;
	}
	public Pays getPays() {
		return pays;
	}
	public void setPays(Pays pays) {
		this.pays = pays;
	}

	public int getCivId() {
		return civId;
	}

	public void setCivId(int civId) {
		this.civId = civId;
	}

	public int getPayId() {
		return payId;
	}

	public void setPayId(int paysId) {
		this.payId = paysId;
	}

	public int getMemId() {
		return memId;
	}

	public void setMemId(int membreId) {
		this.memId = membreId;
	}

	public int getAction() {
		return action;
	}

	public void setAction(int action) {
		this.action = action;
	}
	
	public String getJavascript() {
		String add = "\""+this.getSociete()+"\",\""+this.getPrenom()+"\",\""+this.getNom()+"\",\""+this.getAdresse()+"\",\""+this.getComplementAdresse()+"\",\""+this.getCodePostal()+"\",\""+this.getVille()+"\",\""+this.getPays().getNom()+"\",\""+this.getTelPrive()+"\",\""+this.getAdrId()+"\"";
		return add;
	}
}
