package fr.the2d2a.bean;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class Accueil implements Serializable {

	private static final long serialVersionUID = 3088406522875413034L;
	
	private int accId;
	
	private String titreAccueil;
	private String logoAccueil;
	private String texteAccueil;
	private String imageAccueil;
	
	//pour le BO
	private MultipartFile imageAccueilFile;
	private String lang;
	
	//pour relier à la rubrique
	private String friendlyName;

	public Accueil() {}

	public int getAccId() {
		return accId;
	}
	public void setAccId(int id) {
		this.accId = id;
	}
	public String getTitreAccueil() {
		return titreAccueil;
	}

	public void setTitreAccueil(String titreAccueil) {
		this.titreAccueil = titreAccueil;
	}

	public String getLogoAccueil() {
		return logoAccueil;
	}

	public void setLogoAccueil(String logoAccueil) {
		this.logoAccueil = logoAccueil;
	}

	public String getTexteAccueil() {
		return texteAccueil;
	}

	public void setTexteAccueil(String texteAccueil) {
		this.texteAccueil = texteAccueil;
	}

	public String getImageAccueil() {
		return imageAccueil;
	}

	public void setImageAccueil(String imageAccueil) {
		this.imageAccueil = imageAccueil;
	}


	public MultipartFile getImageAccueilFile() {
		return imageAccueilFile;
	}

	public void setImageAccueilFile(MultipartFile imageTitreFile) {
		this.imageAccueilFile = imageTitreFile;
	}

	public String getLang() {
		return lang;
	}

	public void setLang(String lang) {
		this.lang = lang;
	}

	public String getFriendlyName() {
		return friendlyName;
	}

	public void setFriendlyName(String friendlyName) {
		this.friendlyName = friendlyName;
	}
}
