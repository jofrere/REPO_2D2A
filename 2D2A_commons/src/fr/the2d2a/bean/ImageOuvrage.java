package fr.the2d2a.bean;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class ImageOuvrage implements Serializable {

	private static final long serialVersionUID = 2221005164728432576L;

	private int id;
	private int ouvId;
	private String pathPhoto;
	private int position;
	private String description;
	
	//pour le BO
	private MultipartFile photoFile;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getOuvId() {
		return ouvId;
	}
	public void setOuvId(int ouvId) {
		this.ouvId = ouvId;
	}
	public String getPathPhoto() {
		return pathPhoto;
	}
	public void setPathPhoto(String pathPhoto) {
		this.pathPhoto = pathPhoto;
	}
	public int getPosition() {
		return position;
	}
	public void setPosition(int position) {
		this.position = position;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public MultipartFile getPhotoFile() {
		return photoFile;
	}
	public void setPhotoFile(MultipartFile photoFile) {
		this.photoFile = photoFile;
	}
	
}
