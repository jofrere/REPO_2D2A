package fr.the2d2a.bean;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class ImageEvenement implements Serializable {

	private static final long serialVersionUID = -6942880209711542850L;
	
	private int id;
	private int eveId;
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
	public int getEveId() {
		return eveId;
	}
	public void setEveId(int eveId) {
		this.eveId = eveId;
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
