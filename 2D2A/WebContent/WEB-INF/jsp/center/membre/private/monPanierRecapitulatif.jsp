<%@ include file="../../../head/include.jsp" %>

<link id="global" rel="Stylesheet" type="text/css" href="/${ROOT}/resources/css/membre.css" media="all" />

<script src="/${ROOT}/resources/js/address.js"></script>

<div class="membre">

	<div id="membre_left"><spring:message code="monPanier.title" /></div>
    <div id="membre_right">Pictos[Retour][imprimer][enregistrer]</div>
    <div id="membre_center">
    	<c:out value="${DATE_TODAY}"/>    	
    </div>
    
    <div id="form_left">&nbsp;</div>
    <div id="form_center_very_long">
    	<b><c:out value="${sessionScope.AUTHENTICATED_MEMBER.civilite.titre}"/>&nbsp;<c:out value="${sessionScope.AUTHENTICATED_MEMBER.prenom}"/>&nbsp;<c:out value="${sessionScope.AUTHENTICATED_MEMBER.nom}"/></b><br /><br />
    </div>
    
    <div id="form_left">&nbsp;</div>
    <div id="form_center_very_long">
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="monPanier.identification.identification" htmlEscape="false"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	<b><spring:message code="monPanier.identification.recap" htmlEscape="false"/></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	<spring:message code="monPanier.identification.paiement" htmlEscape="false"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	<spring:message code="monPanier.identification.confirmation" htmlEscape="false"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
    </div>
    
    <div id="form_left">&nbsp;</div>
    <div id="form_center_very_long">
	    <spring:bind path="maCommande.*">
	   		<c:if test="${status.error}"><br/><span id="obligatoire"><ul></c:if>
	        	<c:forEach items="${status.errorMessages}" var="error">
	        		<li><c:out value="${error}"/></li>
	        	</c:forEach>
	        <c:if test="${status.error}"></ul></span><br /></c:if>
	   	</spring:bind>
	</div>
	
	<div id="form_center_very_very_long">&nbsp;<br />&nbsp;<br />&nbsp;<br /></div>
	
    <div id="form_center_very_very_long">
	    <table border="1" style="font-size: 10;">
	    	<tr>
	    		<th>
	    			<spring:message code="monPanier.visuelArticle"/>
	    		</th>
	    		<th>
	    			<spring:message code="monPanier.refArticle"/>
	    		</th>
	    		<th>
	    			<spring:message code="monPanier.descArticle"/>
	    		</th>
	    		<th>
	    			<spring:message code="monPanier.stockArticle"/>
	    		</th>
	    		<th>
	    			<spring:message code="monPanier.quantiteArticle"/>
	    		</th>
	    		<th>
	    			<spring:message code="monPanier.prixHtArticle"/>
	    		</th>
	    		<th>
	    			<spring:message code="monPanier.prixTtcArticle" />
	    		</th>
	    		<th>
	    			<spring:message code="monPanier.prixTotal"/>
	    		</th>    		
	    	</tr>
	    
	    	<c:forEach var="produit" items="${sessionScope.MON_PANIER.mesProduits}" varStatus="i">
	    		<tr>    			
		    		<td>
		    			<img src="/${ROOT}/<c:out value="${produit.images[0].vignette}"/>" width="30px;" height="30px;"/>
		    		</td>
		    		<td>
		    			<c:out value="${produit.reference}"/>
		    		</td>
		    		<td>
		    			<b>
		    			<c:out value="${produit.description}"/><br/>
		    			<c:out value="${produit.designer.prenom}"/>&nbsp;<c:out value="${produit.designer.nom}"/><br/>
		    			<c:out value="${produit.editeur.prenom}"/>&nbsp;<c:out value="${produit.editeur.nom}"/><br/>
		    			</b>
		    		</td>
		    		<td>
		    			<c:out value="${produit.quantite}"/>
		    		</td>
		    		<td>
		    			<c:out value="${produit.quantiteReservee}"/>
		    		<td>
		    			<c:out value="${produit.prixHt}"/>
		    		</td>
		    		<td>
		    			<c:out value="${produit.prix}"/>
		    		</td>
		    		<td id="prixTotal_<c:out value="${i}"/>">
		    			<c:out value="${produit.prixTotal}"/>
		    		</td>    		
		    	</tr>
	    	</c:forEach>
	    	<tr>
	   			<td colspan="6">&nbsp;</td>
	    		<td><spring:message code="monPanier.prixTotal"/></td>
	    		<td id="prixTotal_Final">
	    			<c:out value="${sessionScope.MON_PANIER.prix}"/>
	    		</td>
	    	</tr>
	    </table>
	</div>	    
    
    <div id="form_center_very_very_long">&nbsp;<br /></div>
    <div id="form_center_very_very_long">&nbsp;<br /></div>
    <div id="form_center_very_very_long">&nbsp;<br /></div>
    <div id="form_center_very_very_long">&nbsp;<br /></div>
    
    <!-- zone boutons -->
    
    <div id="membre_left">
    	<input type="button" value="<spring:message code="monPanierRecapitulatif.bouton.modifierPanier"/>" onClick="window.location='./monPanier.htm';"/>
    </div>
    
    <div id="membre_right">
    	<input type="button" value="<spring:message code="monPanierRecapitulatif.bouton.continuer"/>" onClick="history.go(-1);"/>
    </div>
    
    <div id="membre_center">
    	<form name="annulerCommande" method="POST" action="">
    		<input type="hidden" name="action" value="1"/>
    		<input type="submit" value="<spring:message code="monPanierRecapitulatif.bouton.annuler"/>"/>
    	</form>
    </div>
    
    <!-- Fin zone boutons -->
    
    <form name="monPanierRecapitulatifForm" action="" method="POST">
    
    	<input type="hidden" name="action" value="0" />
    	
	    <div id="form_center_very_very_long" style="border: 1px black solid;vertical-align: center;">
	    	<spring:message code="monPanierRecapitulatif.livraison.exp"/>
	    </div>
	    
	    <spring:bind path="maCommande.livraisonWeek">
		    <div id="form_center_very_very_long">
		   		<spring:message code="monPanierRecapitulatif.livraison.expCochage" htmlEscape="false"/><input type="radio" name="<c:out value="${status.expression}"/>" value="3" <c:if test="${status.value==3 || status.value==0}">checked="checked"</c:if>/><spring:message code="monPanierRecapitulatif.livraison.reception" htmlEscape="false"/>	   		
		    </div>
		    <div id="form_left">&nbsp;</div>
		    <div id="form_center_very_long">
		    	<spring:message code="monPanierRecapitulatif.livraison.email" htmlEscape="false"/>
		    </div>
		    
		    <div id="form_center_very_very_long">	    	
		    	<spring:message code="monPanierRecapitulatif.livraison.desirWeek" htmlEscape="false"/>&nbsp;<input type="radio" name="<c:out value="${status.expression}"/>" value="1" <c:if test="${status.value==1}">checked="checked"</c:if>/><spring:message code="monPanierRecapitulatif.livraison.semaine"/>&nbsp;<input type="radio" name="<c:out value="${status.expression}"/>" value="2" <c:if test="${status.value==2}">checked="checked"</c:if>/><spring:message code="monPanierRecapitulatif.livraison.weekend"/>
		    </div>
	    </spring:bind>
	    
	    <div id="form_center_very_very_long">
	    	<spring:bind path="maCommande.livraisonHeure">
	    		<spring:message code="monPanierRecapitulatif.livraison.desirHeure" htmlEscape="false"/>&nbsp;<input type="radio" name="<c:out value="${status.expression}"/>" value="1" <c:if test="${status.value==1 || status.value==0}">checked="checked"</c:if>/><spring:message code="monPanierRecapitulatif.livraison.heure1"/>&nbsp;<input type="radio" name="<c:out value="${status.expression}"/>" value="2" <c:if test="${status.value==2}">checked="checked"</c:if>/><spring:message code="monPanierRecapitulatif.livraison.heure2"/>&nbsp;<input type="radio" name="<c:out value="${status.expression}"/>" value="3" <c:if test="${status.value==3}">checked="checked"</c:if>/><spring:message code="monPanierRecapitulatif.livraison.heure3"/>
	    	</spring:bind>
	    </div>
	    
	    <div id="form_center_very_very_long">&nbsp;<br /></div>
	    
	    <div id="form_center_very_very_long"><input type="button" value="<spring:message code="monPanierRecapitulatif.livraison.adresse.ajout" />" onClick="window.location='./mesAdresses.htm';"/></div>
	    
	    
	    <script>
	    	var addresses = new Array();
	    
		    <c:forEach var="adresse" items="${sessionScope.AUTHENTICATED_MEMBER.adresses}" varStatus="i">
		    	var add<c:out value="${i.count}"/> = new Address(<c:out value="${adresse.javascript}" escapeXml="false"/>);
		    	addresses.push(add<c:out value="${i.count}"/>);	
		    </c:forEach>
		</script>
		
	    
	    <div id="form_long_left">
	    	<spring:bind path="maCommande.adrFacId">
		    	<select name="<c:out value="${status.expression}"/>" onchange="updateAddress(this.selectedIndex)">
		    		<c:forEach var="adresse" items="${sessionScope.AUTHENTICATED_MEMBER.adresses}">
						<option value="<c:out value="${adresse.id}"/>" <c:if test="${status.value==adresse.id}">selected="selected"</c:if>><c:out value="${adresse.nomAdresse}"/></option>
					</c:forEach>
		    	</select>
		    </spring:bind>
	    </div>
	    <div id="form_long_right">
	    	<spring:bind path="maCommande.adrLivId">
		    	<select name="<c:out value="${status.expression}"/>" onchange="updateAddress2(this.selectedIndex)">
		    		<c:forEach var="adresse" items="${sessionScope.AUTHENTICATED_MEMBER.adresses}">
						<option value="<c:out value="${adresse.id}"/>" <c:if test="${status.value==adresse.id}">selected="selected"</c:if>><c:out value="${adresse.nomAdresse}"/></option>
					</c:forEach>
		    	</select>
		    </spring:bind>
	   	</div>
	    
	    <div id="form_long_left">
	    	<b><spring:message code="monPanierRecapitulatif.factu.label"/></b><br />	    	
	    	<span id="societe"><c:if test="${not empty sessionScope.AUTHENTICATED_MEMBER.adresses[0].societe}">
	    		<c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].societe}"/><br/>
	    	</c:if></span>
	    	<span id="prenom"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.prenom}"/></span>&nbsp;<span id="nom"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.nom}"/></span><br />
	    	<span id="adresse"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].adresse}"/></span><br />
	    	<span id="compAdresse"><c:if test="${not empty sessionScope.AUTHENTICATED_MEMBER.adresses[0].complementAdresse}">
	    		<c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].complementAdresse}"/><br />
	    	</c:if></span>
	    	<span id="codePostal"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].codePostal}"/></span>&nbsp;<span id="ville"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].ville}"/></span><br />
	    	<span id="pays"><c:if test="${not empty sessionScope.AUTHENTICATED_MEMBER.adresses[0].pays.nom}">
	    		<c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].pays.nom}"/><br/>
	    	</c:if></span>
	    	<span id="telPrive"><c:if test="${not empty sessionScope.AUTHENTICATED_MEMBER.adresses[0].telPrive}">
	    		<c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].telPrive}"/><br />
	    	</c:if></span>
	    </div>
	    
	    <div id="form_long_right">
	    	<b><spring:message code="monPanierRecapitulatif.livraison.adresse"/></b><br />
	    	<span id="societe2"><c:if test="${not empty sessionScope.AUTHENTICATED_MEMBER.adresses[0].societe}">
	    		<c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].societe}"/><br/>
	    	</c:if></span>
	    	<span id="prenom2"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.prenom}"/></span>&nbsp;<span id="nom2"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.nom}"/></span><br />
	    	<span id="adresse2"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].adresse}"/></span><br />
	    	<span id="compAdresse2"><c:if test="${not empty sessionScope.AUTHENTICATED_MEMBER.adresses[0].complementAdresse}">
	    		<c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].complementAdresse}"/><br />
	    	</c:if></span>
	    	<span id="codePostal2"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].codePostal}"/></span>&nbsp;<span id="ville2"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].ville}"/></span><br />
	    	<span id="pays2"><c:if test="${not empty sessionScope.AUTHENTICATED_MEMBER.adresses[0].pays.nom}">
	    		<c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].pays.nom}"/><br/>
	    	</c:if></span>
	    	<span id="telPrive2"><c:if test="${not empty sessionScope.AUTHENTICATED_MEMBER.adresses[0].telPrive}">
	    		<c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].telPrive}"/><br />
	    	</c:if></span>
	    </div>
	    
	    <div id="form_center_very_very_long">&nbsp;<br /></div>
	    <div id="form_center_very_very_long">&nbsp;<br /></div>
	    <div id="form_center_very_very_long">&nbsp;<br /></div>
	        
	    <!-- zone boutons -->
	   
	    <div id="form_long_left">
	   			   		
	    </div>
	    <div id="form_long_right">
	    	
	    </div>
	    
	    
	     <!-- Fin zone boutons -->
	    
	    
	    
	    <div id="form_center_very_very_long">&nbsp;<br /></div>
	    
	    <div id="form_long_left">
	    	<spring:bind path="maCommande.acceptation">
				<input type="checkbox" name="<c:out value="${status.expression}"/>" value="1" <c:if test="${status.value==1}">checked="checked"</c:if>/>&nbsp;<spring:message code="monPanierRecapitulatif.livraison.acceptation"/>
			</spring:bind>
		</div>
		<div id="form_long_right">
	    	<input type="button" value="<spring:message code="monPanierRecapitulatif.livraison.condition"/>" onclick="window.open('/${ROOT}/conditionsGenerales.htm?cg=1', '<spring:message code="conditionsGenerales.nomPopup"/>', 'menubar=no, status=no, scrollbars=no, menubar=no, resizable=no, width=1024, height=800');"/>
	    </div>
		
		<div id="form_center_very_very_long">&nbsp;<br /></div>
		
		<div id="form_left_long">
			<spring:message code="monPanierRecapitulatif.livraison.nextStep"/>&nbsp;<input type="button" value="<spring:message code="monPanierRecapitulatif.livraison.nextStepButton"/>" onclick="document.monPanierRecapitulatifForm.action.value=2;document.monPanierRecapitulatifForm.submit();"/>
		</div>
		
		<div id="form_center_very_very_long">&nbsp;<br /></div>
		<div id="form_center_very_very_long">&nbsp;<br /></div>
		
	</form>
   
</div>