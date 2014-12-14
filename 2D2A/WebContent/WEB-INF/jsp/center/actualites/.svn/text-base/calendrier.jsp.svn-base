<%@ include file="../../head/include.jsp" %>
<script type="text/javascript" src="/${ROOT}/resources/js/print.js"></script> 

<!-- TODO : 
up /resources/pic/crawlBar/tiret2.jpg de 7px
mettre à jour .properties
-->

<!-- startEnteteFiche -->
<div id="enteteFiche">
	<p class="b brown fs13 mt5"><spring:message code="calendrier.nom"/></p>
    <!-- endTitleFiche -->
    <!-- startInfoArticles -->
       <div class="pagination infoCalendrier">
           <spring:message code="evt.nbEvt"/>
           <span class="magenta b">[<c:out value="${nbEvenements}"/>]</span>
			<c:if test="${not empty pager}">
				<br/>
				<spring:message code="evt.nbPages"/>
	           	<c:if test="${currentPage != 1}"><a href="#" onclick="document.page<c:out value="${currentPage-1}"/>.submit();" style="font-size: 16px;">&lt;</a></c:if>
		    	<c:forEach begin="1" end="${nbPages}" varStatus="v">
		    		<c:choose>
			    		<c:when test="${v.count == currentPage}">
			    			<span class="first sel">[<c:out value="${v.count}"/>]</span>
			    		</c:when>
			    		<c:otherwise>
			    			<form style="display: inline;" name="page<c:out value="${v.count}"/>" action="" method="post">
		    					<input type="hidden" name="rubrique" value="<c:out value="${rubId}"/>" />
		    					<input type="hidden" name="pageIndex" value="<c:out value="${v.count-1}"/>" />
		    					<input type="hidden" name="selectedDate" value="<c:out value="${filter.selectedDate}"/>" />
		    					<a href="#" onclick="document.page<c:out value="${v.count}"/>.submit();"><c:out value="${v.count}"/></a>
		    				</form>
			    		</c:otherwise>
		    		</c:choose>
		    		<c:if test="${not v.last}"><img src="/${ROOT}/resources/pic/crawlBar/tiret2.jpg"/></c:if>
		    	</c:forEach>
		    	<c:if test="${currentPage != nbPages}"><a href="#" onclick="document.page<c:out value="${currentPage+1}"/>.submit();" style="font-size: 16px;">&gt;</a></c:if>
  			</c:if>
       </div>
       <!-- endInfoArticles -->
    <!-- startActionPage -->
	<c:if test="${empty param['imprimer']}">
	    <div id="actionPage">
	        <a href="#" onclick="javascript:imprime_zone('Imprimer', 'ficheCorps', window.location);" class="imprimer" title="Imprimer"></a>
	    </div>
    </c:if>
    <!-- startActionPage -->
    
</div>

<div id="separationEnteteFiche"></div>

<!-- startCorpsFiche -->
<div id="ficheCorps">
	<!-- startLeftColumn -->
	<c:forEach var="evt" items="${evenements}" varStatus="i">
	    <div class="leftColumn">
	   		<h1><c:out value="${evt.titre}" /></h1>
	        <div class="zoomProduit">
	       		<img class="borderimage" src="/${ROOT}/<c:out value="${evt.images[0].pathPhoto}"/>" width="400" height="400" alt="calendrier" />
	        </div>
	    </div>
	    <!-- endLeftColumn -->
	    <!-- startRightColumn -->
	
	    <div class="rightColumn">
	        <table border="0" cellpadding="0" class="description rightcolumnSize">
		        <tr>
			        <td class="lib"><spring:message code="evt.dateDebut"/></td>
			        <td class="description"><c:out value="${evt.dateDebutStr}" /></td>
		        </tr>
		        <tr>
			        <td class="lib"><spring:message code="evt.dateFin"/></td>
			        <td class="description"><c:out value="${evt.dateFinStr}" /></td>
		        </tr>
		        <tr>
			        <td class="lib"><spring:message code="evt.horaire"/></td>
			        <td class="description"><c:out value="${evt.horaire}" /></td>
		        </tr>
		        <tr>
			        <td class="lib"><spring:message code="evt.ville"/></td>
			        <td class="description"><c:out value="${evt.ville}" /></td>
		        </tr>
		        <tr>
			        <td class="lib"><spring:message code="evt.departement"/></td>
			        <td class="description"><c:out value="${evt.departement}" /></td>
		        </tr>
		        <tr>
			        <td class="lib"><spring:message code="evt.adresse"/></td>
			        <td class="description"><c:out value="${evt.adresse}" /></td>
		        </tr>
		        <tr>
			        <td class="lib"><spring:message code="evt.lieu"/></td>
			        <td class="description"><c:out value="${evt.lieu}" /></td>
		        </tr>
		        <tr>
			        <td class="lib"><spring:message code="evt.designation"/></td>
			        <td class="description"><c:out value="${evt.designationInfo}" /></td>
		        </tr>
		        <tr>
			        <td class="lib"><spring:message code="evt.prixEntree"/></td>
			        <td class="description"><c:out value="${evt.prix}" /></td>
		        </tr>
		        <tr>
			        <td class="lib"><spring:message code="evt.theme"/></td>
			        <td class="description"><c:out value="${evt.theme}" /></td>	
		        </tr>
		        <tr>
			        <td class="lib"><spring:message code="evt.tel"/></td>	
			        <td class="description"><c:out value="${evt.tel}" /></td>
		        </tr>
		        <tr>
			        <td class="lib"><spring:message code="evt.fax"/></td>
			        <td class="description"><c:out value="${evt.fax}" /></td>
		        </tr>
		        <tr>
			        <td class="lib"><spring:message code="evt.email"/></td>
			        <td class="description"><a href="mailto:<c:out value="${evt.email}" />"><c:out value="${evt.email}" /></a></td>
		        </tr>
		        <tr>
			        <td class="lib"><spring:message code="evt.siteWeb"/></td>
			        <td class="description"><a href="http://<c:out value="${evt.webSite}" />" class="lien" target="_blank"><c:out value="${evt.webSite}" /></a></td>
		        </tr>
	        </table>
	    </div>
	    <!-- endRightColumn -->
		<p class="XP mt20 pt20"></p>
	</c:forEach>
</div>