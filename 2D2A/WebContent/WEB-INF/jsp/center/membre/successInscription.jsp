<%@ include file="../../head/include.jsp" %>


<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->
	<p class="b brown fs13 mt5"><spring:message code="inscription.title" /></p>
</div>
<div id="separationEnteteFiche"></div>
<!-- endEnteteFiche -->


<!-- startCorpsFiche -->
<div id="ficheCorps">
	<b><spring:message code="successInscription.title"/></b><br />
	<br />
	<br />
	<spring:message code="successInscription.phrase1"/><br />
	<br />
	<spring:message code="successInscription.phrase2" arguments="${membre.login}"/><br />
</div>

