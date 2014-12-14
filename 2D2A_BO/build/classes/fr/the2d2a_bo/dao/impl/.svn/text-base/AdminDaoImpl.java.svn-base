package fr.the2d2a_bo.dao.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import fr.the2d2a_bo.dao.AdminDao;

public class AdminDaoImpl extends SqlMapClientDaoSupport implements AdminDao {

	protected final Logger logger = Logger.getLogger(AdminDaoImpl.class);

	public boolean isAutorised(String login, String pwd) {
		
		logger.debug("Login dans le BO : " + login);
        SqlMapClientTemplate template = getSqlMapClientTemplate();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("login", login);        
        map.put("pwd", pwd);
        int nbAdmin = (Integer) template.queryForObject("getAdmin", map);
        if (nbAdmin == 1)
        	return true;
		return false;
	}
}
