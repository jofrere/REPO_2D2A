<%@ include file="../head/include.jsp" %>

<c:if test="${empty param['imprimer']}">
	<ul>
	    <li><a href="/${ROOT}/planSite.htm" title="<spring:message code="topMenu.siteMap"/>"><spring:message code="topMenu.siteMap"/></a></li>
	    <li><a href="/${ROOT}/quiSommesNous.htm" title="<spring:message code="topMenu.whosWho"/>"><spring:message code="topMenu.whosWho"/></a></li>
	    <li><a href="/${ROOT}/contact.htm" title="<spring:message code="topMenu.contact"/>"><spring:message code="topMenu.contact"/></a></li>
	
	    <li><a href="/${ROOT}/infosLegales.htm" title="<spring:message code="topMenu.legacyInfo"/>"><spring:message code="topMenu.legacyInfo"/></a></li>
	    <li><a href="/${ROOT}/serviceClient.htm" title="<spring:message code="topMenu.customerService"/>"><spring:message code="topMenu.customerService"/></a></li>
	
	    <%--<li><a href="#" title="<spring:message code="topMenu.thanks"/>"><spring:message code="topMenu.thanks"/></a></li>--%>
	    <li><a href="/${ROOT}/aide.htm" title="<spring:message code="topMenu.help"/>"><spring:message code="topMenu.help"/></a></li>
	</ul>
</c:if>     
