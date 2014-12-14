package fr.the2d2a_bo.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import fr.the2d2a.bean.Coloris;
import fr.the2d2a.service.ColorisService;

public class ColorisController implements Controller {

	protected static Logger logger = Logger.getLogger(ColorisController.class);
	
	private ColorisService colorisService;
	
	public ModelAndView handleRequest(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		logger.debug("In handleRequest ColorisController...");
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		List<Coloris> coloris = colorisService.getAllColoris();
		model.put("listeColoris", coloris);
		
		return new ModelAndView("coloris", model);
	}
	
	public void setColorisService(ColorisService colorisService) {
		this.colorisService = colorisService;
	}

	
}
