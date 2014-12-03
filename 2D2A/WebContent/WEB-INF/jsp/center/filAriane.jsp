<%@ include file="../head/include.jsp" %>

<c:set var="typeRubrique" value="1"/>

<c:if test="${not empty actualite}">
	<c:set var="typeRubrique" value="3"/>
</c:if>


<the2D2A:filAriane idRub="${rubrique.rubId}" varRetour="filAriane" typeRubrique="${typeRubrique}"/>
<ul>
	<c:if test="${not empty filAriane}">
		<c:forEach var="rub" items="${filAriane}" varStatus="i">
			<c:if test="${i.first}">				
				<a href="/${ROOT}/accueil.htm"><spring:message code="accueil.filAriane" /></a>				
			</c:if>
			<c:choose>
				<c:when test="${not i.last}">
						<ul><li><a href="<c:out value="${rub.link}"/>"><c:out value="${rub.nom}"/></a>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${empty ACCUEIL}">
							<ul><li><a href="#"><c:out value="${rub.nom}"/></a>
						</c:when>
						<c:otherwise>
							<ul><li><a href="#"><c:out value="${rub.friendlyName}"/></a>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:forEach items="${filAriane}">
			</li></ul>
		</c:forEach>
	</c:if>	
	<c:if test="${empty filAriane}">
		<li><a href="#"><spring:message code="accueil.filAriane" /></a></li>
	</c:if>	
</ul>
