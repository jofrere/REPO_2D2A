package fr.the2d2a.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import fr.the2d2a.web.constants.ParamConstants;
import fr.the2d2a.web.constants.WebConstants;

public class DateHelper {

	
	public static String formatDate(String format, Date date, String lang) {
		Locale locale = null;
		if (lang.equals(WebConstants.LANGUE_FR))
			locale = Locale.FRENCH;
		else
			locale = Locale.ENGLISH;
		
		SimpleDateFormat sdf = new SimpleDateFormat(format, locale);
		
		String dateStr = sdf.format(date);
		
		return dateStr;
	}
	
	public static String getPatternAccueil(String lang) {
		if (lang.equals(WebConstants.LANGUE_FR))
			return ParamConstants.PATTERN_DATE_FR;
		else
			return ParamConstants.PATTERN_DATE_EN;
	}
}
