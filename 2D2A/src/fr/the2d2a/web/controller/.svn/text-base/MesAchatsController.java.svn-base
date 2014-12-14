package fr.the2d2a.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import fr.the2d2a.bean.Commande;
import fr.the2d2a.bean.Membre;
import fr.the2d2a.service.CommandeService;
import fr.the2d2a.web.constants.ParamConstants;
import fr.the2d2a.web.constants.WebConstants;

public class MesAchatsController implements Controller {

	protected static Logger logger = Logger.getLogger(MesAchatsController.class);
	
	private CommandeService commandeService;
	
	
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.debug("In handleRequest MesAchatsController...");
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		Membre membre = (Membre) request.getSession().getAttribute(WebConstants.AUTHENTICATED_MEMBER);
		model.put("membre", membre);
		
		List<Commande> commandesEnCours = commandeService.getCommandesByMemberAndState(String.valueOf(membre.getMemId()), ParamConstants.COMMANDE_EN_COURS);
		model.put("commandesEnCours", commandesEnCours);
		model.put("commandesEnCoursSize", commandesEnCours.size());
		logger.debug("Nb commandes en cours : " + commandesEnCours.size());
		
		int i = 0;
		for (Commande cmd : commandesEnCours) {
			logger.debug("Visu cmd " + ++i + " : " + ToStringBuilder.reflectionToString(cmd));
		}
		
		List<Commande> commandesHisto = commandeService.getCommandesByMemberAndState(String.valueOf(membre.getMemId()), ParamConstants.COMMANDE_HISTO);
		model.put("commandesHisto", commandesHisto);
		model.put("commandesHistoSize", commandesHisto.size());
		logger.debug("Nb commandes histo : " + commandesHisto.size());
		
		String styleCommande = request.getParameter("styleCommande");
		logger.debug("StyleCommande : " + styleCommande);
		if (styleCommande == null || styleCommande.equals(ParamConstants.COMMANDE_EN_COURS)) {
			model.put("styleCommande", ParamConstants.COMMANDE_EN_COURS);
		} else {
			model.put("styleCommande", ParamConstants.COMMANDE_HISTO);
		}
		
		return new ModelAndView("mesAchats", model);
	}
	
	public void setCommandeService(CommandeService commandeService) {
		this.commandeService = commandeService;
	}
}
