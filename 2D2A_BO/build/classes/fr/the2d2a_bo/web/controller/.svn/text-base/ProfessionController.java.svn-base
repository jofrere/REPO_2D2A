package fr.the2d2a_bo.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import fr.the2d2a.bean.Profession;
import fr.the2d2a.service.MembreService;

public class ProfessionController implements Controller {

	protected static Logger logger = Logger.getLogger(ProfessionController.class);
	
	private MembreService membreService;
	
	public ModelAndView handleRequest(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		logger.debug("In handleRequest ProfessionController...");
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		List<Profession> professions = membreService.getAllProfession(null);
		model.put("listeProfessions", professions);
		
		return new ModelAndView("profession", model);
	}

	public void setMembreService(MembreService membreService) {
		this.membreService = membreService;
	}
	
	
}
