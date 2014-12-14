<%@ include file="../../head/include.jsp" %>
<script type="text/javascript" src="/${ROOT}/resources/js/print.js"></script> 

<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->	
	<p class="b brown fs13 mt5">
		<spring:message code="recherche.titre" htmlEscape="false"/>
	</p>
	<p class="b brown">
		<spring:message code="recherche.exp" htmlEscape="false"/>
	</p>
</div>
<div id="separationEnteteFiche"></div>
<!-- endEnteteFiche -->


<!-- startCorpsFiche -->
<div id="ficheCorps">    	
   	<c:if test="${not empty pager}">
   		&lt;&nbsp;
   		<c:if test="${currentPage != 1}">
   			<form style="display: inline;" name="precedent" action="" method="post">
   				<input type="hidden" name="rubrique" value="<c:out value="${rubrique.rubId}"/>" />
   				<input type="hidden" name="pageIndex" value="<c:out value="${pageIndex-1}"/>" />
   				<a href="#" onclick="document.precedent.submit();"><spring:message code="previous"/></a>
   			</form>
   			<c:if test="${currentPage != nbPages}">&nbsp;&nbsp;</c:if>
   		</c:if>
   		<c:if test="${currentPage != nbPages}">
   			<form style="display: inline;" name="suivant" action="" method="post">
   				<input type="hidden" name="rubrique" value="<c:out value="${rubrique.rubId}"/>" />
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
	    			<form style="display: inline;" name="page<c:out value="${v.count}"/>" action="" method="post">
    					<input type="hidden" name="rubrique" value="<c:out value="${rubrique.rubId}"/>" />
    					<input type="hidden" name="pageIndex" value="<c:out value="${v.count-1}"/>" />
    					<a href="#" onclick="document.page<c:out value="${v.count}"/>.submit();"><c:out value="${v.count}"/></a>
    				</form>
	    		</c:otherwise>
    		</c:choose>
    		<c:if test="${not v.last}">-</c:if>
    	</c:forEach>
   	</c:if>
	
	<c:choose>
		<c:when test="${not empty produits}">
			<spring:message code="recherche.resultat" arguments="${nombreResultats},${searchContent}"/>
		</c:when>
		<c:otherwise>
			<spring:message code="recherche.noResultat"/>
		</c:otherwise>
	</c:choose>
	
	<div id="object">
		<div id="slideObjet">
		   <c:forEach var="produit" items="${produits}" varStatus="v">    	
		    	<div id="slideObjetRapporte">
						<!-- startItemObjetRapporte -->
						<div class="blocObjetRapporte">
							 <span><c:out value="${produit.reference}"/></span>
		    				 <a href="/${ROOT}<the2D2A:link produit="${produit}" />">
		    					<img id="imgProdFull<c:out value="${produit.proId}"/>" src="/${ROOT}/<c:out value="${produit.images[0].vignette}"/>" minWidth="223" minHeight="223" width="223" height="223" alt="<c:out value="${produit.nom}" />" border="0" />
		    				 </a>
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
								<span>Prix : <c:out value="${produit.prix}" /></span>
							 </div>
							 <div class="descriptionBouton">
						     	<form name="ajoutPanier<c:out value="${produit.proId}"/>" id="ajoutPanier<c:out value="${produit.proId}"/>" action="/${ROOT}/monPanier.htm" method="post">
						   			<input type="hidden" name="idProduit" value="<c:out value="${produit.proId}"/>" />
						   			<input type="hidden" name="action" value="1" />
						   		</form>
					         </div>
							 <div class="ficheArticle"><a href="/${ROOT}<the2D2A:link produit="${produit}" />" class="L"><spring:message code="boutique.ficheArticle"/></a></div>
							 <div class="achatExpress"><a href="#" class="L" onclick="document.getElementById('ajoutPanier<c:out value="${produit.proId}"/>').submit();"><spring:message code="boutique.achatExpress"/></a></div>
							 <!-- <div class="ajouterAuFavoris"><a href="lienFiche" class="L">Ajouter au favoris</a></div> -->
			
						</div>
						<!-- endItemObjetRapporte -->                 	
					</div>
		    </c:forEach>
		</div>
	</div>
</div>