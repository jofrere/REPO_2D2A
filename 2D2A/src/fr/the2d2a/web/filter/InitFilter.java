package fr.the2d2a.web.filter;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import fr.the2d2a.bean.Rubrique;
import fr.the2d2a.exception.FonctionalException;
import fr.the2d2a.exception.TechnicalException;
import fr.the2d2a.service.RubriqueService;
import fr.the2d2a.utils.DateHelper;
import fr.the2d2a.web.constants.WebConstants;

public class InitFilter implements Filter {

	private FilterConfig filterConfig;
	private Logger logger = Logger.getLogger(InitFilter.class);

	@SuppressWarnings("unchecked")
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain fc) throws java.io.IOException, javax.servlet.ServletException {

		//Gestion Langue scope request
		String lang = req.getParameter(WebConstants.LANGUE);
		if (lang == null) {
			lang = req.getParameter(WebConstants.LANGUE_GET);
			if (lang != null) {
				logger.info("Init Language via GET (mail) " + lang);
	    	  	((HttpServletRequest)req).getSession().setAttribute(WebConstants.LANGUE, lang);
			} else if (((HttpServletRequest)req).getSession().getAttribute(WebConstants.LANGUE) == null){
				logger.warn("Language not initialized => Deafult is " + WebConstants.LANGUE_FR);
				((HttpServletRequest)req).getSession().setAttribute(WebConstants.LANGUE, WebConstants.LANGUE_FR);
				lang = WebConstants.LANGUE_FR;
			} else {
				lang = (String) ((HttpServletRequest)req).getSession().getAttribute(WebConstants.LANGUE);
			}

			logger.info("Language in session : " + lang);

			//Gestion du menu en scope session
			List<Rubrique> menu = null;
			if (((HttpServletRequest)req).getSession().getAttribute(WebConstants.MENU_ + lang) == null) {
				WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(filterConfig.getServletContext());
				RubriqueService rm = (RubriqueService) wac.getBean("rubriqueService");

				try {
					menu = rm.getAllRubriques(lang);
				} catch (TechnicalException e) {
					// TODO
					e.printStackTrace();
				} catch (FonctionalException e) {
					// TODO
					e.printStackTrace();
				}

				//creation de la map <ID, rubrique>
				HashMap<Integer, Rubrique> menuMap = new HashMap<Integer, Rubrique>();
				for (Rubrique rub : menu) {
					menuMap.put(rub.getRubId(), rub);
				}
				((HttpServletRequest)req).getSession().setAttribute(WebConstants.MENU_ + lang, menu);
				((HttpServletRequest)req).getSession().setAttribute(WebConstants.MENU_ + WebConstants.MAP_ + lang, menuMap);	
			} else {
				menu = (List<Rubrique>)((HttpServletRequest)req).getSession().getAttribute(WebConstants.MENU_ + lang);
			}

			//Gestion de la date
			String nowStr = DateHelper.formatDate(DateHelper.getPatternAccueil(lang) , new Date(System.currentTimeMillis()), lang);
			req.setAttribute(WebConstants.DATE_TODAY, nowStr);

			//Gestion UrlRewriting
			String requestedUrl = ((HttpServletRequest) req).getRequestURI();
			logger.debug("Visu URL : " + requestedUrl);
			if (!requestedUrl.endsWith("sendComment.htm")) {
				((HttpServletRequest) req).getSession().setAttribute("requestedUrl", requestedUrl);
			}
			String[] urlDecoupe = requestedUrl.split("/");

			String lastPart = urlDecoupe[urlDecoupe.length-1];
			int parentId = 0;
			int currentParentId = 0;
			for (int i = 2; i < urlDecoupe.length; i++) {
				String partUrl = urlDecoupe[i];
				logger.debug("Part traité : " + partUrl);
				if (!partUrl.endsWith(".htm")) {
					//cas d'une rubrique
					if (i == 2) {
						logger.debug("parentId : " + partUrl);
						logger.debug("menu : " + menu);
						
						for (Iterator<Rubrique> it = menu.iterator(); it.hasNext(); ) {
							Rubrique currentRub = it.next();
							//logger.debug("Current rubrique : " + currentRub.getNom());
							if (currentRub.getRub_rubId() < 0 && currentRub.getFriendlyName().equals(partUrl)) {
								parentId = currentRub.getRubId();
								currentParentId = currentRub.getRubId();
							}
						}
					} else {
						// cas d'une sous-rubrique
						if (i != urlDecoupe.length-2) {
							for (Iterator<Rubrique> it = menu.iterator(); it.hasNext(); ) {
								Rubrique currentRub = it.next();
								if (currentRub.getRub_rubId() == currentParentId && currentRub.getFriendlyName().equals(partUrl)) {
									currentParentId = currentRub.getRubId();
								}
							}
						} else {
							// traitement différent en fonction de la page demandée
							if (lastPart.equals("boutique.htm") || lastPart.equals("calendrier.htm")
									|| lastPart.equals("agenda.htm") || lastPart.equals("presse.htm")
									|| lastPart.equals("bibliotheque.htm") || lastPart.equals("archives.htm")) {
								for (Iterator<Rubrique> it = menu.iterator(); it.hasNext(); ) {
									Rubrique currentRub = it.next();
									if (currentRub.getRub_rubId() == currentParentId && currentRub.getFriendlyName().equals(partUrl)) {
										currentParentId = currentRub.getRubId();
									}
								}
							}
						}
					}
				}
			}

			if (parentId != 0) {
				req.setAttribute("parentId", parentId);
			}
			if (currentParentId != 0) {
				req.setAttribute("currentRubriqueId", String.valueOf(currentParentId));
				//Recupérer la rubrique
				Map<Integer, Rubrique> menuMap = (Map<Integer, Rubrique>)((HttpServletRequest) req).getSession().getAttribute(WebConstants.MENU_ + WebConstants.MAP_ + lang);
				Rubrique rubrique = menuMap.get(currentParentId);
				req.setAttribute("rubrique", rubrique);
			}
			
			fc.doFilter(req, res);
			
		} else {
			logger.info("Init Language " + lang);
    	  	((HttpServletRequest)req).getSession().setAttribute(WebConstants.LANGUE, lang);
    	  	String root = (String)filterConfig.getServletContext().getAttribute(WebConstants.ROOT);
    	  	((HttpServletResponse) res).sendRedirect("/"+root+"/");
    	}
	}

	public void destroy() {}

	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig; 	
	}
}