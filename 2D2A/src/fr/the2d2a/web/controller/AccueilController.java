package fr.the2d2a.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.log4j.Logger;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import fr.the2d2a.bean.Accueil;
import fr.the2d2a.bean.Produit;
import fr.the2d2a.bean.Rubrique;
import fr.the2d2a.exception.FonctionalException;
import fr.the2d2a.exception.TechnicalException;
import fr.the2d2a.service.AccueilService;
import fr.the2d2a.service.ProduitService;
import fr.the2d2a.service.RubriqueService;
import fr.the2d2a.web.constants.WebConstants;


public class AccueilController extends SimpleFormController {

    protected static Logger logger = Logger.getLogger(AccueilController.class);

    private AccueilService accueilService;
    private ProduitService produitService;
    private RubriqueService rubriqueService;

	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {
    	
    	logger.debug("In onSubmit AccueilController");
    	Map<String, Object> model = new HashMap<String, Object>();
    	
        String lang = (String) ((HttpServletRequest)request).getSession().getAttribute(WebConstants.LANGUE);
        request.setAttribute(WebConstants.LANGUE, lang);
        logger.debug("Visu de langue : " + lang);
        
        String friendlyName = request.getParameter("accFriendly");
        String id = rubriqueService.getRubriqueIdByFriendlyNameForAccueil(lang, friendlyName);
        if (id == null) {
        	id = "1";
        }
        model.put("accueilId", id);
        
        String nouveaute = request.getParameter("nouveaute");
        if (nouveaute == null) {
        	nouveaute = "0";
        }
        request.setAttribute("nouveaute", nouveaute);
        
        this.getAllAccueils(request);
        this.getAllProduitsAssociated(request, id);
        
        Accueil accueil = null;
		try {
			accueil = accueilService.getAccueilById(lang, id);
			logger.debug("Accueil : " + ToStringBuilder.reflectionToString(accueil));
		} catch (TechnicalException e) {
			// TODO 
			e.printStackTrace();
		} catch (FonctionalException e) {
			// TODO 
			e.printStackTrace();
		}
        
        
        model.put(WebConstants.ACCUEIL, accueil);
        model.put(WebConstants.HOME, WebConstants.HOME);
        
    	return new ModelAndView(this.getSuccessView(), model);
    }
        
    protected ModelAndView showForm(HttpServletRequest request, HttpServletResponse response, BindException errors)	throws Exception {

        logger.debug("In showForm AccueilController");
        Map<String, Object> model = new HashMap<String, Object>();
        
        String lang = (String) request.getSession().getAttribute(WebConstants.LANGUE);
        request.setAttribute(WebConstants.LANGUE, lang);
        
        String friendlyName = request.getParameter("accFriendly");
        String id = rubriqueService.getRubriqueIdByFriendlyNameForAccueil(lang, friendlyName);
        if (id == null) {
        	id = "1";
        }
        model.put("accueilId", id);
        
        this.getAllAccueils(request);
        this.getAllProduitsAssociated(request, id);
        
        Accueil accueil = null;
		try {
			accueil = accueilService.getAccueilById(lang, id);
			logger.debug("Accueil : " + ToStringBuilder.reflectionToString(accueil));
		} catch (TechnicalException e) {
			// TODO 
			e.printStackTrace();
		} catch (FonctionalException e) {
			// TODO 
			e.printStackTrace();
		}
        
        
        model.put(WebConstants.ACCUEIL, accueil);
        model.put(WebConstants.HOME, WebConstants.HOME);
        
        request.setAttribute("nouveaute", "0");
        
        return new ModelAndView(this.getSuccessView(), model);
    }

	public void setAccueilService(AccueilService accueilService) {
		this.accueilService = accueilService;
	}
	
	public void setProduitService(ProduitService produitService) {
		this.produitService = produitService;
	}

	private void getAllAccueils(HttpServletRequest request) throws TechnicalException, FonctionalException {
		String lang = (String) request.getSession().getAttribute(WebConstants.LANGUE);
		List<Accueil> accueils = accueilService.getAllAccueils(lang);
		Rubrique rubAssociated = null;
		for (Accueil accueil : accueils) {
			rubAssociated = rubriqueService.getRubriqueById(lang, accueil.getAccId());
			accueil.setFriendlyName(rubAssociated.getFriendlyName());
		}
		request.setAttribute("accueils", accueils);
	}
	
	private void getAllProduitsAssociated(HttpServletRequest request, String id) throws TechnicalException {
		String lang = (String) request.getSession().getAttribute(WebConstants.LANGUE);
		
		List<Produit> nouveautes = produitService.getProduitByRubriqueIdAndNouveaute(lang, id);
		for (Produit produit : nouveautes) {
			produit.setRubId(id);
		}
		request.setAttribute("nouveautes", nouveautes);
		request.setAttribute("nbNouveaute", nouveautes.size());
		
		List<Produit> coupCoeur = produitService.getProduitByRubriqueIdAndCoupDeCoeur(lang, id);
		for (Produit produit : coupCoeur) {
			produit.setRubId(id);
		}
		request.setAttribute("coupCoeurs", coupCoeur);
		request.setAttribute("nbCoupCoeur", coupCoeur.size());
	}

	public void setRubriqueService(RubriqueService rubriqueService) {
		this.rubriqueService = rubriqueService;
	}
}
