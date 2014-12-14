package fr.the2d2a.bean;

import java.io.Serializable;

public class Filleul implements Serializable {

	private static final long serialVersionUID = -1881485101600469003L;
	
	private int id;
	private int membreId;
	private String mail;
	private int etat;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMembreId() {
		return membreId;
	}
	public void setMembreId(int membreId) {
		this.membreId = membreId;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public int getEtat() {
		return etat;
	}
	public void setEtat(int etat) {
		this.etat = etat;
	}
	
	
}
