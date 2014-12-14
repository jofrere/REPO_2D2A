<%@ include file="../../head/include.jsp" %>


<div class="boutique">

	<div id="boutique_left"><c:out value="${rubrique.nom}" /></div>
    <div id="boutique_right">Pictos[Retour][imprimer][enregistrer]</div>
    <div id="boutique_center">
    	<c:out value="${DATE_TODAY}"/>    	
    </div>
   	
    <div id="boutique_texte_haut"><c:out value="${rubrique.description}"/></div>
    <div id="boutique_lexique">
    	<div style="width: 85%; font-size: 10px; border: 1px black solid; float: right;"><c:out value="${rubrique.lexique}"/></div>
    	<div style="float: right;"><i><spring:message code="boutique.lexique"/>&nbsp;</i></div>
    </div>
    
    <div id="spacer">&nbsp;</div>
    
    <div id="produit_left">
    	<%--
	    <c:forEach var="image" items="${produit.images}" varStatus="i">
	    	<c:choose>
				<c:when test="${i.first}">
					<img src="/${ROOT}/<c:out value="${image.photo}"/>" width="300" height="400" border="0" /> <br/>
					<b>Autres Vues :</b><br />
				</c:when>
				<c:otherwise>
					<img src="/${ROOT}/<c:out value="${image.vignette}"/>" width="110" height="150" border="0" />
				</c:otherwise>
			</c:choose>
		</c:forEach>
	    <br />
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
				"width", "400",
				"height", "500",
				"align", "middle",
				"id", "PhotoViewer",
				"quality", "high",
				"bgcolor", "#869ca7",
				"name", "PhotoViewer",
				"allowScriptAccess","sameDomain",
				"type", "application/x-shockwave-flash",
				"pluginspage", "http://www.adobe.com/go/getflashplayer"
			);
		} else if (hasRequestedVersion) {
			// if we've detected an acceptable version
			// embed the Flash Content SWF when all tests are passed
			AC_FL_RunContent(
					"src", "/${ROOT}/resources/flex/PhotoViewer",
					"width", "350",
					"height", "420",
					"align", "middle",
					"id", "PhotoViewer",
					"quality", "high",
					"bgcolor", "#869ca7",
					"name", "PhotoViewer",
					"allowScriptAccess","sameDomain",
					"type", "application/x-shockwave-flash",
					"pluginspage", "http://www.adobe.com/go/getflashplayer",
					"FlashVars", "gallery=<c:out value="${produit.xmlImages}"  escapeXml="false"/>"
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
					id="PhotoViewer" width="350" height="420"
					codebase="http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab">
					<param name="movie" value="/${ROOT}/resources/flex/PhotoViewer.swf" />
					<param name="quality" value="high" />
					<param name="bgcolor" value="#869ca7" />
					<param name="allowScriptAccess" value="sameDomain" />
					<param name="flashVars" value="gallery=<c:out value="${produit.xmlImages}"  escapeXml="false"/>" />
					<embed src="/${ROOT}/resources/flex/PhotoViewer.swf" quality="high" bgcolor="#869ca7"
						width="350" height="420" name="PhotoViewer" align="middle"
						play="true"
						loop="false"
						quality="high"
						allowScriptAccess="sameDomain"
						type="application/x-shockwave-flash"
						flashVars="gallery=<c:out value="${produit.xmlImages}" escapeXml="false"/>"
						pluginspage="http://www.adobe.com/go/getflashplayer">
					</embed>
			</object>
		</noscript>
	    
	    <%--
	    <b>Designer</b>&nbsp;<c:out value="${produit.designer.nom}" />&nbsp;<c:out value="${produit.designer.prenom}" />&nbsp;<span class="todo">BOUTON ARCHIVES</span><br />
	    <b>Editeur</b>&nbsp;<c:out value="${produit.editeur.nom}" />&nbsp;<c:out value="${produit.editeur.prenom}" /><br />
	    <b>Bibliographie(s)</b>&nbsp;<span class="todo">TODO&nbsp;BOUTON BIBLIOTHEQUE</span><br />
	    <b>Informaion(s)</b>&nbsp;<c:out value="${produit.information}" /><br />
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
				"width", "400",
				"height", "500",
				"align", "middle",
				"id", "PhotoViewer",
				"quality", "high",
				"bgcolor", "#869ca7",
				"name", "PhotoViewer",
				"allowScriptAccess","sameDomain",
				"type", "application/x-shockwave-flash",
				"pluginspage", "http://www.adobe.com/go/getflashplayer"
			);
		} else if (hasRequestedVersion) {
			// if we've detected an acceptable version
			// embed the Flash Content SWF when all tests are passed
			AC_FL_RunContent(
					"src", "/${ROOT}/resources/flex/ProductDescriptionViewer",
					"width", "350",
					"height", "380",
					"align", "middle",
					"id", "PhotoViewer",
					"quality", "high",
					"bgcolor", "#869ca7",
					"name", "PhotoViewer",
					"allowScriptAccess","sameDomain",
					"type", "application/x-shockwave-flash",
					"pluginspage", "http://www.adobe.com/go/getflashplayer",
					"FlashVars", "<c:out value="${flashVar}"  escapeXml="false"/>"
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
					id="PhotoViewer" width="350" height="380"
					codebase="http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab">
					<param name="movie" value="/${ROOT}/resources/flex/ProductDescriptionViewer.swf" />
					<param name="quality" value="high" />
					<param name="bgcolor" value="#869ca7" />
					<param name="allowScriptAccess" value="sameDomain" />
					<param name="flashVars" value="<c:out value="${flashVar}"  escapeXml="false"/>" />
					<embed src="/${ROOT}/resources/flex/ProductDescriptionViewer.swf" quality="high" bgcolor="#869ca7"
						width="350" height="380" name="PhotoViewer" align="middle"
						play="true"
						loop="false"
						quality="high"
						allowScriptAccess="sameDomain"
						type="application/x-shockwave-flash"
						flashVars="<c:out value="${flashVar}"  escapeXml="false"/>"
						pluginspage="http://www.adobe.com/go/getflashplayer">
					</embed>
			</object>
		</noscript>
	    
	</div>
    
    <div id="produit_right">
    	<b>Référence</b>&nbsp;<c:out value="${produit.reference}" />
    	<c:forEach var="spec" items="${produit.specs}" varStatus="i">
   			&nbsp;&nbsp;<c:out value="${spec.nom}"/>
   		</c:forEach>
   		<br />
   		<b>Dénomination</b>&nbsp;<c:out value="${produit.denomination}" /><br />
   		<b>Description</b>&nbsp;<c:out value="${produit.description}" /><br />
   		<b>Matériaux</b>&nbsp;<c:out value="${produit.materiaux}" /><br />
   		<b>Poids de l'article</b>&nbsp;<c:out value="${produit.poids}" /><br />
   		<b>Dimension</b>&nbsp;<br />
   		<b>Haut.</b>&nbsp;<c:out value="${produit.hauteur}" /><b>Larg.</b><c:out value="${produit.largeur}" /><b>Prof.</b><c:out value="${produit.profondeur}" /><br />
   		<b>Diamètre</b>&nbsp;<c:out value="${produit.diametre}" /><br />
   		<b>Coloris</b><br />
   		<c:forEach var="coloris" items="${produit.coloris}" varStatus="i">
   			<img src="/${ROOT}/<c:out value="${coloris.picto}"/>" width="50" height="15" border="0" />&nbsp;
   		</c:forEach>
   		<br />
   		<b>Année</b>&nbsp;<c:out value="${produit.descAnnee}" /><br />
   		<b>Origine/Pays</b>&nbsp;<c:out value="${produit.pays.nom}" /><br />
   		<b>Signe apparent</b>&nbsp;<c:out value="${produit.signeApp}" /><br />
   		<b>Prix en euros:</b>&nbsp;<c:out value="${produit.prix}" />&nbsp;
   		
   		<form name="ajoutPanier" action="/${ROOT}/monPanier.htm" method="POST">
   			<input type="hidden" name="idProduit" value="<c:out value="${produit.id}"/>" />
   			<input type="hidden" name="action" value="1" />
   			<input type="submit" value="Ajouter au panier"/>
   		</form>
   		
   		
   		
   		<span class="todo">BOUTON RETOUR VIGNETTES</span><br />
   		<b>Disponible à la location</b>&nbsp;<c:out value="${produit.dispoLoc}" />&nbsp;<span class="todo">BOUTON LOUER</span><br />
    </div>
    
    <div id="produit_bas">
    	<b>Objet(s) rapporté(s)</b>&nbsp;<b><c:out value="${nbProduit}" /></b>&nbsp;
    	
    	<c:if test="${not empty pager}">
    		&lt;&nbsp;
    		<c:if test="${currentPage != 1}">
    			<form style="display: inline;" name="precedent" action="" method="POST">
    				<input type="hidden" name="idProduit" value="<c:out value="${produit.id}"/>" />
    				<input type="hidden" name="rubrique" value="<c:out value="${rubrique.id}"/>" />
    				<input type="hidden" name="pageIndex" value="<c:out value="${pageIndex-1}"/>" />
    				<a href="#" onclick="document.precedent.submit();"><spring:message code="previous"/></a>
    			</form>
    			<c:if test="${currentPage != nbPages}">&nbsp;&nbsp;</c:if>
    		</c:if>
    		<c:if test="${currentPage != nbPages}">
    			<form style="display: inline;" name="suivant" action="" method="POST">
    				<input type="hidden" name="idProduit" value="<c:out value="${produit.id}"/>" />
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
		    			<input type="hidden" name="idProduit" value="<c:out value="${produit.id}"/>" />
	    					<input type="hidden" name="rubrique" value="<c:out value="${rubrique.id}"/>" />
	    					<input type="hidden" name="pageIndex" value="<c:out value="${v.count-1}"/>" />
	    					<a href="#" onclick="document.page<c:out value="${v.count}"/>.submit();"><c:out value="${v.count}"/></a>
	    				</form>
		    		</c:otherwise>
	    		</c:choose>
	    		<c:if test="${not v.last}">-</c:if>
	    	</c:forEach>
    	</c:if>
    	
    	<div id="spacer">&nbsp;</div>
    
	    <c:forEach var="produit" items="${produitAssociated}" varStatus="v">    	
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
	    	<br />
	    	<b>Commentaire</b><span class="todo">TODO PTIT FORMULAIRE</span><br />
	    </div>
</div>