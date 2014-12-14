package fr.the2d2a.bean;

import java.io.Serializable;

public abstract class Artiste implements Serializable {

	private static final long serialVersionUID = -2816007916080572513L;

	private String id;
	private String nom;
	private String prenom;
	private String dateNaiss;
	private String lieuNaiss;
	private String biographie;
	private String information;
	private String bibliographie;
	private String collaboration;
	private String siteInternet;
	private String pathPhoto;
	
	private String link;
	
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
	public String getDateNaiss() {
		return dateNaiss;
	}
	public void setDateNaiss(String dateNaiss) {
		this.dateNaiss = dateNaiss;
	}
	public String getLieuNaiss() {
		return lieuNaiss;
	}
	public void setLieuNaiss(String lieuNaiss) {
		this.lieuNaiss = lieuNaiss;
	}
	public String getBiographie() {
		return biographie;
	}
	public void setBiographie(String biographie) {
		this.biographie = biographie;
	}
	public String getInformation() {
		return information;
	}
	public void setInformation(String information) {
		this.information = information;
	}
	public String getBibliographie() {
		return bibliographie;
	}
	public void setBibliographie(String bibliographie) {
		this.bibliographie = bibliographie;
	}
	public String getCollaboration() {
		return collaboration;
	}
	public void setCollaboration(String collaboration) {
		this.collaboration = collaboration;
	}
	public String getSiteInternet() {
		return siteInternet;
	}
	public void setSiteInternet(String siteInternet) {
		this.siteInternet = siteInternet;
	}
	public String getPathPhoto() {
		return pathPhoto;
	}
	public void setPathPhoto(String pathPhoto) {
		this.pathPhoto = pathPhoto;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public abstract String getTypeArtiste();
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
}
