package fr.the2d2a_bo.utils;

import java.util.List;
import java.util.Map;

import fr.the2d2a.bean.Rubrique;

public class RubriqueHelper {

	public static void displayRubriqueInOrder(Map<Integer, List<Rubrique>> listeMap, List<Rubrique> listePeres, List<Rubrique> listeDisplay, int depth) {
		for (Rubrique rub : listePeres) {
			rub.setDepth(depth);
			listeDisplay.add(rub);
			List<Rubrique> listeFils = listeMap.get(rub.getRubId());
			if (listeFils != null) {
				displayRubriqueInOrder(listeMap, listeFils, listeDisplay, ++depth);
				--depth;
			}
		}		
	}
	
	public static void displayAllRubriqueInOrder(List<Rubrique> allRubriques, List<Rubrique> listeDisplay, int pere, int depth) {
		for (Rubrique rub : allRubriques) {
			if (pere == rub.getRub_rubId()) {
				rub.setDepth(depth);
				listeDisplay.add(rub);
				displayAllRubriqueInOrder(allRubriques, listeDisplay, rub.getRubId(), ++depth);
				--depth;
			}
		}		
	}
}
