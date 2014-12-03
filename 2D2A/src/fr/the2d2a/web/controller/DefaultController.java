package fr.the2d2a.web.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import fr.the2d2a.web.constants.WebConstants;

public class DefaultController implements Controller {

    protected static Logger logger = Logger.getLogger(AccueilController.class);

        
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        String now = (new Date()).toString();
        logger.info("Returning Inventory view");

        Map<String, Object> myModel = new HashMap<String, Object>();
        myModel.put("now", now);
        
        request.setAttribute(WebConstants.LANGUE, ((HttpServletRequest)request).getSession().getAttribute(WebConstants.LANGUE));

        return new ModelAndView("404", "model", myModel);
    }	
}
