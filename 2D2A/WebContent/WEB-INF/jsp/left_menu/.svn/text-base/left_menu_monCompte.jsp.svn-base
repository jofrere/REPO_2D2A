<%@ include file="../head/include.jsp" %>
<c:if test="${empty param['imprimer']}">
<div id="menuV" class="menuVmonCompte">
       <div class="menuVSep"><br /></div>
       <div class="menuVHeadMonCompte"><spring:message code="leftMenuMonCompte.titre" htmlEscape="false"/></div>
       <div class="menuVSep"><br /></div>
       <ul class="menuVDeroulant menuVmonCompte">
           <li><a href="/${ROOT}/depot.htm"><span><spring:message code="leftMenuMonCompte.depot" htmlEscape="false"/></span></a></li>
           <c:if test="${not empty sessionScope.AUTHENTICATED_MEMBER}">          
           	<li><a href="/${ROOT}/mesAchats.htm"><span><spring:message code="leftMenuMonCompte.achat" htmlEscape="false"/></span></a></li>
           </c:if>
           <c:if test="${not empty sessionScope.AUTHENTICATED_MEMBER}">
           	<li><a href="/${ROOT}/mesCoordonnees.htm"><span><spring:message code="leftMenuMonCompte.profil" htmlEscape="false"/></span></a></li>
           </c:if>
       </ul>
    <%-- 
	<div class="monCompteDepot">
		<a href="#">Lire les conditions de d&eacute;pot</a>
	</div>
	--%>
</div>
</c:if>