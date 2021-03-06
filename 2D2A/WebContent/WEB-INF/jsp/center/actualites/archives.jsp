<%@ include file="../../head/include.jsp" %>
<script type="text/javascript" src="/${ROOT}/resources/js/print.js"></script> 

<!-- startEnteteFiche -->
<div id="enteteFiche">

 <!-- startTitleFiche -->
    <p class="b brown fs13 mt5"><c:out value="${rubrique.nom}" /></p>
 
    <!-- endTitleFiche -->

	<!-- startLexique -->
   <div id="lexique" class="brown">
   		<jsp:include page="../lexique.jsp" />
   </div>
     <!-- startListLetters -->
    <ul class="hList listArchive">
    
    
    	<c:forEach var="lettre" items="${lettresUtiles}" varStatus="i">
			<c:choose>
	    		<c:when test="${i.first}">
					 <li class="first">
						 <c:choose>
							 <c:when test="${not empty lettre.value}">
								<form name="lettreForm_<c:out value="${lettre.key}"/>" id="lettreForm_<c:out value="${lettre.key}"/>" method="post" action="">
						    		<input type="hidden" value="<c:out value="${lettre.key}"/>" name="selectedLetter"/>
									<a <c:if test="${filter.selectedLetter == lettre.key}">class="sel"</c:if> href="#" onclick="document.getElementById('lettreForm_<c:out value="${lettre.key}"/>').submit();"><c:out value="${lettre.key}"/></a>
								</form>
							 </c:when>
							 <c:otherwise>
								<a><c:out value="${lettre.key}"/></a>
							 </c:otherwise>
						</c:choose>
					 </li>
				</c:when>
	    		<c:otherwise>
					<li>
						<c:choose>
							 <c:when test="${not empty lettre.value}">
								<form name="lettreForm_<c:out value="${lettre.key}"/>" id="lettreForm_<c:out value="${lettre.key}"/>" method="post" action="">
									<input type="hidden" value="<c:out value="${lettre.key}"/>" name="selectedLetter"/>
										<a <c:if test="${filter.selectedLetter == lettre.key}">class="sel"</c:if> href="#" onclick="document.getElementById('lettreForm_<c:out value="${lettre.key}"/>').submit();"><c:out value="${lettre.key}"/></a>
								</form>
							 </c:when>
							 <c:otherwise>
								<a><c:out value="${lettre.key}"/></a>
							 </c:otherwise>
						</c:choose>					
					</li>
				</c:otherwise>
			</c:choose>			
		</c:forEach>
    
    
<%--
	    <c:forEach var="lettre" items="${lettresUtiles}" varStatus="i">
	    	<c:if test="${not empty lettre.value}">
	    		<form style="display: inline;" name="lettreForm_<c:out value="${lettre.key}"/>" id="lettreForm_<c:out value="${lettre.key}"/>" method="post" action="">
		    		<input type="hidden" value="<c:out value="${lettre.key}"/>" name="selectedLetter"/>
		    		<a href="#" onclick="document.getElementById('lettreForm_<c:out value="${lettre.key}"/>').submit();">
	    	</c:if>
	    	<c:if test="${filter.selectedLetter == lettre.key}"><b></c:if><c:out value="${lettre.key}"/><c:if test="${filter.selectedLetter == lettre.key}"></b></c:if>
	    	<c:if test="${not empty lettre.value}">
	    			</a>
	    		</form>
	    	</c:if>
	    	<c:if test="${not i.last}">&nbsp;-&nbsp;</c:if>
	    </c:forEach>
--%>
	  </ul>
    <!-- endListLetters -->
 
  <!-- startListPeople -->
	<ul class="hList listPeople">

	    <c:if test="${not empty selectedArtistes}">
	    	<c:forEach var="artiste" items="${selectedArtistes}" varStatus="i">
			<c:choose>
	    		<c:when test="${i.first}">
	    			<li class="first">
	    			   	<a href="/${ROOT}<the2D2A:link artiste="${artiste}" />" <c:if test="${filter.selectedArtisteId == artiste.id}">class="sel"</c:if>>
				    		<c:out value="${artiste.nom}"/>&nbsp;<c:out value="${artiste.prenom}"/>
				    	</a>	
	    			</li>
	    		</c:when>
	    		<c:otherwise>
	    			<li>
			    		<a href="/${ROOT}<the2D2A:link artiste="${artiste}" />" <c:if test="${filter.selectedArtisteId == artiste.id}">class="sel"</c:if>>
		    				<c:out value="${artiste.nom}"/>&nbsp;<c:out value="${artiste.prenom}"/>
		    			</a>
	    			</li>	    		
	    		</c:otherwise>
	    	</c:choose>
	    	
	    	
	    	</c:forEach>
	    </c:if>

<!-- 
		<c:if test="${not empty selectedArtistes}">
	    	<c:forEach var="artiste" items="${selectedArtistes}" varStatus="i">
	    	
	    		<form style="display: inline;" name="artisteForm_<c:out value="${artiste.id}"/>" id="artisteForm_<c:out value="${artiste.id}"/>" method="post" action="">
	    			<input type="hidden" value="<c:out value="${filter.selectedLetter}"/>" name="selectedLetter"/>
		    		<input type="hidden" value="<c:out value="${artiste.id}"/>" name="selectedArtisteId"/>
		    		<input type="hidden" value="<c:out value="${artiste.typeArtiste}"/>" name="typeArtiste"/>
		    		<a href="#" onclick="document.getElementById('artisteForm_<c:out value="${artiste.id}"/>').submit();">
	    				<c:if test="${filter.selectedArtisteId == artiste.id}"><b></c:if><c:out value="${artiste.nom}"/>&nbsp;<c:out value="${artiste.prenom}"/><c:if test="${filter.selectedArtisteId == artiste.id}"></b></c:if>
	    			</a>
	    		</form>
	    	</c:forEach>
	    </c:if>
 -->

	</ul>
	<!-- endListPeople -->
    
</div>
<div id="separationEnteteFiche"></div>
<!-- endEnteteFiche -->


<!-- startCorpsFiche -->
<div id="ficheCorps">
	<!-- startLeftColumn -->
	<c:if test="${not empty currentArtiste}">
		<div class="leftColumn">
	      	<h1><c:out value="${currentArtiste.prenom}" />&nbsp;<c:out value="${currentArtiste.nom}" /></h1>
			<div class="zoomProduit">
				<img id="produit" src="/${ROOT}/<c:out value="${currentArtiste.pathPhoto}" />" width="400" height="400" alt="<c:out value="${currentArtiste.prenom}" />&nbsp;<c:out value="${currentArtiste.nom}" />" />
			</div>
			<%--
			<div class="littleProduit">
				<a href="#" id="lienp1"><img src="res/pic/examples/aran1.jpg" width="68" height="68" alt="<c:out value="${currentArtiste.prenom}" />&nbsp;<c:out value="${currentArtiste.nom}" />" /></a>
				<a href="#" id="lienp2"><img src="res/pic/examples/aran2.jpg" width="68" height="68" alt="<c:out value="${currentArtiste.prenom}" />&nbsp;<c:out value="${currentArtiste.nom}" />" /></a>
				<a href="#" id="lienp3"><img src="res/pic/examples/aran1.jpg" width="68" height="68" alt="<c:out value="${currentArtiste.prenom}" />&nbsp;<c:out value="${currentArtiste.nom}" />" /></a>
				<a href="#" id="lienp4"><img src="res/pic/examples/aran2.jpg" width="68" height="68" alt="<c:out value="${currentArtiste.prenom}" />&nbsp;<c:out value="${currentArtiste.nom}" />" /></a>
				<a href="#" id="lienp5"><img src="res/pic/examples/aran1.jpg" width="68" height="68" alt="<c:out value="${currentArtiste.prenom}" />&nbsp;<c:out value="${currentArtiste.nom}" />" /></a>
			</div>
			--%>
          	<table border="0" cellpadding="0" class="description">
				<tr>
               		<td class="lib">Pr&eacute;nom</td>
                	<td class="description"><c:out value="${currentArtiste.prenom}" /></td>
               </tr>
               <tr>
   	           		<td class="lib">Nom</td>
	                <td class="description"><c:out value="${currentArtiste.nom}" /></td>
               </tr>
               <tr>
	   	            <td class="lib">Lieu de naissance</td>
    	            <td class="description"><c:out value="${currentArtiste.lieuNaiss}" /></td>
               </tr>
               <tr>
	                <td class="lib">Date de naissance</td>
   		            <td class="description"><c:out value="${currentArtiste.dateNaiss}" /></td>
               </tr>
               <tr>
	                <td class="lib lastLine">D&eacute;c&egrave;s</td>
   		            <td class="description lastLine">TODO</td>
              </tr>
			</table>
		</div>
	    <!-- endLeftColumn -->
	    <!-- startRightColumn -->
		<div class="rightColumn">
			<table border="0" cellpadding="0" class="description rightcolumnSize">
				<tr>
					<td class="lib">Biographie</td>
	
					<td class="description">
						<c:out value="${currentArtiste.biographie}" />
					</td>
				</tr>
				<tr>
					<td class="lib">Information(s)</td>
					<td class="description">
						<c:out value="${currentArtiste.information}" />
					</td>
				</tr>
				<tr>
					<td class="lib">Collaboration(s)</td>
					<td class="description">
						<c:out value="${currentArtiste.collaboration}" />
					</td>
				</tr>
				<tr>
					<td class="lib">Bilbliographie(s)</td>
					<td class="description">
						<c:out value="${currentArtiste.bibliographie}" />
					</td>
				</tr>
				<tr>
					<td class="lib">Site web</td>
					<td class="description">
					<a href="#" onclick="javascript:window.open('<c:out value="${currentArtiste.siteInternet}" />');return false;" class="lien"><c:out value="${currentArtiste.siteInternet}" /></a>
					</td>
				</tr>
			</table>
		</div>
		<!-- endRightColumn -->
	</c:if>
	
	<p class="XP"></p>
	<!-- startObjetRapporte -->
	<c:if test="${not empty produitsAssociated}">
	     <div id="objetRapporte">
	     	<h1><spring:message code="archives.objetRapporte"/><span class="brown">[<c:out value="${nbProduitsAssociated}" />]</span></h1>
	     	
	       	<div id="slideObjetRapporte">
				<!-- startItemObjetRapporte -->
				<c:forEach var="produit" items="${produitsAssociated}" varStatus="v">    	
			    	<div class="blocObjetRapporte">
		                 <span>
			             	<c:out value="${produit.nom}"/> : <c:out value="${produit.reference}"/>
			                <c:forEach var="spec" items="${produit.specs}" varStatus="i">
					    			<c:if test="${not i.first}">/</c:if>
					    			<c:out value="${spec.abbr}"/>
					    		</c:forEach>
		                 </span>
		                 <c:forEach var="image" items="${produit.images}" varStatus="i">
				    			<c:if test="${i.first}">
				    				<a href="/${ROOT}<the2D2A:link produit="${produit}" />">
			    						<img src="/${ROOT}/<c:out value="${image.vignette}"/>" width="223" height="223" alt="${produit.nom}"/>
			    					</a>
				    			</c:if>
				    	 </c:forEach>
		                 <div class="info">
		                    <img src="/${ROOT}/resources/pic/lexique/designer.png" width="14" height="14" alt="designer" />
		                    <span><a href="/${ROOT}<the2D2A:link artiste="${produit.designer}" />" class="lien"><c:out value="${produit.designer.nom}" />&nbsp;<c:out value="${produit.designer.prenom}" /></a></span>
		             	 </div>
		                  <div class="info">
		                    <img src="/${ROOT}/resources/pic/lexique/editeur.png" width="14" height="14" alt="editeur" />
		                    <span><a href="/${ROOT}<the2D2A:link artiste="${produit.editeur}" />" class="lien"><c:out value="${produit.editeur.nom}" />&nbsp;<c:out value="${produit.editeur.prenom}" /></a></span>
		                 </div>
		                  <div class="info">
		                    <img src="/${ROOT}/resources/pic/lexique/prix.png" width="14" height="14" alt="prix" />
		                    <span><spring:message code="produit.prix"/> :<c:out value="${produit.prixFormate}" /></span>
		                 </div>
		                 <form name="ajoutPanier<c:out value="${produit.proId}"/>" id="ajoutPanier<c:out value="${produit.proId}"/>" action="/${ROOT}/monPanier.htm" method="post">
					   		<input type="hidden" name="idProduit" value="<c:out value="${produit.proId}"/>" />
					   		<input type="hidden" name="action" value="1" />
					   	 </form>
		                 <div class="ficheArticle"><a href="/${ROOT}<the2D2A:link produit="${produit}" />" class="L"><spring:message code="boutique.ficheArticle"/></a></div>
						 <div class="achatExpress"><a href="#" class="L" onclick="document.getElementById('ajoutPanier<c:out value="${produit.proId}"/>').submit();"><spring:message code="boutique.achatExpress"/></a></div>
		                 <!-- <div class="ajouterAuFavoris"><a href="lienFiche" class="L">Ajouter au favoris</a></div> -->
		   			</div>
			   			
			    	<c:if test="${v.count%4 == 0 || v.last}">
				    	</br>
				    </c:if>
			    </c:forEach>
	   	     	<!-- endItemObjetRapporte -->         	
	        </div>
		 </div>
	 </c:if>
     <!-- endObjetRapporte -->
     <p class="XP"></p>


	<!-- endCorpsFiche -->
  	<p class="XP"></p>
</div>
