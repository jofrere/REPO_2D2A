package fr.the2d2a.bean;

import java.io.Serializable;
import java.text.NumberFormat;

public class CommandeProduit implements Serializable {

	private static final long serialVersionUID = 7983337123484925943L;
	
	private static NumberFormat nbFormat = NumberFormat.getIntegerInstance();
	
	private int id;
	private int quantite;
	private int prixUnitaire;
	private Produit produit;
	private int colId;
	private int proId;
	private Coloris coloris;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getQuantite() {
		return quantite;
	}
	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}
	public int getPrixUnitaire() {
		return prixUnitaire;
	}
	public void setPrixUnitaire(int prixUnitaire) {
		this.prixUnitaire = prixUnitaire;
	}
	public Produit getProduit() {
		return produit;
	}
	public void setProduit(Produit produit) {
		this.produit = produit;
	}
	public int getColId() {
		return colId;
	}
	public void setColId(int colId) {
		this.colId = colId;
	}
	public int getProId() {
		return proId;
	}
	public void setProId(int proId) {
		this.proId = proId;
	}
	public String getPrixUnitaireFormate() {
		nbFormat.setMaximumFractionDigits(2);
		nbFormat.setMinimumFractionDigits(2);
		return nbFormat.format(prixUnitaire);
	}
	public Coloris getColoris() {
		return coloris;
	}
	public void setColoris(Coloris coloris) {
		this.coloris = coloris;
	}
}
