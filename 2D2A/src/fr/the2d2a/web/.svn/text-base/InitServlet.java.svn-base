package fr.the2d2a.web;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.log4j.Logger;

import fr.the2d2a.web.constants.WebConstants;

public class InitServlet extends HttpServlet {

	private static final long serialVersionUID = -482223453842240183L;
	private static Logger logger = Logger.getLogger(InitServlet.class);
	
	public void init() throws ServletException {
		logger.info("Start Init");
			
		
		String rootContext = this.getInitParameter(WebConstants.ROOT);
		logger.info("Putting rootContext in scope application :" + rootContext);
		this.getServletContext().setAttribute(WebConstants.ROOT, rootContext);
		
		
		logger.info("Stop Init");
	}
}
