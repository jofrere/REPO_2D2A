<%@ include file="../../head/include.jsp" %>

<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->
	<p class="b brown fs13 mt5">Gestion des produits</p>
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
			<td class="left">Prix d'achat total</td>
			<td class="right"><c:out value="${prixAchat}"/></td>
		</tr>
		<tr>
			<td class="left">Prix de vente total</td>
			<td class="right"><c:out value="${prix}"/></td>
		</tr>
		<tr>
			<td class="left">Bénéfice</td>
			<td class="right"><c:out value="${benef}"/></td>
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
		<col class="col1_Back"/>
		<col/>
		<tr>
			<th>Référence</th>
			<th>Nom</th>
			<th>Achat/Dépôt</th>
			<th>Visibilité</th>
			<th>Rubrique</th>
			<th>&nbsp;</th>
		</tr>
		<tr><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td>&nbsp;</td></tr>
		<tr>
			<form name="filtreProduit" id="filtreProduit" action="" method="POST">
				<td class="back">
					<spring:bind path="filter.reference">
						<input type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" />
					</spring:bind>
				</td>
				<td class="back">&nbsp;</td>
				<td class="back">
					<spring:bind path="filter.achatDepot">
						<select name="<c:out value="${status.expression}"/>" id="<c:out value="${status.expression}"/>">
							<option value="-1" <c:if test="${status.value == -1}">selected="selected"</c:if>>Tous</option>
							<option value="0" <c:if test="${status.value == 0}">selected="selected"</c:if>>Achat</option>
							<option value="1" <c:if test="${status.value == 1}">selected="selected"</c:if>>Dépôt</option>		
						</select>
					</spring:bind>
				</td>
				<td class="back">
					<spring:bind path="filter.visuLang">
						<select name="<c:out value="${status.expression}"/>" id="<c:out value="${status.expression}"/>">
							<option value="-1" <c:if test="${status.value == -1}">selected="selected"</c:if>>Pas de filtre</option>
							<option value="0" <c:if test="${status.value == 0}">selected="selected"</c:if>>Aucune Visibilité</option>
							<option value="1" <c:if test="${status.value == 1}">selected="selected"</c:if>>Qu'en français</option>		
							<option value="2" <c:if test="${status.value == 2}">selected="selected"</c:if>>Qu'en anglais</option>
							<option value="3" <c:if test="${status.value == 3}">selected="selected"</c:if>>Visible partout</option>
						</select>
					</spring:bind>
				</td>
				<td class="back">
					<spring:bind path="filter.rubrique">
						<select name="<c:out value="${status.expression}"/>" id="<c:out value="${status.expression}"/>">
							<option value="-1" <c:if test="${status.value == -1}">selected="selected"</c:if>>Pas de filtre</option>
							<c:forEach var="rubrique" items="${listeRubrique}">
								<option value="<c:out value="${rubrique.rubId}"/>" <c:if test="${status.value == rubrique.rubId}">selected="selected"</c:if>><c:out value="${rubrique.nom}"/></option>
							</c:forEach>
						</select>
					</spring:bind>
				</td>
				<td>
					&nbsp;<a onclick="document.getElementById('filtreProduit').submit();" class="bouton" href="#" title="Filtrer"><span><span>Filtrer</span></span></a>&nbsp;
				</td>
			</form>
		</tr>
		<tr><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td>&nbsp;</td></tr>
		<c:forEach var="produit" items="${listeProduit}" varStatus="i">
			
			<tr>
				<td class="back">
					<c:out value="${produit.reference}"/>
				</td>
				<td class="back">
					<c:out value="${produit.nom}"/>
				</td>
				<td class="back">
					<c:choose>
						<c:when test="${produit.achatDepot == 0}">
							Achat
						</c:when>
						<c:otherwise>
							Dépôt
						</c:otherwise>
					</c:choose>
				</td>
				<td class="back">
					<c:choose>
						<c:when test="${produit.visuLang == 0}">
							Nulle part
						</c:when>
						<c:when test="${produit.visuLang == 1}">
							Français
						</c:when>
						<c:when test="${produit.visuLang == 2}">
							Anglais
						</c:when>
						<c:when test="${produit.visuLang == 3}">							
							Partout
						</c:when>
					</c:choose>
				</td>
				<td class="back">&nbsp;</td>
				<td>
					<form style="display:inline;" name="produit_modif_<c:out value="${i.index}"/>" method="post" action="./modifProduit.htm">
						<input type="hidden" name="proId" value="<c:out value="${produit.proId}"/>">
						<input type="hidden" name="action" value="2"/>
					</form>
				
					<form style="display:inline;" name="produit_del_<c:out value="${i.index}"/>" method="post" action="./modifProduit.htm">
						<input type="hidden" name="proId" value="<c:out value="${produit.proId}"/>">
						<input type="hidden" name="action" value="3"/>						
					</form>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#" onclick="document.produit_modif_<c:out value="${i.index}"/>.submit();"><img src="/${ROOT}/resources/pic/panier/edit.gif" border="0"/></a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#" onclick="if (confirm('Etes-vous certain de vouloir supprimer ce produit ?')) eval('document.produit_del_<c:out value="${i.index}"/>.submit();')"><img src="/${ROOT}/resources/pic/panier/corbeille.gif" border="0"/></a>
				</td>
			</tr>			
		</c:forEach>	
	</table>
	<div style="text-align: center; width: 100%;">
		<br />
		<br :>
		<form style="display:inline; width: 100%;" name="produit_add" id="produit_add" method="post" action="./modifProduit.htm">
			<input type="hidden" name="action" value="1"/>
			<a onclick="document.getElementById('produit_add').submit();" class="bouton" href="#" title="Créer un nouveau produit"><span><span>Créer un nouveau produit</span></span></a>
		</form>
	</div>
</div>
