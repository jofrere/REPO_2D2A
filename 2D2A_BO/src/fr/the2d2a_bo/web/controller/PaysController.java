package fr.the2d2a_bo.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import fr.the2d2a.bean.Pays;
import fr.the2d2a.service.PaysService;

public class PaysController implements Controller {

	protected static Logger logger = Logger.getLogger(PaysController.class);
	
	private PaysService paysService;
	
	public ModelAndView handleRequest(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		logger.debug("In handleRequest PaysController...");
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		List<Pays> liste = paysService.getAllPays();
		model.put("listePays", liste);
		
		return new ModelAndView("pays", model);
	}

	public void setPaysService(PaysService paysService) {
		this.paysService = paysService;
	}
}
