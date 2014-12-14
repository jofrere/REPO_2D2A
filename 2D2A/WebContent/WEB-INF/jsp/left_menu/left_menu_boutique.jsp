<%@ include file="../head/include.jsp" %>

<c:if test="${empty param['imprimer']}">
	
	<!-- startMenuVertical -->
	<the2D2A:leftMenu varRetour="menu" idParent="${parentId}" />
	<c:out value="${menu}" escapeXml="false"/>
	<!-- endMenuVertical -->
	
</c:if>
