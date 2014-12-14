<%@ include file="../../head/include.jsp" %>

<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->
	<p class="b brown fs13 mt5">Gestion des évènements</p>
	<!-- endTitleFiche -->
</div>
<div id="separationEnteteFiche"></div>
<!-- endEnteteFiche -->

<div id="ficheCorps">

	<table class="formulaire">
		<col class="col1_Back"/>
		<col class="col1_Back"/>
		<col class="col1_Back"/>
		<col class="col1_Back"/>
		<col/>
		
		<tr>
			<th>Titre</th>
			<th>Date de début <small>(jj/mm/aaaa)</small></th>
			<th>Date de fin <small>(jj/mm/aaaa)</small></th>
			<th>Visibilité</th>
			<th>Rubrique</th>
			<th>&nbsp;</th>
		</tr>
		<tr><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td>&nbsp;</td></tr>
		<tr>
			<form name="filtreEvt" id="filtreEvt" action="" method="POST">
				<td class="back">
					&nbsp;
				</td>
				<td class="back">
					<spring:bind path="filter.dateDebut">
						<input type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" />
					</spring:bind>
				</td>
				<td class="back">
					<spring:bind path="filter.dateFin">
						<input type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" />
					</spring:bind>
				</td>
				<td class="back">
					<spring:bind path="filter.visibilite">
						<select name="<c:out value="${status.expression}"/>" id="<c:out value="${status.expression}"/>">
							<option value="-1" <c:if test="${status.value == -1}">selected="selected"</c:if>>Tous</option>
							<option value="0" <c:if test="${status.value == 0}">selected="selected"</c:if>>Non visible</option>
							<option value="1" <c:if test="${status.value == 1}">selected="selected"</c:if>>Visible</option>		
						</select>
					</spring:bind>
				</td>
				<td class="back">
					<spring:bind path="filter.rubrique">
						<select name="<c:out value="${status.expression}"/>" id="<c:out value="${status.expression}"/>">
							<option value="-1" <c:if test="${status.value == -1}">selected="selected"</c:if>>Pas de filtre</option>
							<option value="15" <c:if test="${status.value == 15}">selected="selected"</c:if>>Calendrier</option>
							<c:forEach var="rubrique" items="${listeRubrique}">
								<option value="<c:out value="${rubrique.rubId}"/>" <c:if test="${status.value == rubrique.rubId}">selected="selected"</c:if>>&nbsp;&nbsp;&nbsp;<c:out value="${rubrique.nom}"/></option>
							</c:forEach>
							<option value="16" <c:if test="${status.value == 16}">selected="selected"</c:if>>Agenda</option>
							<c:forEach var="rubrique" items="${listeRubrique2}">
								<option value="<c:out value="${rubrique.rubId}"/>" <c:if test="${status.value == rubrique.rubId}">selected="selected"</c:if>>&nbsp;&nbsp;&nbsp;<c:out value="${rubrique.nom}"/></option>
							</c:forEach>
						</select>
					</spring:bind>
				</td>
				<td>
					&nbsp;<a onclick="document.getElementById('filtreEvt').submit();" class="bouton" href="#" title="Filtrer"><span><span>Filtrer</span></span></a>&nbsp;
				</td>
			</form>
		</tr>
		<tr><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td>&nbsp;</td></tr>
		<c:forEach var="evt" items="${events}" varStatus="i">
			
			<tr>
				<td class="back">
					<c:out value="${evt.titre}"/>
				</td>
				<td class="back">
					<c:out value="${evt.dateDebutStr}"/>
				</td>
				<td class="back">
					<c:out value="${evt.dateFinStr}"/>
				</td>
				<td class="back">
					<c:choose>
						<c:when test="${evt.visible == 0}">
							Non visible
						</c:when>
						<c:otherwise>
							Visible
						</c:otherwise>
					</c:choose>
				</td>
				<td class="back">
					&nbsp;
				</td>
				<td>
					<form style="display:inline;" name="evt_modif_<c:out value="${i.index}"/>" method="post" action="./modifEvenement.htm">
						<input type="hidden" name="eveId" value="<c:out value="${evt.eveId}"/>">
						<input type="hidden" name="action" value="2"/>
					</form>
				
					<form style="display:inline;" name="evt_del_<c:out value="${i.index}"/>" method="post" action="./modifEvenement.htm">
						<input type="hidden" name="eveId" value="<c:out value="${evt.eveId}"/>">
						<input type="hidden" name="action" value="3"/>						
					</form>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#" onclick="document.evt_modif_<c:out value="${i.index}"/>.submit();"><img src="/${ROOT}/resources/pic/panier/edit.gif" border="0"/></a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#" onclick="if (confirm('Etes-vous certain de vouloir supprimer cet évènement ?')) eval('document.evt_del_<c:out value="${i.index}"/>.submit();')"><img src="/${ROOT}/resources/pic/panier/corbeille.gif" border="0"/></a>
				</td>
			</tr>			
		</c:forEach>	
	</table>
	<div style="text-align: center; width: 100%;">
		<br />
		<br />
		<form style="display:inline; width: 100%;" name="evt_add" id="evt_add" method="post" action="./modifEvenement.htm">
			<input type="hidden" name="action" value="1"/>
			<a onclick="document.getElementById('evt_add').submit();" class="bouton" href="#" title="Créer un nouvel évènement"><span><span>Créer un nouvel évènement</span></span></a>
		</form>
	</div>
</div>
