<%@ include file="../head/include.jsp" %>
<c:if test="${empty param['imprimer']}">
	<!-- startDeconnexion -->
	<div id="deconnexion">
		<div>
	
	    	    	
	    	<form id="deconnectionForm" action="/${ROOT}/delog.htm" method="post">
				<strong><spring:message code="header.hello" />&nbsp;<c:out value="${sessionScope.AUTHENTICATED_MEMBER.civilite.titre}"/>&nbsp;<c:out value="${sessionScope.AUTHENTICATED_MEMBER.prenom}"/>&nbsp;<c:out value="${sessionScope.AUTHENTICATED_MEMBER.nom}"/></strong> - <a href="#" class="L" onclick="document.getElementById('deconnectionForm').submit();">Se déconnecter</a>
				<input type="hidden" name="action" value="2" />
			</form>
	    	
	    </div>
	</div>
	<!-- endDeconnexion -->
</c:if>