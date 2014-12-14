package fr.the2d2a_bo.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.log4j.Logger;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import fr.the2d2a.bean.FreeTemplate;
import fr.the2d2a.service.MailService;
import fr.the2d2a.web.constants.WebConstants;

public class ModifFreeTemplateController extends SimpleFormController {

	protected static Logger logger = Logger
			.getLogger(ModifFreeTemplateController.class);

	private MailService mailService;

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		logger.info("In onSubmit ModifFreeTemplateController...");

		FreeTemplate freeTemplate = (FreeTemplate) command;

		logger.debug("Visu du template : "
				+ ToStringBuilder.reflectionToString(freeTemplate));

		if (freeTemplate.getAction() == 0) {
			request.setAttribute("freeTemplate", freeTemplate);
			return this.showForm(request, response, errors);
		}

		logger.debug("Modification du freeTemplate");
		mailService.updateConditionsGenerales((String) request.getSession()
				.getAttribute(WebConstants.LANGUE), freeTemplate.getContenu(),
				String.valueOf(freeTemplate.getId()));

		return new ModelAndView(new RedirectView(this.getSuccessView()));
	}

	@Override
	protected ModelAndView showForm(HttpServletRequest request,
			HttpServletResponse response, BindException errors)
			throws Exception {
		logger.info("In showForm ModifFreeTemplateController...");

		Map<String, Object> model = new HashMap<String, Object>();

		FreeTemplate free = (FreeTemplate) request.getAttribute("freeTemplate");

		String lang = (String) request.getSession().getAttribute(
				WebConstants.LANGUE);
		String contenu = mailService.getConditionsGenerales(lang, String
				.valueOf(free.getId()));

		model.put("id", String.valueOf(free.getId()));
		model.put("contenu", contenu);

		return new ModelAndView(this.getFormView(), model);
	}

	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}
}
