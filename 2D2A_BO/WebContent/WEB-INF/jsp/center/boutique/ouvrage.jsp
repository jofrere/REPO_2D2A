<%@ include file="../../head/include.jsp" %>

<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->
	<p class="b brown fs13 mt5">Gestion des ouvrages</p>
	<!-- endTitleFiche -->
</div>
<div id="separationEnteteFiche"></div>
<!-- endEnteteFiche -->

<div id="ficheCorps">

	<table class="formulaire">
		<col class="col1"/>
		<col class="col2"/>
		<tr>
			<td class="left title">Etat du stock</td>
			<td class="right">&nbsp;</td>
		</tr>
		<tr>
			<td class="left">Quantité d'articles</td>
			<td class="right"><c:out value="${qtte}"/></td>
		</tr>
		<tr>
			<td class="left">Prix de vente total</td>
			<td class="right"><c:out value="${prix}"/></td>
		</tr>
	</table>
	<br />
	<hr />
	<br />

	<table class="formulaire">
		<col class="col1_Back"/>
		<col class="col1_Back"/>
		<col class="col1_Back"/>
		<col class="col1_Back"/>
		<col/>
		<tr>
			<th>Type</th>
			<th>Référence</th>
			<th>Titre</th>
			<th>Auteur</th>
			<th>&nbsp;</th>
		</tr>
		<tr><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td>&nbsp;</td></tr>
		<tr>
			<form name="filtreOuvrage" id="filtreOuvrage" action="" method="POST">
				<td class="back">
					<spring:bind path="filter.type">
						<select name="<c:out value="${status.expression}"/>" id="<c:out value="${status.expression}"/>">
							<option value="-1" <c:if test="${status.value == -1}">selected="selected"</c:if>></option>
							<option value="0" <c:if test="${status.value == 0}">selected="selected"</c:if>>Presse</option>
							<option value="1" <c:if test="${status.value == 1}">selected="selected"</c:if>>Bibliothèque</option>		
						</select>
					</spring:bind>
				</td>
				<td class="back">
					<spring:bind path="filter.reference">
						<input type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" />
					</spring:bind>
				</td>
				<td class="back">
					<spring:bind path="filter.titre">
						<input type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" />
					</spring:bind>
				</td>
				<td class="back">
					<spring:bind path="filter.auteur">
						<input type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" />
					</spring:bind>
				</td>
				<td>
					&nbsp;<a onclick="document.getElementById('filtreOuvrage').submit();" class="bouton" href="#" title="Filtrer"><span><span>Filtrer</span></span></a>&nbsp;
				</td>
			</form>
		</tr>
		<tr><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td>&nbsp;</td></tr>
		<c:forEach var="ouvrage" items="${ouvrages}" varStatus="i">
			
			<tr>
				<td class="back">
					<c:choose>
						<c:when test="${ouvrage.type == 0}">Presse</c:when>
						<c:otherwise>Bibliothèque</c:otherwise>
					</c:choose>
				</td>
				<td class="back">
					<c:out value="${ouvrage.reference}"/>
				</td>
				<td class="back">
					<c:out value="${ouvrage.titre}"/>
				</td>
				<td class="back">
					<c:out value="${ouvrage.auteur}"/>
				</td>
				<td>
					<form style="display:inline;" name="ouvrage_modif_<c:out value="${i.index}"/>" method="post" action="./modifOuvrage.htm">
						<input type="hidden" name="id" value="<c:out value="${ouvrage.id}"/>">
						<input type="hidden" name="action" value="2"/>
					</form>
				
					<form style="display:inline;" name="ouvrage_del_<c:out value="${i.index}"/>" method="post" action="./modifOuvrage.htm">
						<input type="hidden" name="id" value="<c:out value="${ouvrage.id}"/>">
						<input type="hidden" name="action" value="3"/>						
					</form>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#" onclick="document.ouvrage_modif_<c:out value="${i.index}"/>.submit();"><img src="/${ROOT}/resources/pic/panier/edit.gif" border="0"/></a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#" onclick="if (confirm('Etes-vous certain de vouloir supprimer cet ouvrage ?')) eval('document.ouvrage_del_<c:out value="${i.index}"/>.submit();')"><img src="/${ROOT}/resources/pic/panier/corbeille.gif" border="0"/></a>
				</td>
			</tr>			
		</c:forEach>	
	</table>
	<div style="text-align: center; width: 100%;">
		<br />
		<br />
		<form style="display:inline; width: 100%;" name="ouvrage_add" id="ouvrage_add" method="post" action="./modifOuvrage.htm">
			<input type="hidden" name="action" value="1"/>
			<a onclick="document.getElementById('ouvrage_add').submit();" class="bouton" href="#" title="Créer un nouvel ouvrage"><span><span>Créer un nouvel ouvrage</span></span></a>
		</form>
	</div>
</div>
