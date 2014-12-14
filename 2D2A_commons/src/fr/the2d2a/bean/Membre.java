package fr.the2d2a.bean;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;

public class Membre implements Serializable {
	
	private static final long serialVersionUID = 2045284628160246299L;

	private int memId;
	private int profId;
	private int civId;
	
	private Civilite civilite;
	private String prenom;
	private String nom;
	
	private List<Adresse> adresses;
	
	private int jourNaiss;
	private int moisNaiss;
	private int anneeNaiss;
	private String calendar;
	
	private Profession profession;
	
	private String centreInteret;
	private int newsletter;
	
	private String login;
	private String password;
	
	private int typeActivation;
	private BigInteger dateInscription;
	
	private List<Filleul> filleuls;
	
	//pour le form
	private String loginConf;
	private String passwordConf;
	private String captcha;
	private int acceptation;
	
	//pour la modif
	private String newLogin;
	private String newLoginConf;
	private String newPassword;
	private String newPasswordConf;
	
	//pour l'authentification & le Back-Office
	private int action;
	private String lang;
	
	@SuppressWarnings("unchecked")
	public Membre() {
		adresses = LazyList.decorate(new ArrayList<Adresse>(), FactoryUtils.instantiateFactory(Adresse.class));
		filleuls = LazyList.decorate(new ArrayList<Filleul>(), FactoryUtils.instantiateFactory(Filleul.class));
		civilite = new Civilite();
		profession = new Profession();
	}
	
	public int getMemId() {
		return memId;
	}
	public void setMemId(int id) {
		this.memId = id;
	}
	public Civilite getCivilite() {
		return civilite;
	}
	public void setCivilite(Civilite civilite) {
		this.civilite = civilite;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}	
	public int getJourNaiss() {
		return jourNaiss;
	}
	public void setJourNaiss(int jourNaiss) {
		this.jourNaiss = jourNaiss;
	}
	public int getMoisNaiss() {
		return moisNaiss;
	}
	public void setMoisNaiss(int moisNaiss) {
		this.moisNaiss = moisNaiss;
	}
	public int getAnneeNaiss() {
		return anneeNaiss;
	}
	public void setAnneeNaiss(int anneeNaiss) {
		this.anneeNaiss = anneeNaiss;
	}
	public Profession getProfession() {
		return profession;
	}
	public void setProfession(Profession profession) {
		this.profession = profession;
	}
	public String getCentreInteret() {
		return centreInteret;
	}
	public void setCentreInteret(String centreInteret) {
		this.centreInteret = centreInteret;
	}
	public int getNewsletter() {
		return newsletter;
	}
	public void setNewsletter(int newsletter) {
		this.newsletter = newsletter;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public List<Adresse> getAdresses() {
		return adresses;
	}
	public void setAdresses(List<Adresse> adresses) {
		this.adresses = adresses;
	}

	public String getLoginConf() {
		return loginConf;
	}

	public void setLoginConf(String loginConf) {
		this.loginConf = loginConf;
	}

	public String getPasswordConf() {
		return passwordConf;
	}

	public void setPasswordConf(String passwordConf) {
		this.passwordConf = passwordConf;
	}

	public String getCaptcha() {
		return captcha;
	}

	public void setCaptcha(String captcha) {
		this.captcha = captcha;
	}

	public int getAcceptation() {
		return acceptation;
	}

	public void setAcceptation(int acceptation) {
		this.acceptation = acceptation;
	}

	public int getProfId() {
		return profId;
	}

	public void setProfId(int proId) {
		this.profId = proId;
	}

	public int getCivId() {
		return civId;
	}

	public void setCivId(int civId) {
		this.civId = civId;
	}

	public int getTypeActivation() {
		return typeActivation;
	}

	public void setTypeActivation(int typeActivation) {
		this.typeActivation = typeActivation;
	}

	public BigInteger getDateInscription() {
		return dateInscription;
	}

	public void setDateInscription(BigInteger dateInscription) {
		this.dateInscription = dateInscription;
	}
	
	public int getAction() {
		return action;
	}

	public void setAction(int action) {
		this.action = action;
	}

	public String getLang() {
		return lang;
	}

	public void setLang(String lang) {
		this.lang = lang;
	}

	public List<Filleul> getFilleuls() {
		return filleuls;
	}

	public void setFilleuls(List<Filleul> filleuls) {
		this.filleuls = filleuls;
		while (this.filleuls.size() < 4) {
			this.filleuls.add(new Filleul());
		}
	}

	public String getNewLogin() {
		return newLogin;
	}

	public void setNewLogin(String newLogin) {
		this.newLogin = newLogin;
	}

	public String getNewLoginConf() {
		return newLoginConf;
	}

	public void setNewLoginConf(String newLoginConf) {
		this.newLoginConf = newLoginConf;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getNewPasswordConf() {
		return newPasswordConf;
	}

	public void setNewPasswordConf(String newPasswordConf) {
		this.newPasswordConf = newPasswordConf;
	}

	public String getCalendar() {
		return calendar;
	}

	public void setCalendar(String calendar) {
		this.calendar = calendar;
	}
}
