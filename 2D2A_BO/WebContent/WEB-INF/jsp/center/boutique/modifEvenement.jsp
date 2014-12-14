<%@ include file="../../head/include.jsp" %>

<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->
	<p class="b brown fs13 mt5">
		<c:choose>
			<c:when test="${event.action == 5}">Modification d'un évènement</c:when>
			<c:when test="${event.action == 4}">Création d'un évènement</c:when>
		</c:choose>
	</p>
	<!-- endTitleFiche -->
</div>
<div id="separationEnteteFiche"></div>
<!-- endEnteteFiche -->

<div id="ficheCorps">

	<form name="modifEventForm" id="modifEventForm" method="post" action="" enctype="multipart/form-data">

		<spring:bind path="event.action">
			<input type="hidden" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>">
		</spring:bind>

		<spring:bind path="event.eveId">
			<input type="hidden" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>">
		</spring:bind>
		
		<table class="formulaire">
			<col class="col1"/>
			<col class="col2"/>
			
			<tr>
				<td class="left title">Visibilité sur le site</td>
				<td class="right">&nbsp;</td>
			</tr>
			
			<tr>	
				<spring:bind path="event.visible">
					<td class="left">Visibilité</td>
					<td class="right">
						<input type="radio" <c:if test="${status.value == 0}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="0"/>&nbsp;Non<br />
						<input type="radio" <c:if test="${status.value == 1}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="1"/>&nbsp;Oui
					</td>
				</spring:bind>
			</tr>
			
			<tr>
				<td class="left">&nbsp;</td>
				<td class="right">&nbsp;</td>
			</tr>
			
			<tr>	
				<spring:bind path="event.rubId">
					<td class="left">Rubriques</td>
					<td class="right">
						<select name="<c:out value="${status.expression}"/>" id="<c:out value="${status.expression}"/>">
							<option <c:if test="${empty event.rubId}">selected="selected"</c:if> value="0">&nbsp;</option>
							<option value="15" <c:if test="${status.value == 15}">selected="selected"</c:if>>Calendrier</option>
							<c:forEach var="rubrique" items="${listeRubrique}">
								<option value="<c:out value="${rubrique.rubId}"/>" <c:if test="${status.value == rubrique.rubId}">selected="selected"</c:if>>&nbsp;&nbsp;&nbsp;<c:out value="${rubrique.nom}"/></option>
							</c:forEach>
							<option value="16" <c:if test="${status.value == 16}">selected="selected"</c:if>>Agenda</option>
							<c:forEach var="rubrique" items="${listeRubrique2}">
								<option value="<c:out value="${rubrique.rubId}"/>" <c:if test="${status.value == rubrique.rubId}">selected="selected"</c:if>>&nbsp;&nbsp;&nbsp;<c:out value="${rubrique.nom}"/></option>
							</c:forEach>
						</select>
					</td>
				</spring:bind>
			</tr>
			
			<tr>
				<td class="left">&nbsp;</td>
				<td class="right">&nbsp;</td>
			</tr>
			
			<tr>
				<spring:bind path="event.titre">
					<td class="left">
    					Titre
					</td>
					<td class="right"><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/></td>
				</spring:bind>	
			</tr>
			
			<tr>
				<spring:bind path="event.designationInfo">
					<td class="left">
    					Désignation/information
					</td>
					<td class="right"><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/></td>
				</spring:bind>	
			</tr>
					
			<tr>
				<spring:bind path="event.theme">
					<td class="left">
    					Thème
					</td>
					<td class="right"><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/></td>
				</spring:bind>	
			</tr>
			
			<tr>
				<spring:bind path="event.prix">
					<td class="left">
					   	Prix
					</td>
					<td class="right">
						<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
					</td>
				</spring:bind>
			</tr>
			
			
			<tr>
				<td class="left title">Horaires</td>
				<td class="right"></td>
			</tr>
			
			<tr>
				<spring:bind path="event.dateDebutStr">
					<td class="left">
    					Date de début
					</td>
					<td class="right"><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/></td>
				</spring:bind>	
			</tr>
			
			<tr>
				<spring:bind path="event.dateFinStr">
					<td class="left">
    					Date de fin
					</td>
					<td class="right"><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/></td>
				</spring:bind>	
			</tr>

			<tr>
				<spring:bind path="event.horaire">
					<td class="left">
    					Horaire
					</td>
					<td class="right"><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/></td>
				</spring:bind>	
			</tr>
			
			<!-- Fin Objet -->
			
			<!-- ADRESSES -->
			
			
			<tr>
				<spring:bind path="event.ville">
					<td class="left">
					   	Ville
					</td>
					<td class="right">
						<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
					</td>
				</spring:bind>
			</tr>
			
			<tr>
				<spring:bind path="event.departement">
					<td class="left">
					   	Département
					</td>
					<td class="right">
						<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
					</td>
				</spring:bind>
			</tr>
			
			<tr>
				<spring:bind path="event.adresse">
					<td class="left">
    					Adresse
					</td>
					<td class="right"><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/></td>
				</spring:bind>	
			</tr>
			
			<tr>
				<spring:bind path="event.lieu">
					<td class="left">
					   	Lieu
					</td>
					<td class="right">
						<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
					</td>
				</spring:bind>
			</tr>
			
			<tr>
				<spring:bind path="event.tel">
					<td class="left">
					   	Téléphone
					</td>
					<td class="right">
						<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
					</td>
				</spring:bind>
			</tr>
			
			<tr>
				<spring:bind path="event.fax">
					<td class="left">
					   	Fax
					</td>
					<td class="right">
						<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
					</td>
				</spring:bind>
			</tr>
			
			<tr>
				<spring:bind path="event.webSite">
					<td class="left">
					   	Site Internet
					</td>
					<td class="right">
						<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
					</td>
				</spring:bind>
			</tr>
			<!-- END ADRESSES -->
		
			<tr>
				<td class="left">Photos</td>
				<td class="right">			
					<span id="modifProduit">
				
						<c:forEach var="image" items="${event.images}" varStatus="i">
							<p>
								<spring:bind path="event.images[${i.index}].pathPhoto">
									Image actuelle <img id="<c:out value="${status.expression}"/>" src="/${ROOT}/<c:out value="${status.value}"/>" style="border:1px; border-style:solid;border-color:#5a2041;" width="400" height="400" />
									<input type="hidden" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/><br />
								</spring:bind>
								<spring:bind path="event.images[${i.index}].photoFile">
									Modifier : <input type="file" id="<c:out value="${i.index}"/>" name="<c:out value="${status.expression}"/>"/> <img src="/${ROOT}/resources/pic/panier/corbeille.gif" onclick="deleteField2(event);"/>
								</spring:bind>
							</p>
							<br />
							<br />
							<c:if test="${i.last}">
								<c:set var="last" value="${i.index}" scope="page"/>
							</c:if>
						</c:forEach>
						
						<c:choose>
							<c:when test="${empty last}">
								<c:set var="last" value="0" scope="page"/>
							</c:when>
							<c:otherwise>
								<c:set var="last" value="${last+1}" scope="page"/>
							</c:otherwise>
						</c:choose>
									
						<p>
							Ajouter :<br /><input type="file" id="<c:out value="${last}"/>" name="images[${last}].photoFile"/>
						</p>
					</span>
				</td>
			</tr>

		</table>
		<table class="formulaire">
			<tr>
				<td class="left noborder"></td>
				<td class="right pt20">
					<span class="pl20 pr20"></span>
					<span class="pl20 pr20"></span>
					<span class="pl20 pr20"></span>
					<span class="pl20 pr20"></span>
						<a onclick="document.getElementById('modifEventForm').submit();" class="bouton" href="#" title="Valider"><span><span>Valider</span></span></a>
					<br/>
					<br/>
					<br/>
				</td>
			</tr>
		</table>
	</form>
</div>
				
<script>
	initForm2(<c:out value="${last}"/>);
	var pathDeleteBtn = '/${ROOT}/resources/pic/panier/corbeille.gif'; 
</script>				
