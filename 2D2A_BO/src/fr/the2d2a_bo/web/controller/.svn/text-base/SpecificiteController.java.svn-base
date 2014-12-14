package fr.the2d2a_bo.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import fr.the2d2a.bean.SpecificiteProduit;
import fr.the2d2a.service.SpecificiteService;

public class SpecificiteController implements Controller {

	protected static Logger logger = Logger.getLogger(SpecificiteController.class);
	
	private SpecificiteService specificiteService;
	
	public ModelAndView handleRequest(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		logger.debug("In handleRequest SpecificiteController...");
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		List<SpecificiteProduit> liste = specificiteService.getAllSpec();
		model.put("listeSpec", liste);
		
		return new ModelAndView("specificite", model);
	}

	public void setSpecificiteService(SpecificiteService specificiteService) {
		this.specificiteService = specificiteService;
	}

}
