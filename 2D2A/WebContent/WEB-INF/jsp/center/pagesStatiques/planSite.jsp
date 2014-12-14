<%@ include file="../../head/include.jsp" %>

<%--
<!-- FORM hidden for pageStatiqueController Parameters submitted by links -->
<div style="display:none">
	<form method="post" action="quiSommesNous.htm" name="quiSommesNousPlanSite">
		<input type="hidden" value="3" name="idPage">
	</form>
 	<form method="post" action="contact.htm" name="contactPlanSite">
		<input type="hidden" value="4" name="idPage">
	</form>
	<form method="post" action="infosLegales.htm" name="infosLegalesPlanSite">
		<input type="hidden" value="5" name="idPage">
	</form>
	<form method="post" action="serviceClient.htm" name="serviceClientPlanSite">
		<input type="hidden" value="6" name="idPage">
 	</form>
 	<form method="post" action="aide.htm" name="aidePlanSite">
		<input type="hidden" value="7" name="idPage">
	</form>
</div>
--%>

<div id="enteteFiche">
   	<p class="b brown fs13 mt5"><spring:message code="topMenu.siteMap"/></p>
</div>
<div id="separationEnteteFiche"></div>
<div id="ficheCorps">
<%-- 
	<div id="menuV" class="menuV">
       <div class="menuVSep"><br /></div>
       <div class="menuVHead"><spring:message code="leftMenuService.titre" htmlEscape="false"/></div>
       <div class="menuVSep"><br /></div>
       <ul class="menuVDeroulant">
       	   <li><a href="/${ROOT}/service/location.htm"><span><spring:message code="leftMenuService.location" htmlEscape="false"/></span></a></li>
           <li><a href="/${ROOT}/recherche.htm"><span><spring:message code="leftMenuService.recherche" htmlEscape="false"/></span></a></li>
           <li><a href="/${ROOT}/service/formulaireGeneral.htm"><span><spring:message code="leftMenuService.general" htmlEscape="false"/></span></a></li>
           <li><a href="/${ROOT}/service/formulaireEvenement.htm"><span><spring:message code="leftMenuService.evenement" htmlEscape="false"/></span></a></li>
           <li><a href="/${ROOT}/service/formulaireOuvrage.htm"><span><spring:message code="leftMenuService.ouvrage" htmlEscape="false"/></span></a></li>
           <li><a href="/${ROOT}/service/formulaireArchives.htm"><span><spring:message code="leftMenuService.archives" htmlEscape="false"/></span></a></li>
       </ul>
	</div>
--%>
	<table width="100%">
		<tr>
			<td width="33%" valign="top">
				<table width="100%">
					<tr><td><h1 class="b brown"><spring:message code="planSite.actualite"/></h1></td></tr>
					<c:forEach var="rubrique" items="${actualite}" varStatus="i">
						<tr><td>
						<c:if test="${not i.first}">
							&nbsp;
						</c:if>
						<c:forEach begin="1" end="${rubrique.depth}">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</c:forEach>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span><a class="lien_plansite" href="<c:out value="${rubrique.link}"/>"><c:out value="${rubrique.nom}"/></a></span>
						</td></tr>
					</c:forEach>
				</table>
			</td>
			<td width="33%" valign="top">
				<table width="100%">
					<tr><td><h1 class="b brown"><spring:message code="planSite.boutique"/></h1></td></tr>	
					<c:forEach var="rubrique" items="${boutique}" varStatus="i">
						<tr><td>
						<c:if test="${not i.first}">
							&nbsp;
						</c:if>
						<c:forEach begin="1" end="${rubrique.depth}">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</c:forEach>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="lien_plansite" href="<c:out value="${rubrique.link}"/>"><c:out value="${rubrique.nom}"/></a>
						</td></tr>
					</c:forEach>
				</table>
			</td>
			<td width="33%" valign="top">
				<table width="100%">
					<tr><td><h1 class="b brown"><spring:message code="planSite.service"/></h1></td></tr>	
					<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="lien_plansite" href="/${ROOT}/depot.htm"><spring:message code="leftMenuMonCompte.depot" htmlEscape="false"/></a></td></tr>
					<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="lien_plansite" href="/${ROOT}/service/location.htm"><spring:message code="leftMenuService.location" htmlEscape="false"/></a></td></tr>
					<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="lien_plansite" href="/${ROOT}/recherche.htm"><spring:message code="leftMenuService.recherche" htmlEscape="false"/></a></td></tr>
					<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="lien_plansite" href="/${ROOT}/service/formulaireGeneral.htm"><spring:message code="leftMenuService.general" htmlEscape="false"/></a></td></tr>
					<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="lien_plansite" href="/${ROOT}/service/formulaireEvenement.htm"><spring:message code="leftMenuService.evenement" htmlEscape="false"/></a></td></tr>
					<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="lien_plansite" href="/${ROOT}/service/formulaireOuvrage.htm"><spring:message code="leftMenuService.ouvrage" htmlEscape="false"/></a></td></tr>
					<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="lien_plansite" href="/${ROOT}/service/formulaireArchives.htm"><spring:message code="leftMenuService.archives" htmlEscape="false"/></a></td></tr>
				</table>
			</td>
		</tr>
		<tr height="10px;">
			<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
		</tr>
		<tr>
			<td width="33%" valign="top">
				<table width="100%" valign="top">
					<tr><td><h1 class="b brown"><spring:message code="planSite.membre"/></h1></td></tr>	
					<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="lien_plansite" href="/${ROOT}/devenirMembre.htm"><spring:message code="planSite.devenirMembre" htmlEscape="false"/></a></td></tr>
					<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="lien_plansite" href="/${ROOT}/monCompte.htm"><spring:message code="planSite.monCompte" htmlEscape="false"/></a></td></tr>
					<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="lien_plansite" href="/${ROOT}/monPanier.htm"><spring:message code="planSite.monPanier" htmlEscape="false"/></a></td></tr>
				</table>
			</td>
			<td width="33%" valign="top">
				<table width="100%" valign="top">
					<tr><td><h1 class="b brown"><spring:message code="planSite.footer"/></h1></td></tr>	
					<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="lien_plansite" href="/${ROOT}/quiSommesNous.htm"><spring:message code="planSite.qui" htmlEscape="false"/></a></td></tr>
					<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="lien_plansite" href="/${ROOT}/contact.htm"><spring:message code="planSite.contact" htmlEscape="false"/></a></td></tr>
					<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="lien_plansite" href="/${ROOT}/infosLegales.htm"><spring:message code="planSite.infoLegale" htmlEscape="false"/></a></td></tr>
					<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="lien_plansite" href="/${ROOT}/serviceClient.htm"><spring:message code="planSite.serviceClient" htmlEscape="false"/></a></td></tr>
					<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="lien_plansite" href="/${ROOT}/aide.htm"><spring:message code="planSite.aide" htmlEscape="false"/></a></td></tr>
				</table>
			</td>
			<td>&nbsp;</td>
		</tr>
	</table>
</div>
