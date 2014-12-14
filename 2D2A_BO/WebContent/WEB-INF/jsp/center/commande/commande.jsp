<%@ include file="../../head/include.jsp" %>

<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->
	<p class="b brown fs13 mt5">Gestion des Commandes</p>
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
			<th>Référence</th>
			<th>Membre</th>
			<th><a href="#" onclick="document.getElementById('sort').value=1;document.getElementById('filtreCommandeForm').submit();">Date</a></th>
			<th>Etat</th>
			<th><a href="#" onclick="document.getElementById('sort').value=3;document.getElementById('filtreCommandeForm').submit();">Prix</a></th>
			<th>&nbsp;</th>
		</tr>
		<tr><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td>&nbsp;</td></tr>
		<tr>
			<form name="filtreCommandeForm" id="filtreCommandeForm" action="" method="POST">
				<td class="back">
					<spring:bind path="filter.reference">
						<input class="field" type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" />
					</spring:bind>
				</td>
				<td class="back">
					<spring:bind path="filter.membre">
						<input class="field" type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" />
					</spring:bind>	
				</td>
				<td class="back">&nbsp;</td>
				<td class="back">
					<spring:bind path="filter.etat">
						<select name="<c:out value="${status.expression}"/>" id="<c:out value="${status.expression}"/>">
							<option value="-1" <c:if test="${status.value == -1}">selected="selected"</c:if>>Tous</option>
							<option value="0" <c:if test="${status.value == 0}">selected="selected"</c:if>>Commandée</option>
							<option value="1" <c:if test="${status.value == 1}">selected="selected"</c:if>>En traitement</option>	
							<option value="2" <c:if test="${status.value == 2}">selected="selected"</c:if>>En livraison</option>
							<option value="3" <c:if test="${status.value == 3}">selected="selected"</c:if>>En attente</option>
							<option value="4" <c:if test="${status.value == 4}">selected="selected"</c:if>>Livrée</option>	
							
						</select>
					</spring:bind>
				</td>
				<td class="back">&nbsp;</td>		
				<td width="4%">
					&nbsp;<a onclick="document.getElementById('filtreCommandeForm').submit();" class="bouton" href="#" title="Filtrer"><span><span>Filtrer</span></span></a>&nbsp;
				</td>
				<spring:bind path="filter.sort">
					<input type="hidden" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" />
				</spring:bind>		
			</form>		
		</tr>
		<tr><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td>&nbsp;</td></tr>
		<c:forEach var="commande" items="${listeCommande}" varStatus="i">
			<tr>
				<td class="back">
					<c:out value="${commande.id}"/>
				</td>
				<td class="back">
					<c:out value="${commande.membre.nom}"/>&nbsp;<c:out value="${commande.membre.prenom}"/>
				</td>
				<td class="back">
					<c:out value="${commande.dateNormale}"/>
				</td>
				<td class="back">
					<c:choose>
						<c:when test="${commande.etat == 0}">Commandée</c:when>
						<c:when test="${commande.etat == 1}">En traitement</c:when>
						<c:when test="${commande.etat == 2}">En livraison</c:when>
						<c:when test="${commande.etat == 3}">Livrée</c:when>
						<c:when test="${commande.etat == 4}">En attente</c:when>
					</c:choose>
				</td>
				<td class="back">
					<c:out value="${commande.prixFormate}"/>
				</td>
				<td width="4%">
					&nbsp;&nbsp;
					<form style="display:inline;" name="commande_modif_<c:out value="${i.index}"/>" method="post" action="./modifCommande.htm">
						<input type="hidden" name="id" value="<c:out value="${commande.id}"/>">
						<input type="hidden" name="action" value="2"/>
						<a href="#" onclick="document.commande_modif_<c:out value="${i.index}"/>.submit();"><img src="/${ROOT}/resources/pic/panier/edit.gif" border="0"/></a>
					</form>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<form style="display:inline;" name="commande_del_<c:out value="${i.index}"/>" method="post" action="./modifCommande.htm">
						<input type="hidden" name="id" value="<c:out value="${commande.id}"/>">
						<input type="hidden" name="action" value="3"/>
						<a href="#" onclick="if (confirm('Etes-vous certain de vouloir supprimer cette commande ?')) eval('document.commande_del_<c:out value="${i.index}"/>.submit();')"><img src="/${ROOT}/resources/pic/panier/corbeille.gif" border="0"/></a>
					</form>
				</td>
			</tr>
			
		</c:forEach>
	
	</table>
</div>
