package fr.the2d2a.web.interceptor;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import fr.the2d2a.bean.Membre;
import fr.the2d2a.exception.FonctionalException;
import fr.the2d2a.exception.TechnicalException;
import fr.the2d2a.service.MembreService;
import fr.the2d2a.web.constants.WebConstants;

public class AuthenticationInterceptor extends HandlerInterceptorAdapter {

	Logger logger = Logger.getLogger(AuthenticationInterceptor.class);
	
	private MembreService membreService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		logger.debug("In preHandle");
		
		
		String actionAuth = request.getParameter("actionAuth");
		
		if (StringUtils.equals(actionAuth, "0")) {
			String loginAuth = request.getParameter("loginAuth");
			String passwordAuth = request.getParameter("passwordAuth");
	
			String lang = (String) ((HttpServletRequest)request).getSession().getAttribute(WebConstants.LANGUE);
			
			Map<String, Object> model = new HashMap<String, Object>();
			
			
			logger.debug("Authentification");
			try {
				Membre membre = membreService.authenticateMember(loginAuth, passwordAuth, lang);
				request.getSession().setAttribute(WebConstants.AUTHENTICATED_MEMBER, membre);
				response.sendRedirect((String)request.getSession().getAttribute("requestedUrl"));
				return false;
			} catch (FonctionalException e) {
				model.put("authenticationError", "authenticationError");
				response.sendRedirect("/2D2A/monCompte.htm");
			} catch (TechnicalException e) {
				//TODO : gestion 500
				e.printStackTrace();
			}
		}
		
		return super.preHandle(request, response, handler);
	}

	public void setMembreService(MembreService membreService) {
		this.membreService = membreService;
	}
}
