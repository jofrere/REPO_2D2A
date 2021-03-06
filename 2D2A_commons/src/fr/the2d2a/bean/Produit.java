package fr.the2d2a.bean;


import java.io.Serializable;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;

public class Produit implements Serializable {
	
	private static final long serialVersionUID = 9026645239294347250L;
	
	private static NumberFormat nbFormat = NumberFormat.getIntegerInstance();
	
	//Globaux
	private int proId;
	private String reference;
    private int visuLang;
    private int quantite;
    private Integer achatDepot;
    private Date dateEntree;
    
    //LANG
    private String nom;
    private String information;
    private String description;
    private String materiaux;
    private String poids;
    private String hauteur;
    private String largeur;
    private String profondeur;
    private String diametre;
    private String descAnnee;
    private String signeApp;
    private float prix;
    private int dispoLoc;
    private String keyword;
    private float prixAchat;
    private String friendlyName;
    private Float prixLoc;
    
    
    //FOREIGN KEYS
    private int paysId;
    private int desId;
    private int ediId;    
    
    //OTHER TABLES
    private Pays pays;
    private List<Coloris> coloris;
    private List<SpecificiteProduit> specs;
    private Designer designer;
    private Editeur editeur;
    private List<ImageProduit> images;
    private List<Produit> produitsAssociated;
    
    private int idRubrique;
    
    //pour le BO
    private String lang;
    private int action;
    
    private List<Rubrique> rubriques;
    
    private String[] rubriquesId = new String[0];
    private String rubId;
    private String[] colorisId = new String[0];
    private String colId;
    private String[] specId = new String[0];
    private String speId;
    private List<String> prodsAssocId = new ArrayList();
    private String prodAssocId;
    private String dateEntreeStr;
    
    //pour les paniers
    private float tva = (float) 19.6;
    private int quantiteReservee = 0;
    
    private String link;
    
    @SuppressWarnings("unchecked")
	public Produit() {
    	images = LazyList.decorate(new ArrayList<ImageProduit>(), FactoryUtils.instantiateFactory(ImageProduit.class));
    	prodsAssocId = LazyList.decorate(new ArrayList<String>(), FactoryUtils.instantiateFactory(String.class));
    	rubriques = LazyList.decorate(new ArrayList<Rubrique>(), FactoryUtils.instantiateFactory(Rubrique.class));
	}
    
	public int getProId() {
		return proId;
	}
	public void setProId(int id) {
		this.proId = id;
	}
	public String getReference() {
		return reference;
	}
	public void setReference(String reference) {
		this.reference = reference;
	}
	public int getVisuLang() {
		return visuLang;
	}
	public void setVisuLang(int visuLang) {
		this.visuLang = visuLang;
	}
	public int getQuantite() {
		return quantite;
	}
	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getInformation() {
		return information;
	}
	public void setInformation(String information) {
		this.information = information;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getMateriaux() {
		return materiaux;
	}
	public void setMateriaux(String materiaux) {
		this.materiaux = materiaux;
	}
	public String getPoids() {
		return poids;
	}
	public void setPoids(String poids) {
		this.poids = poids;
	}
	public String getHauteur() {
		return hauteur;
	}
	public void setHauteur(String hauteur) {
		this.hauteur = hauteur;
	}
	public String getLargeur() {
		return largeur;
	}
	public void setLargeur(String largeur) {
		this.largeur = largeur;
	}
	public String getProfondeur() {
		return profondeur;
	}
	public void setProfondeur(String profondeur) {
		this.profondeur = profondeur;
	}
	public String getDiametre() {
		return diametre;
	}
	public void setDiametre(String diametre) {
		this.diametre = diametre;
	}
	public String getDescAnnee() {
		return descAnnee;
	}
	public void setDescAnnee(String descAnnee) {
		this.descAnnee = descAnnee;
	}
	public String getSigneApp() {
		return signeApp;
	}
	public void setSigneApp(String signeApp) {
		this.signeApp = signeApp;
	}
	public Float getPrix() {
		return prix;
	}
	public String getPrixFormate() {
		nbFormat.setMaximumFractionDigits(2);
		nbFormat.setMinimumFractionDigits(2);
		return nbFormat.format(prix);
	}
	public void setPrix(Float prix) {
		
		this.prix = prix != null ? prix :0f;
	}
	public int getDispoLoc() {
		return dispoLoc;
	}
	public void setDispoLoc(int dispoLoc) {
		this.dispoLoc = dispoLoc;
	}
	public Pays getPays() {
		return pays;
	}
	public void setPays(Pays pays) {
		this.pays = pays;
	}
	public List<Coloris> getColoris() {
		return coloris;
	}
	public void setColoris(List<Coloris> coloris) {
		this.coloris = coloris;
	}	
	public Designer getDesigner() {
		return designer;
	}
	public void setDesigner(Designer designer) {
		this.designer = designer;
	}
	public Editeur getEditeur() {
		return editeur;
	}
	public void setEditeur(Editeur editeur) {
		this.editeur = editeur;
	}
	public List<ImageProduit> getImages() {
		return images;
	}
	public void setImages(List<ImageProduit> images) {
		this.images = images;
	}
	public int getPaysId() {
		return paysId;
	}
	public void setPaysId(int paysId) {
		this.paysId = paysId;
	}
	public int getDesId() {
		return desId;
	}
	public void setDesId(int desId) {
		this.desId = desId;
	}
	public int getEdiId() {
		return ediId;
	}
	public void setEdiId(int ediId) {
		this.ediId = ediId;
	}
	public List<SpecificiteProduit> getSpecs() {
		return specs;
	}
	public void setSpecs(List<SpecificiteProduit> specs) {
		this.specs = specs;
	}	
	public int getIdRubrique() {
		return idRubrique;
	}
	public void setIdRubrique(int idRubrique) {
		this.idRubrique = idRubrique;
	}
	public String getXmlImages() {
		StringBuffer sb = new StringBuffer("<?xml version='1.0' encoding='UTF-8'?><galleries><gallery id='Autres vues'><description>description</description>");
		for (ImageProduit image : images) {
			sb.append("<photo><name>nom</name><description>description</description><source>/2D2A/").append(image.getPhoto()).append("</source></photo>");
		}
		sb.append("</gallery></galleries>");
		return sb.toString();
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
	public List<Rubrique> getRubriques() {
		return rubriques;
	}
	public void setRubriques(List<Rubrique> rubriques) {
		this.rubriques = rubriques;
	}
	public String[] getRubriquesId() {
		return rubriquesId;
	}
	public void setRubriquesId(String[] rubriquesId) {
		this.rubriquesId = rubriquesId;
	}
	public String[] getColorisId() {
		return colorisId;
	}
	public void setColorisId(String[] colorisId) {
		this.colorisId = colorisId;
	}

	public String[] getSpecId() {
		return specId;
	}

	public void setSpecId(String[] specId) {
		this.specId = specId;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Integer getAchatDepot() {
		return achatDepot;
	}

	public void setAchatDepot(Integer achatDepot) {
		this.achatDepot = achatDepot;
	}

	public String getColId() {
		return colId;
	}

	public void setColId(String colId) {
		this.colId = colId;
	}

	public String getSpeId() {
		return speId;
	}

	public void setSpeId(String speId) {
		this.speId = speId;
	}

	public String getRubId() {
		return rubId;
	}

	public void setRubId(String rubId) {
		this.rubId = rubId;
	}

	public List<Produit> getProduitsAssociated() {
		return produitsAssociated;
	}

	public void setProduitsAssociated(List<Produit> produitsAssociated) {
		this.produitsAssociated = produitsAssociated;
	}

	public List<String> getProdsAssocId() {
		return prodsAssocId;
	}

	public void setProdsAssocId(List<String> prodsAssocId) {
		this.prodsAssocId = prodsAssocId;
	}

	public String getProdAssocId() {
		return prodAssocId;
	}

	public void setProdAssocId(String prodAssocId) {
		this.prodAssocId = prodAssocId;
	}
	
	//pour les paniers
	public String getPrixHt() {
		nbFormat.setMaximumFractionDigits(2);
		nbFormat.setMinimumFractionDigits(2);
		return nbFormat.format(prix * 100 / (100+tva));
	}
	
	public int getQuantiteReservee() {
		return quantiteReservee;
	}

	public void setQuantiteReservee(int quantiteReservee) {
		this.quantiteReservee = quantiteReservee;
	}
	public Float getPrixTotal() {
		return this.getPrix() * this.getQuantiteReservee();
	}
	public String getPrixTotalFormate() {
		nbFormat.setMaximumFractionDigits(2);
		nbFormat.setMinimumFractionDigits(2);
		return nbFormat.format(this.getPrix() * this.getQuantiteReservee());
	}
	public float getTva() {
		return tva;
	}
	public void setTva(float tva) {
		this.tva = tva;
	}

	public float getPrixAchat() {
		return prixAchat;
	}

	public void setPrixAchat(Float prixAchat) {
		this.prixAchat = prixAchat != null ? prixAchat : 0f;
	}

	public Date getDateEntree() {
		return dateEntree;
	}

	public void setDateEntree(Date dateEntree) {
		this.dateEntree = dateEntree;
	}

	public String getDateEntreeStr() {
		return dateEntreeStr;
	}

	public void setDateEntreeStr(String dateEntreeStr) {
		this.dateEntreeStr = dateEntreeStr;
	}

	public String getFriendlyName() {
		return friendlyName;
	}

	public void setFriendlyName(String friendlyName) {
		this.friendlyName = friendlyName;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public float getPrixLoc() {
		return prixLoc;
	}

	public void setPrixLoc(float prixLoc) {
		this.prixLoc = prixLoc;
	}
	public String getPrixLocFormate() {
		nbFormat.setMaximumFractionDigits(2);
		nbFormat.setMinimumFractionDigits(2);
		return nbFormat.format(prixLoc);
	}
	public float getPrixLocTotal() {
		return this.getPrixLoc() * this.getQuantiteReservee();
	}
	public String getPrixLocTotalFormate() {
		nbFormat.setMaximumFractionDigits(2);
		nbFormat.setMinimumFractionDigits(2);
		return nbFormat.format(this.getPrixLoc() * this.getQuantiteReservee());
	}
}
