<%@ include file="../../../head/include.jsp" %>


<!-- startAchat -->
<div id="enteteFiche">
	<p class="b brown fs13 mt5">
		<spring:message code="mesAchats.title" arguments="${membre.civilite.titre},${membre.prenom},${membre.nom}"/>
	</p>
	
	<p>
		<br />
		<c:if test="${styleCommande == 1}">
			<a href="#" class="lien" onclick="document.getElementById('styleMesAchats').styleCommande.value=0;document.getElementById('styleMesAchats').submit();">
		</c:if>
			<spring:message code="mesAchats.enCours"/>
		<c:if test="${styleCommande == 1}">
			</a>
		</c:if>
		<span class="brown mr20">[<c:out value="${commandesEnCoursSize}"/>]</span>
		
    	<c:if test="${styleCommande == 0}">
			<a href="#" class="lien" onclick="document.getElementById('styleMesAchats').styleCommande.value=1;document.getElementById('styleMesAchats').submit();">
		</c:if>
			<spring:message code="mesAchats.histo"/>
		<c:if test="${styleCommande == 0}">
			</a>
		</c:if>
		<span class="brown">[<c:out value="${commandesHistoSize}"/>]</span>
		
		<form id="styleMesAchats" method="post" action="">
			<input type="hidden" name="styleCommande" value="<c:out value="${styleCommande}"/>"/>
		</form>
	</p>
</div>

<c:choose>
	<c:when test="${styleCommande == 0}">
		<c:set var="listeCommandes" value="${commandesEnCours}"/>
	</c:when>
	<c:otherwise>
		<c:set var="listeCommandes" value="${commandesHisto}"/>
	</c:otherwise>
</c:choose>

<div id="commande">
	<table class="articles" summary="Articles">
		
	    <thead>
	    	<tr>
	            <th><spring:message code="mesAchats.date"/></th>
	            <th><spring:message code="mesAchats.quantite"/></th>
	            <th><spring:message code="mesAchats.prix"/></th>
	            <th></th>
	        </tr>
	    </thead>
		
		<!-- startCommande -->
	   	<c:forEach var="commande" items="${listeCommandes}" varStatus="i">
			<tr>
				<td><c:out value="${commande.dateNormale}"/></td>
				<td><c:out value="${commande.quantiteTotaleArticles}"/></td>
				<td><c:out value="${commande.prixFormate}"/></td>
				<td>
					<form name="detailCommande_<c:out value='${i.index}'/>" id="detailCommande_<c:out value='${i.index}'/>" method="post" action="./detailCommande.htm">
						<input type="hidden" name="idCommande" value="<c:out value='${commande.id}'/>" />
						<a class="lien" href="#" onclick="document.getElementById('detailCommande_<c:out value='${i.index}'/>').submit();"><spring:message code="mesAchats.detail"/></a>
					</form>
				</td>
			</tr>
		</c:forEach>
		<!-- endCommande -->
		
	</table>
</div>

<!-- endAchat -->

<div class="XP"></div>
<div class="LCL">&nbsp;</div>

