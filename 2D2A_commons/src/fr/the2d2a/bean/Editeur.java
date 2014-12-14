package fr.the2d2a.bean;

import fr.the2d2a.web.constants.ParamConstants;

public class Editeur extends Artiste {

	private static final long serialVersionUID = 944512912871127509L;
	
	public String getTypeArtiste() {
		return ParamConstants.EDITEUR;
	}
}
