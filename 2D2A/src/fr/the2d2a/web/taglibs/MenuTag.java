package fr.the2d2a.web.taglibs;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.apache.log4j.Logger;

import fr.the2d2a.bean.Rubrique;
import fr.the2d2a.utils.LinkHelper;
import fr.the2d2a.web.constants.ParamConstants;
import fr.the2d2a.web.constants.WebConstants;

public class MenuTag extends BodyTagSupport {
	
	private static final long serialVersionUID = 1846744974270621587L;

	private static Logger logger = Logger.getLogger(MenuTag.class);

	private String varRetour = "menu";
	private String typeRubrique = "1";
	
	private int idParent = -1;
	
	private List<Rubrique> menu;
	private Map<Integer, Rubrique> menuMap;
	
	@SuppressWarnings("unchecked")
	@Override
	public int doStartTag() throws JspException {
		
		logger.debug("Start TagMenu");
		HttpServletRequest req = (HttpServletRequest) pageContext.getRequest();
		String lang = (String)req.getSession().getAttribute(WebConstants.LANGUE);
		menu = (List<Rubrique>)req.getSession().getAttribute(WebConstants.MENU_ + lang);
		menuMap = (Map<Integer, Rubrique>)req.getSession().getAttribute(WebConstants.MENU_ + WebConstants.MAP_ + lang);
		
		String root = (String)pageContext.getServletContext().getAttribute(WebConstants.ROOT);
		
		//Construction menu
		StringBuffer sb = new StringBuffer();		
		
		int profondeur = 0;
		sb.append("<ul class='ul_menu' id='").append(varRetour).append("'>");
		this.sortMenu(idParent, sb, profondeur, root);
		sb.append("</ul>");
		
		pageContext.setAttribute(varRetour, sb.toString());
		//logger.debug(sb.toString());
		logger.debug("End TagMenu");
		return SKIP_BODY;
	}
	
	private void sortMenu(int id, StringBuffer sb, int profondeur, String root) {
		boolean first = true;	
		profondeur++;
		for(Rubrique rub : menu) {			
			if (rub.getRub_rubId() == id) {
				if (first) {
					if (profondeur == 1) {
						sb.append("<ul class='ul_menu_parent'>");
					}
					if (profondeur >= 2) {
							sb.append("<ul class='ul_menu_children'>");
					}
					first = false;
				}
				//creation du lien
				String link = LinkHelper.createLinkFromRubrique(menuMap, rub.getRubId(), root, typeRubrique);
				//logger.debug(link);
				switch (profondeur) {
				case 1 :
					//sb.append("<li><a class='link_left_menu_top' href='#'><div class='button_left_menu_top_first'><center>").append(rub.getNom()).append("</center></div></a>");
					
					//POST
					//sb.append("<li><form name='rubrique").append(rub.getRubId()).append("' action='").append(link).append("' method='POST'><input type='hidden' name='").append(ParamConstants.RUBRIQUE).append("' value='").append(rub.getRubId()).append("' /><a id='a_menu' href='#' onclick='document.rubrique").append(rub.getRubId()).append(".submit();'>").append(rub.getNom()).append("</a></form>");
					
					//GET
					sb.append("<li><a href='").append(link).append("?").append(ParamConstants.RUBRIQUE).append("=").append(rub.getRubId()).append("'>").append(rub.getNom()).append("</a>");
					
					break;
				default :
					//POST
					//sb.append("<li class='menu_li_children'><form name='rubrique").append(rub.getRubId()).append("' action='").append(link).append("' method='POST'><input type='hidden' name='").append(ParamConstants.RUBRIQUE).append("' value='").append(rub.getRubId()).append("' /><a id='a_menu' href='#' onclick='document.rubrique").append(rub.getRubId()).append(".submit();'>").append(rub.getNom()).append("</a></form>");
					
					//GET
					sb.append("<li class='menu_li_children'><a id='a_menu' href='").append(link).append("?").append(ParamConstants.RUBRIQUE).append("=").append(rub.getRubId()).append("'>").append(rub.getNom()).append("</a>");
					break;
				}
				sortMenu(rub.getRubId(), sb, profondeur, root);
				sb.append("</li>");
			}
		}
		if (!first) {
			sb.append("</ul>");
		}
	}
	
	public String getVarRetour() {
		return varRetour;
	}

	public void setVarRetour(String varRetour) {
		this.varRetour = varRetour;
	}

	public int getIdParent() {
		return idParent;
	}

	public void setIdParent(int idParent) {
		this.idParent = idParent;
	}

	public String getTypeRubrique() {
		return typeRubrique;
	}

	public void setTypeRubrique(String typeRubrique) {
		this.typeRubrique = typeRubrique;
	}
	
}
