package fr.the2d2a.web.taglibs;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.apache.log4j.Logger;

import fr.the2d2a.bean.Rubrique;
import fr.the2d2a.utils.LinkHelper;
import fr.the2d2a.web.constants.WebConstants;

public class LeftMenuTag  extends BodyTagSupport {
	
	private static final long serialVersionUID = -8853197251894369698L;

	private static Logger logger = Logger.getLogger(LeftMenuTag.class);

	private String varRetour = "menu";
	private String typeRubrique = "1";
	private int idParent = -1;
	
	private List<Rubrique> menuList;
	private Map<Integer, Rubrique> menuMap;
	
	@SuppressWarnings("unchecked")
	@Override
	public int doStartTag() throws JspException {
		
		StringBuffer menu = new StringBuffer();
		
		if (idParent > 0) {
			logger.debug("Start LeftTagMenu");
			HttpServletRequest req = (HttpServletRequest) pageContext.getRequest();
			String lang = (String) req.getSession().getAttribute(WebConstants.LANGUE);
			menuList = (List<Rubrique>) req.getSession().getAttribute(WebConstants.MENU_ + lang);
			menuMap = (Map<Integer, Rubrique>)req.getSession().getAttribute(WebConstants.MENU_ + WebConstants.MAP_ + lang);
			
			String root = (String)pageContext.getServletContext().getAttribute(WebConstants.ROOT);
			
			Rubrique rubriqueParent = menuMap.get(idParent);
			
			int profondeur = 0;
			menu.append("<div id=\"menuV\">\n");
			menu.append("<div class=\"menuVSep\"><br /></div>\n");
			menu.append("<div class=\"menuVHead magenta\">").append(rubriqueParent.getNom()).append("</div>\n");
			menu.append("<div class=\"menuVSep\"><br /></div>\n");
			menu.append("<div class=\"menuVDeroulant\">");
	        menu.append("<ul class=\"menuVDeroulant\">");
	        
	        this.sortMenu(idParent, menu, profondeur, root);
			
	        menu.append("</ul></div></div>");
		}
		
		pageContext.setAttribute(varRetour, menu.toString());
		
		return SKIP_BODY;
	}
	
	private void sortMenu(int parentId, StringBuffer menuBuffer, int profondeur, String root) {
		boolean first = true;
		profondeur++;
		for (Rubrique rub : menuList) {
			if (rub.getRub_rubId() == parentId) {
				
				//creation du lien
				String link = LinkHelper.createLinkFromRubrique(menuMap, rub.getRubId(), root, typeRubrique);
				//logger.debug(link);
				switch (profondeur) {
					case 1 :
						//POST
						//menuBuffer.append("<li><form name='rubrique").append(rub.getRubId()).append("' action='").append(link).append("' method='POST'><input type='hidden' name='").append(ParamConstants.RUBRIQUE).append("' value='").append(rub.getRubId()).append("' /><a id='a_menu' href='#' onclick='document.rubrique").append(rub.getRubId()).append(".submit();'>").append(rub.getNom()).append("</a></form>");
						menuBuffer.append("<li><a  href='").append(link).append("'><span>").append(rub.getNom()).append("</span></a>");
						
						break;
					default :
						if (first) {
							menuBuffer.append("<ul>\n");
							first = false;
						}
						//POST
						//menuBuffer.append("<li class='menu_li_children'><form name='rubrique").append(rub.getRubId()).append("' action='").append(link).append("' method='POST'><input type='hidden' name='").append(ParamConstants.RUBRIQUE).append("' value='").append(rub.getRubId()).append("' /><a id='a_menu' href='#' onclick='document.rubrique").append(rub.getRubId()).append(".submit();'>").append(rub.getNom()).append("</a></form>");
						menuBuffer.append("<li><a href='").append(link).append("'><span>").append(rub.getNom()).append("</span></a>");
					
						break;
				}
				sortMenu(rub.getRubId(), menuBuffer, profondeur, root);
				menuBuffer.append("</li>\n");
			}
		}
		if (!first) {
			menuBuffer.append("</ul>");
		}
	}

	public void setVarRetour(String varRetour) {
		this.varRetour = varRetour;
	}

	public void setTypeRubrique(String typeRubrique) {
		this.typeRubrique = typeRubrique;
	}

	public void setIdParent(int idParent) {
		this.idParent = idParent;
	}

}
