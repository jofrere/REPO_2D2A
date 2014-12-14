package fr.the2d2a.service.impl;

import java.io.File;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

import fr.the2d2a.bean.FreeTemplate;
import fr.the2d2a.bean.ImageProduit;
import fr.the2d2a.bean.Mail;
import fr.the2d2a.dao.MailDao;
import fr.the2d2a.exception.TechnicalException;
import fr.the2d2a.service.MailService;

public class MailServiceImpl implements MailService {

	private MailDao dao;
	private JavaMailSenderImpl mailSender; 
	
	public void sendMail(String adresseMail, Mail mail) throws TechnicalException {
		try {
			((JavaMailSenderImpl)mailSender).getSession().setDebug(true);
			SimpleMailMessage message = new SimpleMailMessage();
			message.setTo(adresseMail);
			message.setFrom(mail.getExpediteur());
			message.setReplyTo(mail.getReponse());
			message.setSubject(mail.getSujet());
			message.setText(mail.getContenu());
			mailSender.send(message);			
		} catch (MailException e) {
			throw new TechnicalException(e);
		}
	}
	
	public Mail getMail(String id, String lang) throws TechnicalException {
		return dao.getMail(id, lang);
	}
	
	public List<Mail> getAllMails(String lang) throws TechnicalException {
		return dao.getAllMails(lang);
	}
	
	public void updateMailById(Mail mail, String lang) throws TechnicalException {
		dao.updateMailById(mail, lang);
	}
	
	public String getConditionsGenerales(String lang, String id) throws TechnicalException {
		return dao.getConditionsGenerales(lang, id);
	}
	
	public List<FreeTemplate> getAllFreeTemplates(String lang) throws TechnicalException {
		return dao.getAllFreeTemplates(lang);
	}
	
	public void updateConditionsGenerales(String lang, String contenu, String id) throws TechnicalException {
		dao.updateConditionsGenerales(lang, contenu, id);
	}
	
	public void setMailSender(JavaMailSenderImpl mailSender) {
        this.mailSender = mailSender;
    }

	public void setDao(MailDao dao) {
		this.dao = dao;
	}

	public void sendMailToAdmin(Mail mail) throws TechnicalException {
		try {
			//((JavaMailSenderImpl)mailSender).getSession().setDebug(true);
			SimpleMailMessage message = new SimpleMailMessage();
			message.setTo(mail.getExpediteur());
			message.setFrom(mail.getExpediteur());
			message.setReplyTo(mail.getExpediteur());
			message.setSubject(mail.getSujet());
			message.setText(mail.getContenu());
			mailSender.send(message);
		} catch (MailException e) {
			e.printStackTrace();
			throw new TechnicalException(e);
		}
	}
	
	public void sendMailToAdmin(Mail mail, List<ImageProduit> files) throws TechnicalException {
		try {
//			((JavaMailSenderImpl)mailSender).getSession().setDebug(true);
//			Properties props = new Properties();
//			props.setProperty("mail.smtp.starttls.enable", "true");
//			mailSender.setJavaMailProperties(props);
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true);
			helper.setTo(mail.getExpediteur());
			helper.setFrom(mail.getExpediteur());
			helper.setReplyTo(mail.getExpediteur());
			helper.setSubject(mail.getSujet());
			helper.setText(mail.getContenu(), false);

			for (ImageProduit img : files) {
				FileSystemResource file = new FileSystemResource(new File(img.getPhoto()));
				helper.addAttachment(img.getPhotoFile().getName(), file);
			}

			mailSender.send(message);
			
		} catch (MailException e) {
			e.printStackTrace();
			throw new TechnicalException(e);
		} catch (MessagingException e) {
			e.printStackTrace();
			throw new TechnicalException(e);
		}
	}
}
