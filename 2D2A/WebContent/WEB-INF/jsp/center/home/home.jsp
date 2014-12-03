<%@ include file="../../head/include.jsp" %>


<c:set var="accueil" value="${ACCUEIL}"/>

	
<div class="home">

	<div id="home_left"><spring:message code="accueil.filAriane"/></div>
    <div id="home_right">Pictos[<spring:message code="global.print"/>][enregistrer]</div>
    <div id="home_center"><c:out value="${DATE_TODAY}"/></div>
   
    <div id="home_texte_haut"><c:out value="${accueil.texteHaut}"/></div>
    <div id="home_partenaires">
    	<div style="width: 60%; font-size: 10px; border: 1px black solid; float: right;"><c:out value="${accueil.partenaires}"/></div>
    	<div style="float: right; font-weight: bold;"><i><spring:message code="accueil.partenaires"/>&nbsp;</i></div>
    </div>
        
	<div id="home_block_left">
		<c:if test="${not empty accueil.logo}">
			<img src="<c:out value="${accueil.logo}"/>" width="100%" border="0" />
		</c:if>
	</div>
	<div id="home_block_right">
		<c:out value="${accueil.revuePresse}"/>
	</div>
	<div id="home_block_center" >
		<c:out value="${accueil.texteTitre}"/>
		<img src="<c:out value="${accueil.imageTitre}"/>" width="100%" border="0" height="30"/>
	</div>			
	<c:forEach var="element" items="${accueil.accueilElements}" varStatus="i">
		<c:choose>
			<c:when test="${i.last}">
				<div id="home_block_center">
					<div style="float:left;">
						<c:out value="${element.titreElement}"/>
					</div>
					<div class="home_div_presse">
						<a class="home_link_presse" href="#" onMouseOver="showTooltip('<div class=\'info\'><strong><spring:message code="accueil.revuePresse"/></strong></div>');" onMouseOut="hideTooltip();" onclick="document.rubrique<c:out value="${picto.id}"/>.submit();">
							<spring:message code="accueil.presseEnParle" />
						</a>
					</div>
					<div>
						<c:if test="${not empty element.imageElement}">
							<img src="<c:out value="${element.imageElement}"/>" height="70px" width="150px" />
						</c:if>
						<c:out value="${element.texteElement}"/>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div id="home_block_left">
					<c:out value="${element.titreElement}"/>
				</div>
				<div id="home_block_right">
					<div class="home_div_presse">
						<a class="home_link_presse" href="#" onMouseOver="showTooltip('<div class=\'info\'><strong><spring:message code="accueil.revuePresse"/></strong></div>');" onMouseOut="hideTooltip();" onclick="document.rubrique<c:out value="${picto.id}"/>.submit();">
							<spring:message code="accueil.presseEnParle" />
						</a>
					</div>
					<div>
						<c:if test="${not empty element.imageElement}">
							<img src="<c:out value="${element.imageElement}"/>" height="98%" />
						</c:if>
						<c:out value="${element.texteElement}"/>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>