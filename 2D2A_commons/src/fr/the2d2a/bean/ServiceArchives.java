package fr.the2d2a.bean;

public class ServiceArchives extends Service {

	private static final long serialVersionUID = 7684769627348556100L;

	
	private String prenom;
	private String nom;
	private String lieuNaissance;
	private String dateNaissance;
	private String dateDeces;
	
	private String[] objetDemande;
	private String biographie;
	private String information;
	private String collaboration;
	private String bibliographie;
	
	private String webSite;
	private String email;

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

	public String getLieuNaissance() {
		return lieuNaissance;
	}

	public void setLieuNaissance(String lieuNaissance) {
		this.lieuNaissance = lieuNaissance;
	}

	public String getDateNaissance() {
		return dateNaissance;
	}

	public void setDateNaissance(String dateNaissance) {
		this.dateNaissance = dateNaissance;
	}

	public String getDateDeces() {
		return dateDeces;
	}

	public void setDateDeces(String dateDeces) {
		this.dateDeces = dateDeces;
	}

	public String[] getObjetDemande() {
		return objetDemande;
	}

	public void setObjetDemande(String[] objetDemande) {
		this.objetDemande = objetDemande;
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

	public String getCollaboration() {
		return collaboration;
	}

	public void setCollaboration(String collaboration) {
		this.collaboration = collaboration;
	}

	public String getBibliographie() {
		return bibliographie;
	}

	public void setBibliographie(String bibliographie) {
		this.bibliographie = bibliographie;
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
}
