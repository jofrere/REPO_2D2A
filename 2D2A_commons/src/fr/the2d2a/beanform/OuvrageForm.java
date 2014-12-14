package fr.the2d2a.beanform;

import java.io.Serializable;

public class OuvrageForm implements Serializable {

	
	private static final long serialVersionUID = 820443963396186198L;
	
	private int pageIndex;
	private String ouvId;
	private int action;

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public String getOuvId() {
		return ouvId;
	}

	public void setOuvId(String ouvId) {
		this.ouvId = ouvId;
	}

	public int getAction() {
		return action;
	}

	public void setAction(int action) {
		this.action = action;
	}
}
