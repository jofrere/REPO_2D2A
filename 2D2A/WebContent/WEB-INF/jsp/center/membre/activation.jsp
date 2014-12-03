<%@ include file="../../head/include.jsp" %>

<script type="text/javascript" src="/${ROOT}/resources/js/inscription.js"></script> 

<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->
	<p class="b brown fs13 mt5"><spring:message code="activation.phrase1" arguments="${membre.civilite.titre},${membre.prenom},${membre.nom}" /></p>
	<!-- endTitleFiche -->
</div>
<div id="separationEnteteFiche"></div>

<!-- startCorpsFiche -->
<div id="ficheCorps">
	<spring:message code="activation.phrase2" htmlEscape="false"/>
</div>
