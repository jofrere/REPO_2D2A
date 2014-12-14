package fr.the2d2a.bean;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class ImageProduit implements Serializable {

	private static final long serialVersionUID = 2112475927793204175L;

	private int imgId;
	private int proId;
	private String vignette;
	private String photo;
	
	//pour le BO
	private MultipartFile photoFile;
	
	public int getProdId() {
		return proId;
	}
	public void setProdId(int prodId) {
		this.proId = prodId;
	}
	public String getVignette() {
		return vignette;
	}
	public void setVignette(String vignette) {
		this.vignette = vignette;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public MultipartFile getPhotoFile() {
		return photoFile;
	}
	public void setPhotoFile(MultipartFile photoFile) {
		this.photoFile = photoFile;
	}
	public int getImgId() {
		return imgId;
	}
	public void setImgId(int imgId) {
		this.imgId = imgId;
	}
}
