package fr.the2d2a_bo.beanform;

import java.io.Serializable;

public class FilterEvenementForm implements Serializable {

	private static final long serialVersionUID = 7474184128557866984L;
	
	private String dateFin;
	private String dateDebut;
	private int visibilite = -1;
	private int rubrique = -1;
	
	private String dateFinF;
	private String dateDebutF;
	
	public String getDateFin() {
		return dateFin;
	}
	public void setDateFin(String dateFin) {
		this.dateFin = dateFin;
	}
	public int getVisibilite() {
		return visibilite;
	}
	public void setVisibilite(int visibilite) {
		this.visibilite = visibilite;
	}
	public int getRubrique() {
		return rubrique;
	}
	public void setRubrique(int rubrique) {
		this.rubrique = rubrique;
	}
	public String getDateDebut() {
		return dateDebut;
	}
	public void setDateDebut(String dateDebut) {
		this.dateDebut = dateDebut;
	}
	public String getDateFinF() {
		return dateFinF;
	}
	public void setDateFinF(String dateFinF) {
		this.dateFinF = dateFinF;
	}
	public String getDateDebutF() {
		return dateDebutF;
	}
	public void setDateDebutF(String dateDebutF) {
		this.dateDebutF = dateDebutF;
	}
	
	
}
