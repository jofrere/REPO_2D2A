package fr.the2d2a.web.taglibs;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.apache.log4j.Logger;

import fr.the2d2a.bean.Rubrique;
import fr.the2d2a.utils.LinkHelper;
import fr.the2d2a.web.constants.WebConstants;

public class FilArianeTag extends BodyTagSupport {

	private static final long serialVersionUID = 1079355610520015225L;

	private static Logger logger = Logger.getLogger(FilArianeTag.class);

	private String varRetour = "filAriane";
	private String typeRubrique = "1";
	
	private int idRub = 0;
	
	@SuppressWarnings("unchecked")
	public int doStartTag() throws JspException {
		
		logger.debug("doStartTag of FilArianeTag with rub Id : " + idRub + " and typeRubrique : " + typeRubrique);
		
		HttpServletRequest req = (HttpServletRequest) pageContext.getRequest();
		req.getAttribute("rubrique");
		String lang = (String)req.getSession().getAttribute(WebConstants.LANGUE);
		List<Rubrique> rubriques = new ArrayList<Rubrique>();
		Map<Integer, Rubrique> menuMap = (Map<Integer, Rubrique>)req.getSession().getAttribute(WebConstants.MENU_ + WebConstants.MAP_ + lang);
		String root = (String)pageContext.getServletContext().getAttribute(WebConstants.ROOT);
				
		Rubrique current = menuMap.get(idRub);
		if (current != null) {
			while (current.getRub_rubId() > 0) {
				logger.info("Current : " + current.getFriendlyName());
				String link = LinkHelper.createLinkFromRubrique(menuMap, current.getRubId(), root, typeRubrique);
				current.setLink(link);
				rubriques.add(0, current);
				current = menuMap.get(current.getRub_rubId());
			}
			logger.debug("Current : " + current.getFriendlyName());
			String link = LinkHelper.createLinkFromRubrique(menuMap, current.getRubId(), root, typeRubrique);
			current.setLink(link);
			rubriques.add(0, current);
		} else {
			//cas sp�cifiques (pas ds une boutique)
			logger.debug(req.getRequestURI());
			Rubrique mito = new Rubrique();
			if (req.getRequestURI().endsWith("inscription.jsp")) {
				mito.setNom("Devenir Membre");
				rubriques.add(mito);
			}
			if (req.getRequestURI().endsWith("successInscription.jsp")) {
				mito.setNom("Devenir Membre - Identification");
				rubriques.add(mito);
			}
			if (req.getRequestURI().endsWith("activation.jsp")) {
				mito.setNom("Devenir Membre - Bienvenue");
				rubriques.add(mito);
			}
			if (req.getRequestURI().endsWith("conditionsGenerales.jsp")) {
				mito.setNom("Conditions g�n�rales");
				rubriques.add(mito);
			}
			if (req.getRequestURI().endsWith("monCompte.jsp")) {
				mito.setNom("Mon compte");
				rubriques.add(mito);
			}
			if (req.getRequestURI().endsWith("planSite.jsp")) {
				mito.setNom("Informations - Plan du site");
				rubriques.add(mito);
			}
			if (req.getRequestURI().endsWith("calendrier.jsp")) {
				mito.setNom("Actualit�s - Calendrier");
				rubriques.add(mito);
			}
			if (req.getRequestURI().endsWith("presse.jsp")) {
				mito.setNom("Actualit�s - Coin Presse");
				rubriques.add(mito);
			}
			if (req.getRequestURI().endsWith("agenda.jsp")) {
				mito.setNom("Actualit�s - Agenda");
				rubriques.add(mito);
			}
			if (req.getRequestURI().endsWith("bibliotheque.jsp")) {
				mito.setNom("Actualit�s - Biblioth�que");
				rubriques.add(mito);
			}
			if (req.getRequestURI().endsWith("epot.jsp")) {
				mito.setNom("Services - D�posez vos objets");
				rubriques.add(mito);
			}
			if (req.getRequestURI().endsWith("inviterAmi.jsp")) {
				mito.setNom("Inviter un ami");
				rubriques.add(mito);
			}
			if (req.getRequestURI().endsWith("mesAchats.jsp")) {
				mito.setNom("Mon compte - Mes achats");
				rubriques.add(mito);
			}
			if (req.getRequestURI().endsWith("mesCoordonnees.jsp")) {
				mito.setNom("Mon compte - Mon profil");
				rubriques.add(mito);
			}
			if (req.getRequestURI().endsWith("mesAdresses.jsp")) {
				mito.setNom("Mon compte - Mon profil - Mes adresses");
				rubriques.add(mito);
			}
			if (req.getRequestURI().endsWith("detailCommande.jsp")) {
				mito.setNom("Mon compte - Mes achats - D�tail d'une commande");
				rubriques.add(mito);
			}
			if (req.getRequestURI().endsWith("erviceGeneral.jsp")) {
				mito.setNom("Services - Formulaire g�n�ral");
				rubriques.add(mito);
			}
			if (req.getRequestURI().endsWith("erviceOuvrage.jsp")) {
				mito.setNom("Services - Formulaire ouvrage");
				rubriques.add(mito);
			}
			if (req.getRequestURI().endsWith("erviceEvenement.jsp")) {
				mito.setNom("Services - Formulaire �v�nement");
				rubriques.add(mito);
			}
			if (req.getRequestURI().endsWith("erviceArchives.jsp")) {
				mito.setNom("Services - Formulaire social");
				rubriques.add(mito);
			}
			if (req.getRequestURI().endsWith("recherche.jsp")) {
				mito.setNom("Services - Recherche avanc�e");
				rubriques.add(mito);
			}
			if (req.getRequestURI().endsWith("location.jsp") || req.getRequestURI().endsWith("locationValidation.jsp")) {
				mito.setNom("Services - Demande de location");
				rubriques.add(mito);
			}
			if (req.getRequestURI().endsWith("quiSommesNous.jsp")) {
				mito.setNom("Informations - Qui sommes nous ?");
				rubriques.add(mito);
			}
			if (req.getRequestURI().endsWith("contact.jsp")) {
				mito.setNom("Informations - Contact");
				rubriques.add(mito);
			}
			if (req.getRequestURI().endsWith("infosLegales.jsp")) {
				mito.setNom("Informations - Infos L�gales");
				rubriques.add(mito);
			}
			if (req.getRequestURI().endsWith("serviceClient.jsp")) {
				mito.setNom("Informations - Service client");
				rubriques.add(mito);
			}
			if (req.getRequestURI().endsWith("aide.jsp")) {
				mito.setNom("Informations - Aide");
				rubriques.add(mito);
			}
		}
		
		pageContext.setAttribute(varRetour, rubriques);
		
		return SKIP_BODY;
	}

	public void setVarRetour(String varRetour) {
		this.varRetour = varRetour;
	}

	public void setIdRub(int idRub) {
		this.idRub = idRub;
	}

	public void setTypeRubrique(String typeRubrique) {
		this.typeRubrique = typeRubrique;
	}
}
