package fr.the2d2a.dao.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import fr.the2d2a.bean.Evenement;
import fr.the2d2a.bean.ImageEvenement;
import fr.the2d2a.bean.TypeEvenement;
import fr.the2d2a.beanform.EvenementForm;
import fr.the2d2a.dao.EvenementDao;
import fr.the2d2a_bo.beanform.FilterEvenementForm;

public class EvenementDaoImpl extends SqlMapClientDaoSupport implements
		EvenementDao {

	protected final Logger logger = Logger.getLogger(EvenementDaoImpl.class);

	@SuppressWarnings("unchecked")
	public List<Evenement> getEvenementByRubriqueId(String lang, String rubId)
			throws DataAccessException {
		logger
				.debug("Recup Evenement en " + lang + " pour la rubid : "
						+ rubId);
		SqlMapClientTemplate template = getSqlMapClientTemplate();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lang", lang);
		map.put("rubId", rubId);
		Date curdate = new Date(System.currentTimeMillis());
		map.put("curdate", curdate);
		logger.debug("Visu curdate : " + curdate);

		List<Evenement> evenements = (List<Evenement>) template.queryForList(
				"getEvenementByRubriqueId", map);
		logger.debug("Visu evenements : " + evenements.toString());

		return evenements;
	}

	@SuppressWarnings("unchecked")
	public List<String> getAllDepartement(String lang, String rubId)
			throws DataAccessException {
		logger.debug("Recup all Departements en " + lang + " pour la rubid : "
				+ rubId);
		SqlMapClientTemplate template = getSqlMapClientTemplate();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lang", lang);
		map.put("rubId", rubId);

		List<String> deps = (List<String>) template.queryForList(
				"getDepartementByRubriqueId", map);
		logger.debug("Visu dep : " + deps.toString());

		return deps;
	}

	@SuppressWarnings("unchecked")
	public List<TypeEvenement> getAllType(String lang)
			throws DataAccessException {
		logger.debug("Recup all Type Evenement en " + lang);
		SqlMapClientTemplate template = getSqlMapClientTemplate();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lang", lang);

		List<TypeEvenement> types = (List<TypeEvenement>) template
				.queryForList("getAllTypeEvenement", map);
		logger.debug("Visu type : " + types.toString());

		return types;
	}

	@SuppressWarnings("unchecked")
	public List<Evenement> getEvenementByRubriqueIdWithFilter(String lang,
			String rubId, EvenementForm evtForm) throws DataAccessException {
		logger
				.debug("Recup Evenement en " + lang + " pour la rubid : "
						+ rubId);
		SqlMapClientTemplate template = getSqlMapClientTemplate();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lang", lang);
		map.put("rubId", rubId);
		map.put("selectedDate", evtForm.getSelectedDate());
		// map.put("type", evtForm.getTypeEvt());
		// map.put("departement", evtForm.getDepartement());

		List<Evenement> evenements = (List<Evenement>) template.queryForList(
				"getEvenementByRubriqueIdWithFilter", map);
		logger.debug("Visu evenements : " + evenements.toString());

		return evenements;
	}

	@SuppressWarnings("unchecked")
	public List<Evenement> getAllEvenements(String lang)
			throws DataAccessException {
		logger.debug("Recup All Evenements en " + lang);
		SqlMapClientTemplate template = getSqlMapClientTemplate();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lang", lang);
		Date curdate = new Date(System.currentTimeMillis());
		map.put("curdate", curdate);

		List<Evenement> evenements = (List<Evenement>) template.queryForList(
				"getAllEvenements", map);

		return evenements;
	}

	public Evenement getEvenementById(String id, String lang)
			throws DataAccessException {
		logger.debug("Recup Evenement en " + lang);
		SqlMapClientTemplate template = getSqlMapClientTemplate();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lang", lang);
		map.put("eveId", id);
		Evenement evt = (Evenement) template.queryForObject("getEvenementById",
				map);

		return evt;
	}

	@SuppressWarnings("unchecked")
	public List<ImageEvenement> getAllImageEvenement(String eveId)
			throws DataAccessException {
		logger.debug("Recup all Image Evt for id : " + eveId);
		SqlMapClientTemplate template = getSqlMapClientTemplate();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("eveId", eveId);
		List<ImageEvenement> liste = template.queryForList(
				"getImageEvenementByEvenementId", map);
		return liste;
	}

	@SuppressWarnings("unchecked")
	public List<Evenement> getAllEvenementWithFilter(String lang,
			FilterEvenementForm filter) throws DataAccessException {
		logger.debug("Recup all Evts with filter en " + lang);
		SqlMapClientTemplate template = getSqlMapClientTemplate();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lang", lang);

		// gestion du filtre
		map.put("dateDebut", filter.getDateDebutF());
		map.put("dateFin", filter.getDateFinF());
		map.put("visibilite", filter.getVisibilite());
		map.put("rubrique", filter.getRubrique());

		List<Evenement> events = template.queryForList(
				"getAllEvenementWithFilter", map);
		logger.debug("Liste de evenements : " + events.toString());

		return events;
	}

	@Transactional
	public void insertEvenement(Evenement evt, String lang) throws DataAccessException {		
		logger.debug("Insertion d'un Evenement ");
		SqlMapClientTemplate template = getSqlMapClientTemplate();
		int id = (Integer)template.insert("insertEvenement", evt);
		logger.debug("Visu de l'id " + id);
		evt.setEveId(id);
		evt.setLang(lang);
		template.insert("insertEvenementLangue", evt);
		evt.setLang("EN");
		template.insert("insertEvenementLangue", evt);
	}
	
	@Transactional
	public void updateEvenement(Evenement evt, String lang) throws DataAccessException {
		logger.debug("Update d'un Evenement " + evt.getEveId());
		evt.setLang(lang);
		SqlMapClientTemplate template = getSqlMapClientTemplate();
		template.update("updateEvenement", evt);
		template.update("updateEvenementLang", evt);
		
		//gestion des images evts
		int nbRows = template.delete("deleteImageEvenement", evt);
		logger.debug(nbRows + " deleted pour les images");
		
		for (ImageEvenement img : evt.getImages()) {
			logger.debug("Visu des images : " + ToStringBuilder.reflectionToString(img));
			//pour les anciennes ki sont deleted
			if (img != null) {
				img.setEveId(evt.getEveId());
				int imgId = (Integer)template.insert("insertImageEvenement", img);
				img.setId(imgId);
			}
		}
	}
	
	@Transactional
	public void deleteEvenement(Evenement evt) throws DataAccessException {
		logger.debug("Delete d'un Evenement " + evt.getEveId());
		int nbRows = 0;
		SqlMapClientTemplate template = getSqlMapClientTemplate();
		evt.setLang("EN");
		nbRows = template.delete("deleteEvenementLang", evt);
		logger.debug(nbRows + " deleted pour deleteEvenementLang");
		evt.setLang("FR");
		nbRows = template.delete("deleteEvenementLang", evt);
		logger.debug(nbRows + " deleted pour deleteEvenementLang");
		Map<String, Object> map = new HashMap<String, Object>();
		evt.setImages(this.getAllImageEvenement(String.valueOf(evt.getEveId())));
		for (ImageEvenement img : evt.getImages()) {
			map.put("imgId", img.getId());
			map.put("lang", "FR");
			nbRows = template.delete("deleteImageEvenementLang", map);
			logger.debug(nbRows + " deleted pour deleteImageEvenementLang");
			map.put("lang", "EN");
			nbRows = template.delete("deleteImageEvenementLang", map);
			logger.debug(nbRows + " deleted pour deleteImageEvenementLang");
		}
		nbRows = template.delete("deleteImageEvenement", evt);
		logger.debug(nbRows + " deleted pour les images");
		
		nbRows = template.delete("deleteEvenement", evt);
		logger.debug(nbRows + " deleted pour deleteEvenement");
	}
}
