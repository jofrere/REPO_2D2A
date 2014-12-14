package fr.the2d2a.beanform;

import java.io.Serializable;

public class EvenementForm implements Serializable {

	private static final long serialVersionUID = 1874076212323439700L;
	
	private int pageIndex;
	private String rubrique;
	private String selectedDate;
	
	//pour la search
	private String departement;
	private int typeEvt;
	
	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public String getRubrique() {
		return rubrique;
	}

	public void setRubrique(String rubrique) {
		this.rubrique = rubrique;
	}

	public String getDepartement() {
		return departement;
	}

	public void setDepartement(String departement) {
		this.departement = departement;
	}

	public int getTypeEvt() {
		return typeEvt;
	}

	public void setTypeEvt(int typeEvt) {
		this.typeEvt = typeEvt;
	}

	public String getSelectedDate() {
		return selectedDate;
	}

	public void setSelectedDate(String selectedDate) {
		this.selectedDate = selectedDate;
	}
}
