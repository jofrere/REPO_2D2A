package fr.the2d2a.bean;


public class ServiceEvenement extends Service {

	private static final long serialVersionUID = 3863225709620863309L;

	private int objetDemande;
	private String objetDemandeStr;
	
	private String titre;
	private String description;
	private String designationInfo;
	private String theme;
	private String dateDebut;
	private String dateFin;
	private String horaire;
	private String departement;
	private String ville;
	private String codePostal;
	private String lieu;
	private String adresse;
	private String tel;
	private String fax;
	private String webSite;
	private String email;
	private float prix;
	
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
	public String getDateDebut() {
		return dateDebut;
	}
	public void setDateDebut(String dateDebut) {
		this.dateDebut = dateDebut;
	}
	public String getDateFin() {
		return dateFin;
	}
	public void setDateFin(String dateFin) {
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
	public int getObjetDemande() {
		return objetDemande;
	}
	public void setObjetDemande(int objetDemande) {
		this.objetDemande = objetDemande;
	}
	public String getObjetDemandeStr() {
		return objetDemandeStr;
	}
	public void setObjetDemandeStr(String objetDemandeStr) {
		this.objetDemandeStr = objetDemandeStr;
	}
	public String getCodePostal() {
		return codePostal;
	}
	public void setCodePostal(String codePostal) {
		this.codePostal = codePostal;
	}
}
