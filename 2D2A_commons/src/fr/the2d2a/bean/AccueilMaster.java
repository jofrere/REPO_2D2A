package fr.the2d2a.bean;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;

public class AccueilMaster {
	
	private List<Accueil> accueils;
	private String lang;
	
	@SuppressWarnings("unchecked")
	public AccueilMaster() {
		accueils = LazyList.decorate(new ArrayList<Accueil>(), FactoryUtils.instantiateFactory(Accueil.class));
	}

	public List<Accueil> getAccueils() {
		return accueils;
	}

	public void setAccueils(List<Accueil> accueils) {
		this.accueils = accueils;
	}

	public String getLang() {
		return lang;
	}

	public void setLang(String lang) {
		this.lang = lang;
	}
	
	
}
