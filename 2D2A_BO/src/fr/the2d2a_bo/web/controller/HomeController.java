package fr.the2d2a_bo.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import fr.the2d2a_bo.beanform.AdminForm;
import fr.the2d2a_bo.service.AdminService;
import fr.the2d2a_bo.web.constants.BoConstants;

public class HomeController extends SimpleFormController {

    protected static Logger logger = Logger.getLogger(HomeController.class);

    private AdminService adminService;
    
    
	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {
		
		logger.info("In onSubmit HomeController...");
		
		AdminForm admin = (AdminForm) command;
		
		//phase de login
		if (true || adminService.isAutorised(admin.getLogin(), admin.getPwd()))
			request.getSession().setAttribute(BoConstants.ADMIN_USER, BoConstants.ADMIN_USER);
		
		request.setAttribute("loginFailed", "loginFailed");
		
        return this.showForm(request, response, errors);
	}

	@Override
	protected ModelAndView showForm(HttpServletRequest request, HttpServletResponse response, BindException errors) throws Exception {

		logger.info("In showForm HomeController...");
		
		if (request.getSession().getAttribute(BoConstants.ADMIN_USER) != null) {
	        return new ModelAndView(new RedirectView(this.getSuccessView()));
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		if (request.getAttribute("loginFailed") != null)
			model.put("errors", "Erreur d'identification");
				
		return showForm(request, errors, getFormView(), model);
	}
	
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
}
