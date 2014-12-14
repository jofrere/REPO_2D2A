package fr.the2d2a_bo.service.impl;

import fr.the2d2a_bo.dao.AdminDao;
import fr.the2d2a_bo.service.AdminService;

public class AdminServiceImpl implements AdminService {

	private AdminDao adminDao;
	
	public boolean isAutorised(String login, String pwd) {
		return adminDao.isAutorised(login, pwd);
	}

	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}
}
