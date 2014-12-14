<%@ include file="../../head/include.jsp"%>

<!-- startEnteteFiche -->
<div id="enteteFiche"><!-- startTitleFiche -->
<p class="b brown fs13 mt5">Détail du membre</p>
<!-- endTitleFiche --></div>
<div id="separationEnteteFiche"></div>
<!-- endEnteteFiche -->


<div id="ficheCorps">

	<table class="formulaire">
		<col class="col1" />
		<col class="col2" />
		<!-- CIVILITE -->
		
		<tr>
			<td class="left title">Civilité</td>
			<td class="right"></td>
		</tr>
		<spring:bind path="membre.civId">
			<tr>
				<td class="left">Titre</td>
				<td class="right">
					<c:forEach var="civ" items="${listeCivilite}">
						<c:if test="${civ.civId == membre.civId}"><c:out value="${civ.titre}" /></c:if>						
					</c:forEach>
				</td>
			</tr>
		</spring:bind>

		
		<tr>
			<td class="left">Nom</td>
			<td class="right"><c:out value="${membre.nom}"/></td>
		</tr>
	
		<tr>
			<td class="left">Prénom</td>
			<td class="right"><c:out value="${membre.prenom}"/></td>
		</tr>
		

		<tr>
			<td class="left title">Coordonnées principales</td>
			<td class="right"></td>
		</tr>
		
		<tr>
			<td class="left">Société</td>
			<td class="right"><c:out value="${membre.adresses[0].societe}"/></td>
		</tr>
		
		<tr>
			<td class="left">Adresse</td>
			<td class="right"><c:out value="${membre.adresses[0].adresse}"/></td>
		</tr>
		
		<spring:bind path="membre.adresses[0].complementAdresse">
			<tr>
				<td class="left">Complément d'adresse</td>
				<td class="right"><c:out value="${membre.adresses[0].complementAdresse}"/></td>
			</tr>
		</spring:bind>

		<tr>
			<td class="left">Code postal</td>
			<td class="right"><c:out value="${membre.adresses[0].codePostal}"/></td>
		</tr>
		
		<tr>
			<td class="left">Ville</td>
			<td class="right"><c:out value="${membre.adresses[0].ville}"/></td>
		</tr>
		
		<tr>
			<td class="left space">Pays</td>
			<td class="right">
				<c:forEach var="pays" items="${listePays}">
					<c:if test="${pays.payId == membre.adresses[0].payId}"><c:out value="${pays.nom}"/></c:if>							
				</c:forEach>
			</td>				
		</tr>
		
		<tr>
			<td class="left title">Téléphones</td>
			<td class="right"></td>
		</tr>

		<tr>
			<td class="left">Téléphone privé</td>
			<td class="right"><c:out value="${membre.adresses[0].telPrive}"/></td>
		</tr>
		
		<tr>
			<td class="left">Téléphone bureau</td>
			<td class="right"><c:out value="${membre.adresses[0].telBureau}"/></td>
		</tr>
		
		<tr>
			<td class="left">Fax</td>
			<td class="right"><c:out value="${membre.adresses[0].fax}"/></td>
		</tr>
		
		<tr>
			<td class="left title">Identifiants</td>
			<td class="right"></td>
		</tr>
		
		<tr>
			<td class="left">Adresse mail</td>
			<td class="right"><c:out value="${membre.login}"/></td>
		</tr>

		<tr>
			<td class="left title">Informations personnelles</td>
			<td class="right"></td>
		</tr>

		<tr>
			<td class="left">Date de naissance</td>
			<td class="right">
				<c:out value="${membre.jourNaiss}"/>/<c:out value="${membre.moisNaiss}"/>/<c:out value="${membre.anneeNaiss}"/>
			</td>
		</tr>

		<tr>
			<td class="left">Profession</td>
			<td class="right">
				<c:forEach var="prof" items="${listeProfession}">
					<c:if test="${prof.profId == membre.profId}"><c:out value="${prof.titre}" /></c:if>
				</c:forEach>
			</td>
		</tr>

		<tr>
			<td class="left">Centre d'intérêts</td>
			<td class="right"><c:out value="${membre.centreInteret}"/></td>
		</tr>

		<tr>
			<td class="left">Newsletter</td>
			<td class="right">
				<c:choose>
					<c:when test="${membre.newsletter == 1}">Oui</c:when>
					<c:otherwise>Non</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</table>
</div>