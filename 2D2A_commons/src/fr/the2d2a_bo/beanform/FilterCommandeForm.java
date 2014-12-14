package fr.the2d2a_bo.beanform;

import java.io.Serializable;

public class FilterCommandeForm implements Serializable {

	private static final long serialVersionUID = -1910466426165831751L;
	
	private int etat = -1;	
	private String membre;
	private String reference;
	private int sort = 0;
	
	public int getEtat() {
		return etat;
	}
	public void setEtat(int etat) {
		this.etat = etat;
	}
	public String getMembre() {
		return membre;
	}
	public void setMembre(String membre) {
		this.membre = membre;
	}
	public String getReference() {
		return reference;
	}
	public void setReference(String reference) {
		this.reference = reference;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	
}
