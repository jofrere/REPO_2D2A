package fr.the2d2a.utils;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

public class DebugUtils {

	static Logger logger = Logger.getLogger(DebugUtils.class);
	
	@SuppressWarnings("unchecked")
	public static void printRequest(HttpServletRequest request) {
		Enumeration<String> e = request.getParameterNames();
		while (e.hasMoreElements()) {
			String param = (String)e.nextElement();
			String value = request.getParameter(param);
			logger.debug("Param : " + param + " : " + value);
		}
		
		Enumeration e2 = request.getAttributeNames();
		while (e2.hasMoreElements()) {
			String param = (String)e2.nextElement();
			Object value = request.getAttribute(param);
			logger.debug("Attribute : " + param + " : " + value);
		}
	}
	
	@SuppressWarnings("unchecked")
	public static void printSession(HttpServletRequest request) {
		Enumeration e2 = request.getSession().getAttributeNames();
		while (e2.hasMoreElements()) {
			String param = (String)e2.nextElement();
			Object value = request.getSession().getAttribute(param);
			logger.debug("Attribute : " + param + " : " + value);
		}
	}
}
