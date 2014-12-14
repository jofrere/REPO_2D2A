<%@ include file="../../head/include.jsp" %>

<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->
	<p class="b brown fs13 mt5">Gestion des membres</p>
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
		<col class="col1_Back"/>
		<col/>
		<tr>
			<th>Identifiant</th>
			<th>Nom</th>
			<th>Prénom</th>
			<th>Activation</th>
			<th>Code postal</th>
			<th>&nbsp;</th>
		</tr>
		<tr><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td>&nbsp;</td></tr>
		<tr>
			<form name="filtreMembre" id="filtreMembre" action="" method="POST">
				<td class="back">
					<spring:bind path="filter.login">
						<input type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" />
					</spring:bind>
				</td>
				<td class="back">
					<spring:bind path="filter.nom">
						<input type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" />
					</spring:bind>
				</td>
				<td class="back">
					<spring:bind path="filter.prenom">
						<input type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" />
					</spring:bind>
				</td>
				<td class="back">
					<spring:bind path="filter.activation">
						<select name="<c:out value="${status.expression}"/>" id="<c:out value="${status.expression}"/>">
							<option value="-1" <c:if test="${status.value == -1}">selected="selected"</c:if>>&nbsp;</option>
							<option value="0" <c:if test="${status.value == 0}">selected="selected"</c:if>>Non vérifié</option>
							<option value="1" <c:if test="${status.value == 1}">selected="selected"</c:if>>Membre</option>		
						</select>
					</spring:bind>
				</td>
				<td class="back">
					<spring:bind path="filter.codePostal">
						<input type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="5"/>
					</spring:bind>
				</td>
				<td>
					&nbsp;<a onclick="document.getElementById('filtreMembre').submit();" class="bouton" href="#" title="Filtrer"><span><span>Filtrer</span></span></a>&nbsp;
				</td>
			</form>
		</tr>
		<tr><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td>&nbsp;</td></tr>
		<c:forEach var="membre" items="${listeMembre}" varStatus="i">
			
			<tr>
				<td class="back">
					<c:out value="${membre.login}"/>
				</td>
				<td class="back">
					<c:out value="${membre.nom}"/>
				</td>
				<td class="back">
					<c:out value="${membre.prenom}"/>
				</td>
				<td class="back">
					<c:choose>
						<c:when test="${membre.typeActivation == 0}">
							Non vérifié
						</c:when>
						<c:otherwise>
							Membre
						</c:otherwise>
					</c:choose>
				</td>
				<td class="back">
					<c:out value="${membre.adresses[0].codePostal}"/>
				</td>
				<td>
					<form style="display:inline;" name="membre_modif_<c:out value="${i.index}"/>" method="post" action="./detailMembre.htm">
						<input type="hidden" name="memId" value="<c:out value="${membre.memId}"/>">
					</form>
				
				<%--
					<form style="display:inline;" name="membre_del_<c:out value="${i.index}"/>" method="post" action="./modifMembre.htm">
						<input type="hidden" name="memId" value="<c:out value="${membre.memId}"/>">
						<input type="hidden" name="action" value="3"/>						
					</form>
					--%>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#" onclick="document.membre_modif_<c:out value="${i.index}"/>.submit();"><img src="/${ROOT}/resources/pic/panier/edit.gif" border="0"/></a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<%--<a href="#" onclick="if (confirm('Etes-vous certain de vouloir supprimer ce membre ?')) eval('document.membre_del_<c:out value="${i.index}"/>.submit();')"><img src="/${ROOT}/resources/pic/panier/corbeille.gif" border="0"/></a>--%>
				</td>
			</tr>			
		</c:forEach>	
	</table>
</div>
