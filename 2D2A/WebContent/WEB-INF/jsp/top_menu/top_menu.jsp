<%@ include file="../head/include.jsp" %>
	<script type="text/javascript" src="/${ROOT}/resources/js/topMenu.js"></script>

<c:if test="${empty param['imprimer']}">
	<div id="menuH">
		
		<div class="languageChoose">	
			<form id="langForm" action="" method="post">
				<div>
					<input type="hidden" name="lang" id="LANGUE" value="" />
					<input type="hidden" name="rubrique" value="<c:out value='${rubrique.rubId}'/>"/>
					<input type="hidden" name="idProduit" value="<c:out value='${produit.proId}'/>"/>
				</div>
			</form>
			<c:choose>
				<c:when test="${sessionScope.lang == 'FR'}">
				    <a href="#" class="L magenta"><span class="magenta">Fr</span></a>
				    &nbsp;-&nbsp;
				    
				  	<a href="#" class="L brownLight" onclick="document.getElementById('LANGUE').value='EN';document.getElementById('langForm').submit();"><span class="brownLight">En</span></a>
				</c:when>
				<c:otherwise>
					<a href="#" class="L brownLight" onclick="document.getElementById('LANGUE').value='FR';document.getElementById('langForm').submit();"><span class="brownLight">Fr</span></a>
					&nbsp;-&nbsp;
		
					<a href="#" class="L magenta"><span class="magenta">En</span></a>
				</c:otherwise>
			</c:choose>
		</div>
		
		<div class="formSearch">
		    <form id="searchForm" method="post" action="/${ROOT}/recherche.htm" onsubmit="return computeSearch(this);">
		        <div class="formSearchDiv">
		            <input id="searchField" name="searchField" value="<c:out value="${searchField}"/>" type="text"/>
		            <input id="searchOkButton" type="submit" name="rechercher" value=" " /> 
		        </div>
		    </form>
		</div>
		
		<div class="menuHDeroulant">
		    <ul class="menuHDeroulant">
		        <!-- elementsMenuDeroulantHorizontal -->
				<the2D2A:upMenu varRetour="upMenuActu" idParent="-3" typeRubrique="3"/>
				<c:out value="${upMenuActu}" escapeXml="false"/>
				
				<the2D2A:upMenu varRetour="upMenuBoutique" idParent="-1" typeRubrique="1"/>
				<c:out value="${upMenuBoutique}" escapeXml="false"/>
				
		        <li>
		        	<a href="#"><span><spring:message code="topMenu.services"/></span></a>
		        	<ul>
		        		<li><a href="/${ROOT}/recherche.htm"><span><spring:message code="leftMenuService.recherche" htmlEscape="false"/></span></a></li>
			            <li><a href="/${ROOT}/service/formulaireGeneral.htm"><span><spring:message code="leftMenuService.general" htmlEscape="false"/></span></a></li>
			            <li><a href="/${ROOT}/service/formulaireEvenement.htm"><span><spring:message code="leftMenuService.evenement" htmlEscape="false"/></span></a></li>
			            <li><a href="/${ROOT}/service/formulaireOuvrage.htm"><span><spring:message code="leftMenuService.ouvrage" htmlEscape="false"/></span></a></li>
			            <li><a href="/${ROOT}/service/formulaireArchives.htm"><span><spring:message code="leftMenuService.archives" htmlEscape="false"/></span></a></li>
		        	</ul>
		        </li>
		        
		        <li class="last"><a href="/${ROOT}/depot.htm"><span><spring:message code="topMenu.depot"/></span></a></li> 
		    </ul>
		</div>
		
		<div id="menuMonCompte">
			<div class="menuHDeroulant">
		       	<ul class="menuHDeroulant">
		           	 <li><a href="/${ROOT}/monCompte.htm"><span><spring:message code="topMenu.myAccount"/></span></a></li>
		        </ul>
		     </div>
		</div>
		
		<div id="menuMembreRight">
			<div class="menuHDeroulant">
		    	<ul class="menuHDeroulant">
		             <li><a href="/${ROOT}/monPanier.htm"><span><spring:message code="topMenu.myCart"/>(<c:choose><c:when test="${empty sessionScope.MON_PANIER}">0</c:when><c:otherwise><c:out value="${sessionScope.MON_PANIER.size}"/></c:otherwise></c:choose>)</span></a></li>
		        </ul>
		    </div>  
		</div>
		
		<div id="menuMembreRight">
			<div class="menuHDeroulant">
		    	<ul class="menuHDeroulant">
		             <li><a href="/${ROOT}/service/location.htm"><span><spring:message code="topMenu.myRent"/>(<c:choose><c:when test="${empty sessionScope.MON_PANIER_LOCATION}">0</c:when><c:otherwise><c:out value="${sessionScope.MON_PANIER_LOCATION.size}"/></c:otherwise></c:choose>)</span></a></li>
		        </ul>
		    </div>  
		</div>
	</div>
</c:if>
	
