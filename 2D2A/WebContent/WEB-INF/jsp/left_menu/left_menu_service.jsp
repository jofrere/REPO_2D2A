<%@ include file="../head/include.jsp" %>

<c:if test="${empty param['imprimer']}">
	
	<div id="menuV" class="menuV">
       <div class="menuVSep"><br /></div>
       <div class="menuVHead"><spring:message code="leftMenuService.titre" htmlEscape="false"/></div>
       <div class="menuVSep"><br /></div>
       <ul class="menuVDeroulant">
       	   <%-- <li><a href="/${ROOT}/service/location.htm"><span><spring:message code="leftMenuService.location" htmlEscape="false"/></span></a></li>--%>
           <li><a href="/${ROOT}/recherche.htm"><span><spring:message code="leftMenuService.recherche" htmlEscape="false"/></span></a></li>
           <li><a href="/${ROOT}/service/formulaireGeneral.htm"><span><spring:message code="leftMenuService.general" htmlEscape="false"/></span></a></li>
           <li><a href="/${ROOT}/service/formulaireEvenement.htm"><span><spring:message code="leftMenuService.evenement" htmlEscape="false"/></span></a></li>
           <li><a href="/${ROOT}/service/formulaireOuvrage.htm"><span><spring:message code="leftMenuService.ouvrage" htmlEscape="false"/></span></a></li>
           <li><a href="/${ROOT}/service/formulaireArchives.htm"><span><spring:message code="leftMenuService.archives" htmlEscape="false"/></span></a></li>
       </ul>
	</div>
	
</c:if>