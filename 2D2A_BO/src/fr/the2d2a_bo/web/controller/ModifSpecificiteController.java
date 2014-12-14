package fr.the2d2a_bo.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.InternalResourceView;

import fr.the2d2a.bean.SpecificiteProduit;
import fr.the2d2a.service.SpecificiteService;

public class ModifSpecificiteController extends SimpleFormController {

		protected static Logger logger = Logger.getLogger(ModifSpecificiteController.class);
		
		private SpecificiteService specificiteService;
		
		@Override
		protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {
			
			logger.info("In onSubmit ModifSpecificiteController...");
			
			SpecificiteProduit spec = (SpecificiteProduit)command;
			logger.debug("Visu de la current action : " + spec.getAction());
			switch (spec.getAction()) {
				case 1:
				case 2:
					request.setAttribute("command", command);
					return this.showForm(request, response, errors);				
				case 3:
					specificiteService.deleteSpec(spec.getSpeId());
					break;
				case 4:				
				case 5:	
					if (spec.getAction() == 5) {
						specificiteService.updateSpec(spec);
					}
					else {
						logger.debug("Creation de la specificite dans les 2 langues.");
						specificiteService.insertSpec(spec);
					}
					
					break;
				default:
					break;
			}
			

			return new ModelAndView(new InternalResourceView(this.getSuccessView()));
		}

		@Override
		protected ModelAndView showForm(HttpServletRequest request, HttpServletResponse response, BindException errors) throws Exception {
			logger.info("In showForm ModifSpecificiteController...");
			
			Map<String, Object> model = new HashMap<String, Object>();
			
			//cas update
			SpecificiteProduit spec = (SpecificiteProduit)request.getAttribute("command");
			model.put("specificite", spec);
			
			if (spec.getAction() == 2)
				spec.setAction(5);
			if (spec.getAction() == 1)
				spec.setAction(4);
			
			return new ModelAndView(this.getFormView(), model);
		}

		public void setSpecificiteService(SpecificiteService specificiteService) {
			this.specificiteService = specificiteService;
		}
}
