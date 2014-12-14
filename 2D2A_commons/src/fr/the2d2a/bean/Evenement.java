package fr.the2d2a.bean;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;

import fr.the2d2a.web.constants.WebConstants;

public class Evenement implements Serializable {

	private static final long serialVersionUID = 6862587105976537355L;
	
	private static SimpleDateFormat sdf = new SimpleDateFormat(WebConstants.PATTERN_DATE_EVT);
	
	private int eveId;
	private int rubId;
	private Date dateDebut;
	private Date dateFin;
	private String horaire;
	private String departement;
	private String ville;
	private String lieu;
	private String adresse;
	private String designationInfo;
	private String theme;
	private int nbExposant;
	private int nbVisiteur;
	private String tel;
	private String fax;
	private String webSite;
	private String email;
	private float prix;
	private String titre;
	private int type;
	private int visible;
	
	private List<ImageEvenement> images;
	
//	private String dateDebutStr;
//	private String dateFinStr;
	
	// BO
	private int action;
	private String lang;
	
	@SuppressWarnings("unchecked")
	public Evenement() {
    	images = LazyList.decorate(new ArrayList<ImageEvenement>(), FactoryUtils.instantiateFactory(ImageEvenement.class));
	}
	
	public int getEveId() {
		return eveId;
	}
	public void setEveId(int id) {
		this.eveId = id;
	}
	public int getRubId() {
		return rubId;
	}
	public void setRubId(int rubId) {
		this.rubId = rubId;
	}
	public Date getDateDebut() {
		return dateDebut;
	}
	public String getDateDebutStr() {
		if (dateDebut != null)
			return sdf.format(dateDebut);
		else
			return "";
	}
	public void setDateDebut(Date dateDebut) {
		this.dateDebut = dateDebut;
	}
	public Date getDateFin() {
		return dateFin;
	}
	
	//(dateFin == null) ? "" : sdf.format(dateFin)
	
	public String getDateFinStr() {
		if (dateFin != null)
			return sdf.format(dateFin);
		else
			return "";
	}
	public void setDateFin(Date dateFin) {
		this.dateFin = dateFin;
	}
	public String getHoraire() {
		return horaire;
	}
	public void setHoraire(String horaire) {
		this.horaire = horaire;
	}
	public String getDepartement() {
		return departement;
	}
	public void setDepartement(String departement) {
		this.departement = departement;
	}
	public String getVille() {
		return ville;
	}
	public void setVille(String ville) {
		this.ville = ville;
	}
	public String getLieu() {
		return lieu;
	}
	public void setLieu(String lieu) {
		this.lieu = lieu;
	}
	public String getAdresse() {
		return adresse;
	}
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	public String getDesignationInfo() {
		return designationInfo;
	}
	public void setDesignationInfo(String designationInfo) {
		this.designationInfo = designationInfo;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	public int getNbExposant() {
		return nbExposant;
	}
	public void setNbExposant(int nbExposant) {
		this.nbExposant = nbExposant;
	}
	public int getNbVisiteur() {
		return nbVisiteur;
	}
	public void setNbVisiteur(int nbVisiteur) {
		this.nbVisiteur = nbVisiteur;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getWebSite() {
		return webSite;
	}
	public void setWebSite(String webSite) {
		this.webSite = webSite;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public float getPrix() {
		return prix;
	}
	public void setPrix(float prix) {
		this.prix = prix;
	}
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getVisible() {
		return visible;
	}
	public void setVisible(int visible) {
		this.visible = visible;
	}
	public List<ImageEvenement> getImages() {
		return images;
	}
	public void setImages(List<ImageEvenement> images) {
		this.images = images;
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

	public void setDateDebutStr(String dateDebutStr) {
		try {
			this.setDateDebut(sdf.parse(dateDebutStr));
		} catch (ParseException e) {
			e.printStackTrace();
		}
//		this.dateDebutStr = dateDebutStr;
	}

	public void setDateFinStr(String dateFinStr) {
		try {
			this.setDateFin(sdf.parse(dateFinStr));
		} catch (ParseException e) {
			e.printStackTrace();
		}
//		this.dateFinStr = dateFinStr;
	}
}
