package fr.the2d2a.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import fr.the2d2a.bean.Mail;
import fr.the2d2a.service.MailService;
import fr.the2d2a.web.constants.ParamConstants;
import fr.the2d2a.web.constants.WebConstants;

public class SendCommentInterceptor extends HandlerInterceptorAdapter {

	Logger logger = Logger.getLogger(SendCommentInterceptor.class);
	
	private MailService mailService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		logger.debug("In preHandle : " + (String)request.getSession().getAttribute("requestedUrl"));
		
		String sendComment = request.getParameter("sendComment");
		if (StringUtils.isNotEmpty(sendComment)) {
			logger.debug("Envoi de commentaires en cours");
			
			//Recuperation des données
			String referenceProduit = request.getParameter("sendCommentReference");
			String commentaire = request.getParameter("commentaireTxt");
			String mailUser = request.getParameter("commentaireEmail");
			
			logger.debug("Commentaire pour ref " + referenceProduit + " de " + mailUser + " : " + commentaire);
			
			String lang = (String)request.getSession().getAttribute(WebConstants.LANGUE);
			
			Mail mail = mailService.getMail(ParamConstants.MAIL_COMMENT_PRODUCT, lang);
			this.manageMail(mail, referenceProduit, commentaire, mailUser);
			
			mailService.sendMailToAdmin(mail);
			
			
			request.getSession().setAttribute("commentaireSent", "commentaireSent");			
			response.sendRedirect((String)request.getSession().getAttribute("requestedUrl"));
			return false;
		}
				
		return super.preHandle(request, response, handler);
	}

	private void manageMail(Mail mail, String reference, String commentaire, String user) {
		String contenu = mail.getContenu();
		contenu = contenu.replace("$reference", reference);
		contenu = contenu.replace("$commentaire", commentaire);
		contenu = contenu.replace("$user",user);
		mail.setContenu(contenu);
	}
	
	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}
}
