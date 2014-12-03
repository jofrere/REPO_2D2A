<%@ include file="../../head/include.jsp" %>

<div class="boutique">

	<div id="boutique_left"><c:out value="${rubrique.nom}" /></div>
    <div id="boutique_right">Pictos[Retour][imprimer][enregistrer]</div>
    <div id="boutique_center">
    	<c:out value="${DATE_TODAY}"/>
    	<%--
    	<c:if test="${not empty pager}">
    		&lt;&nbsp;
    		<c:if test="${currentPage != 1}">
    			<form style="display: inline;" name="precedent" action="" method="POST">
    				<input type="hidden" name="rubrique" value="<c:out value="${rubrique.id}"/>" />
    				<input type="hidden" name="pageIndex" value="<c:out value="${pageIndex-1}"/>" />
    				<a href="#" onclick="document.precedent.submit();"><spring:message code="previous"/></a>
    			</form>
    			<c:if test="${currentPage != nbPages}">&nbsp;&nbsp;</c:if>
    		</c:if>
    		<c:if test="${currentPage != nbPages}">
    			<form style="display: inline;" name="suivant" action="" method="POST">
    				<input type="hidden" name="rubrique" value="<c:out value="${rubrique.id}"/>" />
    				<input type="hidden" name="pageIndex" value="<c:out value="${pageIndex+1}"/>" />
    				<a href="#" onclick="document.suivant.submit();"><spring:message code="next"/></a>
    			</form>
    		</c:if>
    		&nbsp;&gt;
    		<spring:message code="page"/>&nbsp;
	    	<c:forEach begin="1" end="${nbPages}" varStatus="v">
	    		<c:choose>
		    		<c:when test="${v.count == currentPage}">
		    			<span style="font-size: 12px;"><c:out value="${v.count}"/></span>
		    		</c:when>
		    		<c:otherwise>
		    			<form style="display: inline;" name="page<c:out value="${v.count}"/>" action="" method="POST">
	    					<input type="hidden" name="rubrique" value="<c:out value="${rubrique.id}"/>" />
	    					<input type="hidden" name="pageIndex" value="<c:out value="${v.count-1}"/>" />
	    					<a href="#" onclick="document.page<c:out value="${v.count}"/>.submit();"><c:out value="${v.count}"/></a>
	    				</form>
		    		</c:otherwise>
	    		</c:choose>
	    		<c:if test="${not v.last}">-</c:if>
	    	</c:forEach>
    	</c:if>
    	--%>
    </div>
   	
    <div id="boutique_texte_haut"><c:out value="${rubrique.description}"/></div>
    <div id="boutique_lexique">
    	<div style="width: 85%; font-size: 10px; border: 1px black solid; float: right;"><c:out value="${rubrique.lexique}"/></div>
    	<div style="float: right;"><i><spring:message code="boutique.lexique"/>&nbsp;</i></div>
    </div>
    
    <div id="spacer">&nbsp;</div>
    
    <%--
    
    <c:forEach var="produit" items="${produits}" varStatus="v">    	
    	<c:if test="${v.count%4 == 1}">
    		<div id="ligne_produit">
    	</c:if>
	    	<div id="produit">
	    		<div>
					Ref : <c:out value="${produit.reference}"/>
		    		<c:forEach var="spec" items="${produit.specs}" varStatus="i">
		    			<c:if test="${not i.first}">/</c:if>
		    			<c:out value="${spec.abbr}"/>
		    		</c:forEach>
	    		</div>
	    		<div>
		    		<c:forEach var="image" items="${produit.images}" varStatus="i">
		    			<c:if test="${i.first}">
		    				<form name="produit<c:out value="${produit.id}"/>" action="./accueilProduit.htm" method="POST">
		    					<input type="hidden" name="rubrique" value="<c:out value="${rubrique.id}"/>" />
		    					<input type="hidden" name="idProduit" value="<c:out value="${produit.id}"/>" />
		    					<input type="hidden" name="pageIndex" value="<c:out value="0"/>" />
		    					<a href="#" onClick="document.produit<c:out value="${produit.id}"/>.submit();">
		    						<img src="/${ROOT}/<c:out value="${image.vignette}"/>" width="110" height="150" border="0" />
		    					</a>
		    				</form>
		    			</c:if>
		    		</c:forEach>
		    	</div>
		    	<div>
	  				D : <c:out value="${produit.designer.nom}" />&nbsp;<c:out value="${produit.designer.prenom}" />
	  			</div>
	  			<div>
	  				E : <c:out value="${produit.editeur.nom}" />&nbsp;<c:out value="${produit.editeur.prenom}" />
	  			</div>
	  			<div>
	  				P : <c:out value="${produit.prix}" />&nbsp;
	  			</div>				
	    	</div>
	    <c:if test="${v.count%4 == 0 || v.last}">
	    	</div>
	    </c:if>
    </c:forEach>
    
    --%>
    
    <script language="JavaScript" type="text/javascript">
	<!--
	// Version check for the Flash Player that has the ability to start Player Product Install (6.0r65)
	var hasProductInstall = DetectFlashVer(6, 0, 65);
	
	// Version check based upon the values defined in globals
	var hasRequestedVersion = DetectFlashVer(requiredMajorVersion, requiredMinorVersion, requiredRevision);
	
	if ( hasProductInstall && !hasRequestedVersion ) {
		// DO NOT MODIFY THE FOLLOWING FOUR LINES
		// Location visited after installation is complete if installation is required
		var MMPlayerType = (isIE == true) ? "ActiveX" : "PlugIn";
		var MMredirectURL = window.location;
	    document.title = document.title.slice(0, 47) + " - Flash Player Installation";
	    var MMdoctitle = document.title;
	
		AC_FL_RunContent(
			"src", "playerProductInstall",
			"FlashVars", "MMredirectURL="+MMredirectURL+'&MMplayerType='+MMPlayerType+'&MMdoctitle='+MMdoctitle+"",
			"width", "100%",
			"height", "100%",
			"align", "middle",
			"id", "homeRubrique",
			"quality", "high",
			"bgcolor", "#869ca7",
			"name", "homeRubrique",
			"allowScriptAccess","sameDomain",
			"type", "application/x-shockwave-flash",
			"pluginspage", "http://www.adobe.com/go/getflashplayer"
		);
	} else if (hasRequestedVersion) {
		// if we've detected an acceptable version
		// embed the Flash Content SWF when all tests are passed
		AC_FL_RunContent(
				"src", "/${ROOT}/resources/flex/homeRubrique",
				"width", "100%",
				"height", "100%",
				"align", "middle",
				"id", "homeRubrique",
				"quality", "high",
				"bgcolor", "#869ca7",
				"name", "homeRubrique",
				"allowScriptAccess","sameDomain",
				"type", "application/x-shockwave-flash",
				"pluginspage", "http://www.adobe.com/go/getflashplayer",
				"FlashVars", "<c:out value='${flashVar}' escapeXml='false'/>"
		);
	  } else {  // flash is too old or we can't detect the plugin
	    var alternateContent = 'Alternate HTML content should be placed here. '
	  	+ 'This content requires the Adobe Flash Player. '
	   	+ '<a href=http://www.adobe.com/go/getflash/>Get Flash</a>';
	    document.write(alternateContent);  // insert non-flash content
	  }
	// -->
	</script>
	<noscript>
	  	<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
				id="homeRubrique" width="100%" height="100%"
				codebase="http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab">
				<param name="movie" value="/${ROOT}/resources/flex/homeRubrique.swf" />
				<param name="quality" value="high" />
				<param name="bgcolor" value="#869ca7" />
				<param name="allowScriptAccess" value="sameDomain" />
				<param name="flashVars" value="<c:out value='${flashVar}' escapeXml='false'/>" />
				<embed src="/${ROOT}/resources/flex/homeRubrique.swf" quality="high" bgcolor="#869ca7"
					width="100%" height="100%" name="homeRubrique" align="middle"
					play="true"
					loop="false"
					quality="high"
					allowScriptAccess="sameDomain"
					type="application/x-shockwave-flash"
					flashVars="<c:out value='${flashVar}' escapeXml='false'/>"
					pluginspage="http://www.adobe.com/go/getflashplayer">
				</embed>
		</object>
	</noscript>
    
    
</div>