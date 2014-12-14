<%@ include file="../../head/include.jsp" %>

<script type="text/javascript" src="/${ROOT}/resources/js/inscription.js"></script> 

<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->
	<p class="b brown fs13 mt5"><spring:message code="monCompte.title" /></p>
	<!-- endTitleFiche -->
</div>
<div id="separationEnteteFiche"></div>


<!-- startCorpsFiche -->
<div id="ficheCorps">
		<spring:message code="monCompte.successMotDePasse.titre" htmlEscape="false"/><br /><br />
    	<spring:message code="monCompte.successMotDePasse.texte" htmlEscape="false"/>&nbsp;
    	<b><c:out value="${loginmotdepasse}"/></b><br />
    	<a class="magenta" href="/${ROOT}/accueil.htm"><spring:message code="monCompte.successMotDePasse.lien"/></a>
</div>
