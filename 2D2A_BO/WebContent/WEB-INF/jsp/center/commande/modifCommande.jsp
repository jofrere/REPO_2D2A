<%@ include file="../../head/include.jsp" %>

<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->
	<p class="b brown fs13 mt5">
		<c:choose>
			<c:when test="${commande.action == 5}">Traitement de la commande <c:out value="${commande.id}"/></c:when>
		</c:choose>
	</p>
	<!-- endTitleFiche -->
</div>
<div id="separationEnteteFiche"></div>
<!-- endEnteteFiche -->

<div id="ficheCorps">

	<form name="modifCommande" id="modifCommande" method="post" action="">
	
		<spring:bind path="commande.id">
			<input type="hidden" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>">
		</spring:bind>
		
		<spring:bind path="commande.action">
			<input type="hidden" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>">
		</spring:bind>
		<table class="formulaire">
			<col class="col1"/>
			<col class="col2"/>
			
			<tr>
				<td class="left">Date</td>
				<td class="right"><c:out value="${commande.dateNormale}"/></td>
			</tr>
			<tr>			
				<spring:bind path="commande.etat">
					<td class="left">Etat</td>
					<td class="right">
						<input type="radio" <c:if test="${status.value == 0}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="0"/>Commandée
						<input type="radio" <c:if test="${status.value == 1}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="1"/>En traitement
						<input type="radio" <c:if test="${status.value == 2}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="2"/>En livraison
						<input type="radio" <c:if test="${status.value == 3}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="3"/>Livrée
						<input type="radio" <c:if test="${status.value == 4}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="4"/>En attente
					</td>
				</spring:bind>
			</tr>
			<tr>
				<td class="left">Prix total (en euros)</td>
				<td class="right"><c:out value="${commande.prixFormate}"/></td>
			</tr>
			<tr>
				<spring:bind path="commande.livraisonWeek">
					<td class="left">Jour de livraison</td>
					<td class="right">
						<input type="radio" <c:if test="${status.value == 1}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="1"/>Semaine
						<input type="radio" <c:if test="${status.value == 2}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="2"/>Weekend
						<input type="radio" <c:if test="${status.value == 3}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="3"/>Showroom
					</td>
				</spring:bind>
			</tr>
			<tr>
				<spring:bind path="commande.livraisonHeure">
					<td class="left">Heure de livraison</td>
					<td class="right">
						<input type="radio" <c:if test="${status.value == 1}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="1"/>Journée
						<input type="radio" <c:if test="${status.value == 2}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="2"/>Matin
						<input type="radio" <c:if test="${status.value == 3}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="3"/>Après-midi
					</td>
				</spring:bind>
			</tr>
			<tr>
				<td class="left">Membre</td>
				<td class="right"><c:out value="${commande.membre.prenom}"/> <c:out value="${commande.membre.nom}"/></td>
			</tr>
			<tr>
				<td class="left">Adresse de Livraison</td>	
			    <td class="right">    	
<textarea rows="8" cols="50" readonly="readonly"><c:if test="${not empty commande.adresseLivraison.societe}"><c:out value="${commande.adresseLivraison.societe}"/></c:if>
<c:out value="${commande.adresseLivraison.prenom}"/> <c:out value="${commande.adresseLivraison.nom}"/>
<c:out value="${commande.adresseLivraison.adresse}"/>
<c:if test="${not empty commande.adresseLivraison.complementAdresse}"><c:out value="${commande.adresseLivraison.complementAdresse}"/></c:if>
<c:out value="${commande.adresseLivraison.codePostal}"/>&nbsp;<c:out value="${commande.adresseLivraison.ville}"/>
<c:if test="${not empty commande.adresseLivraison.pays.nom}"><c:out value="${commande.adresseLivraison.pays.nom}"/></c:if>
<c:if test="${not empty commande.adresseLivraison.telPrive}"><c:out value="${commande.adresseLivraison.telPrive}"/></c:if>
</textarea>
			    </td>
		   </tr>
		   <tr>
			    <td class="left">Adresse de facturation</td>	
			    <td class="right">    	
<textarea rows="8" cols="50" readonly="readonly"><c:if test="${not empty commande.adresseFactu.societe}"><c:out value="${commande.adresseFactu.societe}"/></c:if>
<c:out value="${commande.adresseFactu.prenom}"/> <c:out value="${commande.adresseFactu.nom}"/>
<c:out value="${commande.adresseFactu.adresse}"/>
<c:if test="${not empty commande.adresseFactu.complementAdresse}"><c:out value="${commande.adresseFactu.complementAdresse}"/></c:if>
<c:out value="${commande.adresseFactu.codePostal}"/>&nbsp;<c:out value="${commande.adresseFactu.ville}"/>
<c:if test="${not empty commande.adresseFactu.pays.nom}"><c:out value="${commande.adresseFactu.pays.nom}"/></c:if>
<c:if test="${not empty commande.adresseFactu.telPrive}"><c:out value="${commande.adresseFactu.telPrive}"/></c:if>
</textarea>
			    </td>
			</tr>
			<tr>
			   	<td class="left">Liste des produits</td>
			   	<td class="right">
			    	<table>
						<col class="col1_Back"/>
						<col class="col1_Back"/>
						<col class="col1_Back"/>
						<col class="col1_Back"/>
						<col class="col1_Back"/>
						<tr>
							<th>Quantité</th>
							<th>Nom</th>
							<th>Référence</th>
							<th>Coloris</th>
							<th>Prix</th>
						</tr>   	
				    	<c:forEach var="commandeProduit" items="${commande.produits}">
				    		<tr>
				    			<td class="back"><c:out value="${commandeProduit.quantite}"/></td>
				    			<td class="back"><c:out value="${commandeProduit.produit.nom}"/></td>
				    			<td class="back"><c:out value="${commandeProduit.produit.reference}"/></td>
				    			<td class="back"><c:out value="${commandeProduit.coloris.nom}"/></td>
				    			<td class="back"><c:out value="${commandeProduit.prixUnitaireFormate}"/></td>
				    		</tr>	    		
				    	</c:forEach>
			    	</table>
			    </td>
		    </tr>
		</table>
	</form>
	<div align="center">
		<%--<input type="button" name="PDF" value="Générer bon de livraison" onclick="window.open('/${ROOT}/huhu.pdf');"/>&nbsp;&nbsp;&nbsp;--%>
		<a onclick="document.getElementById('modifCommande').submit();" class="bouton" href="#" title="Valider"><span><span>Valider</span></span></a>
		<%--<input type="button" name="PDF" value="Générer facture" onclick="window.open('/${ROOT}/huhu.pdf');"/>--%>
	</div>
</div>
