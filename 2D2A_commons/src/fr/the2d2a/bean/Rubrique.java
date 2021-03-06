package fr.the2d2a.bean;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class Rubrique implements Serializable {

	private static final long serialVersionUID = 3952221509373553936L;
	
	private int rubId;
	private int rub_rubId;
	private String picto;
	private String css;
	private String nom;
	private String description;
	private String friendlyName;
	private String keyword;
	private Integer ordre;
	private Integer visible;
	
	//not from db but generated
	private String link;
	
	//for BO
	private int action;
	private int depth;
	private MultipartFile pictoFile;
	private MultipartFile cssFile;
	private String lang;
	
	public Rubrique() {
		
	}

	public int getRubId() {
		return rubId;
	}

	public void setRubId(int rubId) {
		this.rubId = rubId;
	}

	public String getPicto() {
		return picto;
	}

	public void setPicto(String picto) {
		this.picto = picto;
	}

	public String getCss() {
		return css;
	}

	public void setCss(String css) {
		this.css = css;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getRub_rubId() {
		return rub_rubId;
	}

	public void setRub_rubId(int rub_rubId) {
		this.rub_rubId = rub_rubId;
	}

	public String getFriendlyName() {
		return friendlyName;
	}

	public void setFriendlyName(String friendlyName) {
		this.friendlyName = friendlyName;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public int getAction() {
		return action;
	}

	public void setAction(int action) {
		this.action = action;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public Integer getOrdre() {
		return ordre;
	}

	public void setOrdre(Integer ordre) {
		this.ordre = ordre;
	}

	public Integer getVisible() {
		return visible;
	}

	public void setVisible(Integer visible) {
		this.visible = visible;
	}

	public MultipartFile getPictoFile() {
		return pictoFile;
	}

	public void setPictoFile(MultipartFile pictoFile) {
		this.pictoFile = pictoFile;
	}

	public MultipartFile getCssFile() {
		return cssFile;
	}

	public void setCssFile(MultipartFile cssFile) {
		this.cssFile = cssFile;
	}

	public String getLang() {
		return lang;
	}

	public void setLang(String lang) {
		this.lang = lang;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}	
}
