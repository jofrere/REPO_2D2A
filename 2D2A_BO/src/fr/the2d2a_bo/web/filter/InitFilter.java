package fr.the2d2a_bo.web.filter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import fr.the2d2a.web.constants.WebConstants;
import fr.the2d2a_bo.web.constants.BoConstants;

public class InitFilter implements Filter {

	private Logger logger = Logger.getLogger(InitFilter.class);

	@SuppressWarnings("unused")
	private FilterConfig filterConfig;

	public void doFilter(ServletRequest req, ServletResponse res, FilterChain fc)
			throws java.io.IOException, javax.servlet.ServletException {

		logger.debug("In Filter ");
		// 2 cas : soit demande de login, soit acces site
		String requestedUrl = ((HttpServletRequest) req).getRequestURL().toString();
		String requestedPage = StringUtils.substringAfterLast(requestedUrl, "/");
		if (!requestedPage.equals("login.htm")) {
		
			// Gestion user authenticated
			String user = (String) ((HttpServletRequest) req).getSession()
					.getAttribute(BoConstants.ADMIN_USER);
			if (user == null) {			
				((HttpServletResponse) res)
						.sendRedirect("http://localhost:8080/2D2A_BO/login.htm");
			} else {
	
				// Gestion Langue scope request
				String lang = req.getParameter(WebConstants.LANGUE);
				if (lang == null) {
					if (((HttpServletRequest) req).getSession().getAttribute(
							WebConstants.LANGUE) == null) {
						logger.warn("Language not initialized => Default is "
								+ WebConstants.LANGUE_FR);
						((HttpServletRequest) req).getSession().setAttribute(
								WebConstants.LANGUE, WebConstants.LANGUE_FR);
						((HttpServletResponse) res)
								.sendRedirect("http://localhost:8080/2D2A_BO/accueil.htm");
					} else {
						lang = (String) ((HttpServletRequest) req).getSession()
								.getAttribute(WebConstants.LANGUE);
						logger.info("Current Language " + lang);
						//bug cas on est deja connecté et qu' revient a la  page de debut
						if(StringUtils.isEmpty(requestedPage)) {
							((HttpServletResponse) res)
							.sendRedirect("http://localhost:8080/2D2A_BO/accueil.htm");
						}else {
							fc.doFilter(req, res);
						}
					}
				} else {
					logger.info("Changement de Language " + lang);
					((HttpServletRequest) req).getSession().setAttribute(
							WebConstants.LANGUE, lang);
	
					((HttpServletResponse) res)
							.sendRedirect("http://localhost:8080/2D2A_BO/accueil.htm");
				}
			}
		} else {
			fc.doFilter(req, res);
		}
			
	}

	public void destroy() {
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
	}
}
