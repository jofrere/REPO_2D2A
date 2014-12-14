package fr.the2d2a_bo.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import fr.the2d2a.bean.Membre;
import fr.the2d2a.service.MembreService;
import fr.the2d2a.web.constants.WebConstants;
import fr.the2d2a_bo.beanform.FilterMembreForm;

public class MembreController extends SimpleFormController {

	private MembreService membreService;

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		logger.debug("In onSubmit MembreController...");
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		FilterMembreForm filter = (FilterMembreForm) command; 
		
		//gestion des filtres
		logger.debug("Visu de filter : " + ToStringBuilder.reflectionToString(filter));
		
		List<Membre> membres = membreService.getAllMembresWithFilter(filter);
		model.put("listeMembre", membres);
		
		model.put("filter", filter);
		
		return new ModelAndView(this.getSuccessView(), model);
	}

	@Override
	protected ModelAndView showForm(HttpServletRequest request,
			HttpServletResponse response, BindException errors)
			throws Exception {
		logger.debug("In showForm CommandeController...");

		Map<String, Object> model = new HashMap<String, Object>();

		List<Membre> membres = membreService.getAllMembres();
		System.out.println("Visu des membres : " + membres.size());
		model.put("listeMembre", membres);
		model.put("filter", new FilterMembreForm());
//		request.getSession().removeAttribute("oldSort");
		
		return new ModelAndView(this.getFormView(), model);
	}

	public void setMembreService(MembreService membreService) {
		this.membreService = membreService;
	}
}
