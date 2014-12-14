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

public class PictoTag extends BodyTagSupport {
		
	private static final long serialVersionUID = 4251566456994655737L;

	private static Logger logger = Logger.getLogger(PictoTag.class);

	private String varRetour = "picto";
	private String typeRubrique = "1";
	
	private int idRub = 0;
	
	@SuppressWarnings("unchecked")
	@Override
	public int doStartTag() throws JspException {
		
		logger.debug("Start PictoMenu with rub Id : " + idRub);
		
		HttpServletRequest req = (HttpServletRequest) pageContext.getRequest();
		String lang = (String)req.getSession().getAttribute(WebConstants.LANGUE);
		List<Rubrique> menu = (List<Rubrique>)req.getSession().getAttribute(WebConstants.MENU_ + lang);
		List<Rubrique> rubriques = new ArrayList<Rubrique>();
		Map<Integer, Rubrique> menuMap = (Map<Integer, Rubrique>)req.getSession().getAttribute(WebConstants.MENU_ + WebConstants.MAP_ + lang);
		String root = (String)pageContext.getServletContext().getAttribute(WebConstants.ROOT);
		
		for (Rubrique rub : menu) {
			if (rub.getRub_rubId() == idRub) {				
				rubriques.add(rub);
				String link = LinkHelper.createLinkFromRubrique(menuMap, rub.getRubId(), root, typeRubrique);
				rub.setLink(link);
			}
		}		
		pageContext.setAttribute(varRetour, rubriques);
		
		return SKIP_BODY;
		
	}

	public String getVarRetour() {
		return varRetour;
	}

	public void setVarRetour(String varRetour) {
		this.varRetour = varRetour;
	}

	public int getIdRub() {
		return idRub;
	}

	public void setIdRub(int idRub) {
		this.idRub = idRub;
	}

	public String getTypeRubrique() {
		return typeRubrique;
	}

	public void setTypeRubrique(String typeRubrique) {
		this.typeRubrique = typeRubrique;
	}
	
}
