<%@ include file="../../../head/include.jsp" %>
<script type="text/javascript" src="/${ROOT}/resources/js/panier.js"></script> 
<script type="text/javascript" src="/${ROOT}/resources/js/print.js"></script> 
<script type="text/javascript" src="/${ROOT}/resources/js/address.js"></script>
<!-- startPanier -->

	<!-- 
		Pour les différents états du panier, il faut faire varier la classe ci-dessous avec :
			class="phase1" : Mon panier
			class="phase2" : Livraison 
			class="phase3" : Résumé 
			class="phase4" : Payement 
			class="phase5" : Confirmation
	-->
    
    <div id="crawlPanier" class="phase4">
    	<ul>
			<li class="crawlPanierStep1"><a href="#" title="<spring:message code="monPanier.step1"/>">1<br/><span><spring:message code="monPanier.step1"/></span></a></li>
			<li class="crawlPanierStep2"><a href="#" title="<spring:message code="monPanier.step2"/>">2<br/><span><spring:message code="monPanier.step2"/></span></a></li>
			<li class="crawlPanierStep3"><a href="#" title="<spring:message code="monPanier.step3"/>">3<br/><span><spring:message code="monPanier.step3"/></span></a></li>
			<li class="crawlPanierStep4"><a href="#" title="<spring:message code="monPanier.step4"/>">4<br/><span><spring:message code="monPanier.step4"/></span></a></li>
			<li class="crawlPanierStep5"><a href="#" title="<spring:message code="monPanier.step5"/>">5<br/><span><spring:message code="monPanier.step5"/></span></a></li>
		</ul>
		<c:if test="${empty param['imprimer']}">
			<div id="actionPage">
		    	<a href="#" onclick="javascript:imprime_zone('Imprimer', 'panier', window.location);" class="imprimer" title="Imprimer"></a>
			</div>
		</c:if>
	</div>
    <div id="enteteFiche">
    	<strong class="brown"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.civilite.titre}"/>&nbsp;<c:out value="${sessionScope.AUTHENTICATED_MEMBER.prenom}"/>&nbsp;<c:out value="${sessionScope.AUTHENTICATED_MEMBER.nom}"/></strong>
    </div>
	<div align="center">
		<form name="monPanierPaiementForm" action="" method="post">
			<input type="submit" value="Payer en ligne"/>
		</form> 
	</div>