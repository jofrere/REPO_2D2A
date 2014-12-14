<%@ include file="../head/include.jsp" %>

<c:if test="${empty param['imprimer']}">
	
	<div id="menuV" class="menuV">
       <div class="menuVSep"><br /></div>
       <div class="menuVHead"><spring:message code="leftMenuFooter.titre" htmlEscape="false"/></div>
       <div class="menuVSep"><br /></div>
       <ul class="menuVDeroulant">
       	   <li><a href="/${ROOT}/planSite.htm"><span><spring:message code="topMenu.siteMap"/></span></a></li>
           <li><a href="/${ROOT}/quiSommesNous.htm"><span><spring:message code="topMenu.whosWho"/></span></a></li>
           <li><a href="/${ROOT}/contact.htm"><span><spring:message code="topMenu.contact"/></span></a></li>
           <li><a href="/${ROOT}/infosLegales.htm"><span><spring:message code="topMenu.legacyInfo"/></span></a></li>
           <li><a href="/${ROOT}/serviceClient.htm"><span><spring:message code="topMenu.customerService"/></span></a></li>
           <li><a href="/${ROOT}/aide.htm"><span><spring:message code="topMenu.help"/></span></a></li>
       </ul>
	</div>
	
</c:if>