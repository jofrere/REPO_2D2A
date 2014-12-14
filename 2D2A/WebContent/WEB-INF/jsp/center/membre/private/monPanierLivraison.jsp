<%@ include file="../../../head/include.jsp" %>

<script type="text/javascript" src="/${ROOT}/resources/js/panier.js"></script> 
<script type="text/javascript" src="/${ROOT}/resources/js/print.js"></script> 
<script type="text/javascript" src="/${ROOT}/resources/js/address.js"></script>

<!-- startPanier -->

	
   <div id="crawlPanier" class="phase2">
   	<ul>
		<li class="crawlPanierStep1"><a href="#" title="<spring:message code="monPanier.step1"/>">1<br/><span><spring:message code="monPanier.step1"/></span></a></li>
		<li class="crawlPanierStep2"><a href="#" title="<spring:message code="monPanier.step2"/>">2<br/><span><spring:message code="monPanier.step2"/></span></a></li>
		<li class="crawlPanierStep3"><a href="#" title="<spring:message code="monPanier.step3"/>">3<br/><span><spring:message code="monPanier.step3"/></span></a></li>
		<li class="crawlPanierStep4"><a href="#" title="<spring:message code="monPanier.step4"/>">4<br/><span><spring:message code="monPanier.step4"/></span></a></li>
		<li class="crawlPanierStep5"><a href="#" title="<spring:message code="monPanier.step5"/>">5<br/><span><spring:message code="monPanier.step5"/></span></a></li>
	</ul>
</div>
   <div id="enteteFiche">
   	<strong class="brown"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.civilite.titre}"/>&nbsp;<c:out value="${sessionScope.AUTHENTICATED_MEMBER.prenom}"/>&nbsp;<c:out value="${sessionScope.AUTHENTICATED_MEMBER.nom}"/></strong>
   </div>


   <form action="/${ROOT}/mesCoordonnees.htm" method="post" id="factuForm">
	<input type="hidden" value="<c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].adrId}"/>" name="idAdresse" id="idAdresse" />
	<input type="hidden" name="action" value="1"/>
</form>
   <form action="/${ROOT}/mesCoordonnees.htm" method="post" id="livraisonForm">
	<input type="hidden" value="<c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].adrId}"/>" name="idAdresse" id="idAdresse" />
	<input type="hidden" name="action" value="1"/>
</form>


<form name="monPanierRecapitulatifForm" action="" method="post">
   	<input type="hidden" name="action" value="0" />
    <div class="lalivraison">
    	<div>
		    <spring:bind path="maCommande.*">
		   		<c:if test="${status.error}"><br/><span id="obligatoire"><ul></c:if>
		        	<c:forEach items="${status.errorMessages}" var="error">
		        		<li><c:out value="${error}"/></li>
		        	</c:forEach>
		        <c:if test="${status.error}"></ul></span><br /></c:if>
		   	</spring:bind>
		</div>
		<spring:message code="monPanierRecapitulatif.livraison.exp"/>
	</div>
	
	
    <div class="grey b">
      <spring:message code="monPanierRecapitulatif.livraison.expCochage" htmlEscape="false"/>
    </div>
    <div class="livraisonCheckBox">
    	<spring:bind path="maCommande.livraisonWeek">
	    	<div  class="mt15">
	    		<input type="radio" name="<c:out value="${status.expression}"/>" value="3" <c:if test="${status.value==3 || status.value==0}">checked="checked"</c:if>/>
	            <label for="<c:out value="${status.expression}"/>">
	            	<strong><spring:message code="monPanierRecapitulatif.livraison.reception" htmlEscape="false"/></strong>
	            </label>
	            &nbsp;<spring:message code="monPanierRecapitulatif.livraison.email" htmlEscape="false"/>
	        </div>
			<div class="mt15">
				<strong><spring:message code="monPanierRecapitulatif.livraison.desirWeek" htmlEscape="false"/></strong>
				&nbsp;<spring:message code="monPanierRecapitulatif.livraison.desirWeekSupp" />
				<input type="radio" name="<c:out value="${status.expression}"/>" value="1" <c:if test="${status.value==1}">checked="checked"</c:if>/>
	        	<spring:message code="monPanierRecapitulatif.livraison.semaine"/>
	        	<input type="radio" name="<c:out value="${status.expression}"/>" value="2" <c:if test="${status.value==2}">checked="checked"</c:if>/>
	        	<spring:message code="monPanierRecapitulatif.livraison.weekend"/>
			</div>
		</spring:bind>
		
		<spring:bind path="maCommande.livraisonHeure">
	        <div class="mt15"><strong><spring:message code="monPanierRecapitulatif.livraison.desirHeure" htmlEscape="false"/></strong>
	        	<input type="radio" name="<c:out value="${status.expression}"/>" value="1" <c:if test="${status.value==1 || status.value==0}">checked="checked"</c:if>/>
	        	<spring:message code="monPanierRecapitulatif.livraison.heure1"/>
	        	<input type="radio" name="<c:out value="${status.expression}"/>" value="2" <c:if test="${status.value==2}">checked="checked"</c:if>/>
	        	<spring:message code="monPanierRecapitulatif.livraison.heure2"/>
	        	<input type="radio" name="<c:out value="${status.expression}"/>" value="3" <c:if test="${status.value==3}">checked="checked"</c:if>/>
	        	<spring:message code="monPanierRecapitulatif.livraison.heure3"/>
	        </div>
 		</spring:bind>
	</div>
	
	
	<script>
    	var addresses = new Array();
    
	    <c:forEach var="adresse" items="${sessionScope.AUTHENTICATED_MEMBER.adresses}" varStatus="i">
	    	var add<c:out value="${i.count}"/> = new Address(<c:out value="${adresse.javascript}" escapeXml="false"/>);
	    	addresses.push(add<c:out value="${i.count}"/>);	
	    </c:forEach>
	</script>
	
	<div class="blocsAdresses">
		<div class="fl left">
			<div class="lib"><span class="lib"><spring:message code="monPanierRecapitulatif.factu.label"/></span>
				<c:if test="${empty param['imprimer']}">
					<spring:bind path="maCommande.adrFacId">
				    	<select name="<c:out value="${status.expression}"/>" onchange="updateAddress(this.selectedIndex)">
				    		<c:forEach var="adresse" items="${sessionScope.AUTHENTICATED_MEMBER.adresses}">
								<option value="<c:out value="${adresse.adrId}"/>" <c:if test="${status.value==adresse.adrId}">selected="selected"</c:if>><c:out value="${adresse.nomAdresse}"/></option>
							</c:forEach>
				    	</select>
				    </spring:bind>
			    </c:if>
			</div>
			
			<c:if test="${not empty sessionScope.AUTHENTICATED_MEMBER.adresses[0].societe}">
	    		<span id="societe"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].societe}"/></span><br/>
	    	</c:if>
	    	<span id="prenom"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.prenom}"/></span>&nbsp;<span id="nom"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.nom}"/></span><br />
	    	<span id="adresse"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].adresse}"/></span><br />
	    	<span id="compAdresse"><c:if test="${not empty sessionScope.AUTHENTICATED_MEMBER.adresses[0].complementAdresse}">
	    		<c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].complementAdresse}"/>
	    	</c:if></span><br />
	    	<span id="codePostal"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].codePostal}"/></span>&nbsp;<span id="ville"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].ville}"/></span><br />
	    	<span id="pays"><c:if test="${not empty sessionScope.AUTHENTICATED_MEMBER.adresses[0].pays.nom}">
	    		<c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].pays.nom}"/>
	    	</c:if></span><br/>
	    	<span id="telPrive"><c:if test="${not empty sessionScope.AUTHENTICATED_MEMBER.adresses[0].telPrive}">
	    		<c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].telPrive}"/>
	    	</c:if></span><br />
			<br />
			<a class="bouton" href="#" onclick="document.getElementById('factuForm').submit();" title="<spring:message code="monPanierRecapitulatif.factu.modif"/>"><span><span><spring:message code="monPanierRecapitulatif.livraison.adresse.modif"/></span></span></a>
			
		</div>
		<div class="fr right">
			<div class="lib"><span class="lib"><spring:message code="monPanierRecapitulatif.livraison.adresse"/></span>
				<c:if test="${empty param['imprimer']}">
					<spring:bind path="maCommande.adrLivId">
				    	<select name="<c:out value="${status.expression}"/>" onchange="updateAddress2(this.selectedIndex)">
				    		<c:forEach var="adresse" items="${sessionScope.AUTHENTICATED_MEMBER.adresses}">
								<option value="<c:out value="${adresse.adrId}"/>" <c:if test="${status.value==adresse.adrId}">selected="selected"</c:if>><c:out value="${adresse.nomAdresse}"/></option>
							</c:forEach>
				    	</select>
				    </spring:bind>
				</c:if>
			</div>
			<c:if test="${not empty sessionScope.AUTHENTICATED_MEMBER.adresses[0].societe}">
	    		<span id="societe2"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].societe}"/></span><br/>
	    	</c:if>
	    	<span id="prenom2"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.prenom}"/></span>&nbsp;<span id="nom2"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.nom}"/></span><br />
	    	<span id="adresse2"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].adresse}"/></span><br />
	    	<span id="compAdresse2"><c:if test="${not empty sessionScope.AUTHENTICATED_MEMBER.adresses[0].complementAdresse}">
	    		<c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].complementAdresse}"/>
	    	</c:if></span><br />
	    	<span id="codePostal2"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].codePostal}"/></span>&nbsp;<span id="ville2"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].ville}"/></span><br />
	    	<span id="pays2"><c:if test="${not empty sessionScope.AUTHENTICATED_MEMBER.adresses[0].pays.nom}">
	    		<c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].pays.nom}"/>
	    	</c:if></span><br/>
	    	<span id="telPrive2"><c:if test="${not empty sessionScope.AUTHENTICATED_MEMBER.adresses[0].telPrive}">
	    		<c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].telPrive}"/>
	    	</c:if></span><br />
			<br/>
			<a class="bouton" href="#" onclick="document.getElementById('livraisonForm').submit();" title="<spring:message code="monPanierRecapitulatif.factu.modif"/>"><span><span><spring:message code="monPanierRecapitulatif.livraison.adresse.modif"/></span></span></a>
			<a class="bouton" href="#" onclick="window.location='./mesAdresses.htm';" title="<spring:message code="monPanierRecapitulatif.livraison.adresse.ajout" />"><span><span><spring:message code="monPanierRecapitulatif.livraison.adresse.ajout" /></span></span></a>
		</div>
	</div>
	<div class="XP"></div>
	<div class="lalivraison">
		<spring:message code="monPanierRecapitulatif.livraison.nextStep"/><br/><br/>
		<a href="#" class="bouton" onclick="document.monPanierRecapitulatifForm.action.value=2;document.monPanierRecapitulatifForm.submit();" title="<spring:message code="monPanierRecapitulatif.livraison.nextStepButton"/>"><span><span><spring:message code="monPanierRecapitulatif.livraison.nextStepButton"/></span></span></a>
    </div>
</form>

<div class="XP"></div>
