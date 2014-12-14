package fr.the2d2a.bean;

import java.io.Serializable;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;

public class Ouvrage implements Serializable {

	private static final long serialVersionUID = 4200819291778214815L;
	
	private static NumberFormat nbFormat = NumberFormat.getIntegerInstance();
	
	private String id;
	private String type;
	private String reference;
	private String titre;
	private String auteur;
	private String langue;
	private String annee;
	private String reliure;
	private String format;
	private int nbPages;
	private int nbPhotos;
	private String theme;
	private String sommaire;
	private String information;
	private float prix;
	private int quantite;
	
	private List<ImageOuvrage> images;
	
	//pour les paniers
    private float tva = (float) 5.5;
    private int quantiteReservee = 0;
    
    //pour le BO
    private String lang;
    private int action;
	
	@SuppressWarnings("unchecked")
	public Ouvrage() {
    	images = LazyList.decorate(new ArrayList<ImageOuvrage>(), FactoryUtils.instantiateFactory(ImageOuvrage.class));
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	public String getAuteur() {
		return auteur;
	}
	public void setAuteur(String auteur) {
		this.auteur = auteur;
	}
	public String getLangue() {
		return langue;
	}
	public void setLangue(String langue) {
		this.langue = langue;
	}
	public String getAnnee() {
		return annee;
	}
	public void setAnnee(String annee) {
		this.annee = annee;
	}
	public String getReliure() {
		return reliure;
	}
	public void setReliure(String reliure) {
		this.reliure = reliure;
	}
	public String getFormat() {
		return format;
	}
	public void setFormat(String format) {
		this.format = format;
	}
	public int getNbPages() {
		return nbPages;
	}
	public void setNbPages(int nbPages) {
		this.nbPages = nbPages;
	}
	public int getNbPhotos() {
		return nbPhotos;
	}
	public void setNbPhotos(int nbPhotos) {
		this.nbPhotos = nbPhotos;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	public String getSommaire() {
		return sommaire;
	}
	public void setSommaire(String sommaire) {
		this.sommaire = sommaire;
	}
	public String getInformation() {
		return information;
	}
	public void setInformation(String information) {
		this.information = information;
	}
	public float getPrix() {
		return prix;
	}
	public void setPrix(float prix) {
		this.prix = prix;
	}
	public String getPrixFormate() {
		nbFormat.setMaximumFractionDigits(2);
		nbFormat.setMinimumFractionDigits(2);
		return nbFormat.format(prix);
	}
	public String getReference() {
		return reference;
	}
	public void setReference(String reference) {
		this.reference = reference;
	}

	public List<ImageOuvrage> getImages() {
		return images;
	}

	public void setImages(List<ImageOuvrage> images) {
		this.images = images;
	}

	public float getTva() {
		return tva;
	}

	public void setTva(float tva) {
		this.tva = tva;
	}

	public int getQuantiteReservee() {
		return quantiteReservee;
	}

	public void setQuantiteReservee(int quantiteReservee) {
		this.quantiteReservee = quantiteReservee;
	}
	
	public float getPrixTotal() {
		return this.getPrix() * this.getQuantiteReservee();
	}
	
	public String getPrixTotalFormate() {
		nbFormat.setMaximumFractionDigits(2);
		nbFormat.setMinimumFractionDigits(2);
		return nbFormat.format(this.getPrix() * this.getQuantiteReservee());
	}
	
	public String getPrixHt() {
		nbFormat.setMaximumFractionDigits(2);
		nbFormat.setMinimumFractionDigits(2);
		return nbFormat.format(prix * 100 / (100+tva));
	}

	public int getQuantite() {
		return quantite;
	}

	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}

	public String getLang() {
		return lang;
	}

	public void setLang(String lang) {
		this.lang = lang;
	}

	public int getAction() {
		return action;
	}

	public void setAction(int action) {
		this.action = action;
	}
}
