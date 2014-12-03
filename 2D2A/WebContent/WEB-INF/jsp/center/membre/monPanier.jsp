<%@ include file="../../head/include.jsp" %>

	<script type="text/javascript" src="/${ROOT}/resources/js/uploadfile/prototype.js"></script>
	<script type="text/javascript" src="/${ROOT}/resources/js/uploadfile/scriptaculous.js"></script>
	<script type="text/javascript" src="/${ROOT}/resources/js/uploadfile/multiupload.js"></script>

	<script type="text/javascript" src="/${ROOT}/resources/js/panier.js"></script> 
	<script type="text/javascript" src="/${ROOT}/resources/js/print.js"></script> 

<!-- startPanier -->

	<!-- 
		Pour les différents états du panier, il faut faire varier la classe ci-dessous avec :
			class="phase1" : Mon panier
			class="phase2" : Livraison 
			class="phase3" : Résumé 
			class="phase4" : Payement 
			class="phase5" : Confirmation
	-->
  
    
    <div id="crawlPanier" class="phase1">
    	<ul>
			<li class="crawlPanierStep1"><a href="#" title="<spring:message code="monPanier.step1"/>">1<br/><span><spring:message code="monPanier.step1"/></span></a></li>
			<li class="crawlPanierStep2"><a href="#" title="<spring:message code="monPanier.step2"/>">2<br/><span><spring:message code="monPanier.step2"/></span></a></li>
			<li class="crawlPanierStep3"><a href="#" title="<spring:message code="monPanier.step3"/>">3<br/><span><spring:message code="monPanier.step3"/></span></a></li>
			<li class="crawlPanierStep4"><a href="#" title="<spring:message code="monPanier.step4"/>">4<br/><span><spring:message code="monPanier.step4"/></span></a></li>
			<li class="crawlPanierStep5"><a href="#" title="<spring:message code="monPanier.step5"/>">5<br/><span><spring:message code="monPanier.step5"/></span></a></li>
		</ul>
		<c:if test="${empty param['imprimer']}">
			<div id="actionPage">
		    	<a href="#" onclick="javascript:imprime_zone('Imprimer', 'panier', window.location);" class="imprimer" title="Imprimer"></a>
			</div>
		</c:if>
	</div>
  	  
    <strong class="brown"><spring:message code="monPanier.title" />
    <br/>
    <br/>
	<spring:message code="monPanier.exp1" htmlEscape="false"/></strong>
	<c:choose>
    	<c:when test="${empty achat}">
			<spring:message code="monPanier.exp2" htmlEscape="false"/><br/><br/>
    	</c:when>
    	<c:otherwise>
	    	<b><spring:message code="monPanier.identification.intro" htmlEscape="false"/></b><br /><br /><br />		    	
    	</c:otherwise>
    </c:choose>
	
	<table class="articles" summary="Articles">
	<colgroup class="description"><col/></colgroup>
	<colgroup class="prices" span="4"></colgroup>
       <thead>
       	<tr>
               <th>&nbsp;</th>
               <th><spring:message code="monPanier.coloris"/></th>
               <th><spring:message code="monPanier.ref"/></th>
               <th><spring:message code="monPanier.quantiteArticle"/></th>
               <th><spring:message code="monPanier.prixHtArticle"/></th>
               <th><spring:message code="monPanier.prixTtcArticle" /></th>
               <th><spring:message code="monPanier.prixTotalArticle" /></th>
               <th></th>
           </tr>
       </thead>
	<tfoot>
		<tr>
			<td><spring:message code="monPanier.prixTotal"/></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td id="prixTotal">
		    	<c:out value="${monPanier.prixFormate}"/>
		    </td>
		    <td>&nbsp;</td>
		</tr>
	</tfoot>
	<form name="acheterPanier" action="/${ROOT}/monPanier.htm" method="post">
	   	<input type="hidden" name="idProduit" value="" />
	   	<input type="hidden" name="idOuvrage" value="" />
	   	<input type="hidden" name="idColoris" value="" />
	   	<input type="hidden" name="action" value="" />
	   	<input type="hidden" name="login" value="" />
	   	<input type="hidden" name="password" value="" />
	   	
	   	<!-- startArticle -->
	   	<c:forEach var="produit" items="${monPanier.mesProduits}" varStatus="i">
			<tr>
				<td>
		        	<img src="/${ROOT}/<c:out value="${produit.images[0].vignette}"/>" width="75" height="75" alt="<c:out value="${produit.reference}"/>" />
		            <div>		            	
		               	<spring:message code="monPanier.nom" /><br />
		               	<spring:message code="monPanier.designer" /><br />
		               	<spring:message code="monPanier.editeur" />
		            </div>
	               <p>
		               	<c:out value="${produit.nom}"/><br/>
		               	<c:out value="${produit.designer.prenom}"/>&nbsp;<c:out value="${produit.designer.nom}"/><br/>
						<c:out value="${produit.editeur.prenom}"/>&nbsp;<c:out value="${produit.editeur.nom}"/>
		           </p>
		        </td>
				<td>
					<c:forEach var="coloris" items="${produit.coloris}">
			   			<c:if test="${coloris.colId == produit.colId}">
			   				<div class="coloris" style="background-image: url('/${ROOT}/<c:out value="${coloris.picto}"/>');" />
			   			</c:if>
			   		</c:forEach>
				</td>
				<td><c:out value="${produit.reference}"/></td>
				<td>
					<select class="listederoulante" id="quantiteReservee<c:out value='${i.index}'/>" name="quantiteReservee[<c:out value='${i.index}'/>]"
					<%--onkeyup="updatePrice(document.getElementById('quantiteReservee<c:out value='${i.index}'/>').value, '<c:out value="${produit.prix}"/>', 'totalProduit<c:out value='${i.index}'/>', document.getElementById('prixTotal'));"
					onkeydown="updatePrice(document.getElementById('quantiteReservee<c:out value='${i.index}'/>').value, '<c:out value="${produit.prix}"/>', 'totalProduit<c:out value='${i.index}'/>', document.getElementById('prixTotal'));"
					onchange="updatePrice(document.getElementById('quantiteReservee<c:out value='${i.index}'/>').value, '<c:out value="${produit.prix}"/>', 'totalProduit<c:out value='${i.index}'/>', document.getElementById('prixTotal'));"--%>
					onchange="document.acheterPanier.action.value=6; document.acheterPanier.submit();">
		   				<c:forEach begin="1" end="${produit.quantite}" step="1" var="j">
		   					<option value="<c:out value="${j}"/>" <c:if test="${produit.quantiteReservee == j}">selected="selected"</c:if>><c:out value="${j}"/></option>
		   				</c:forEach>
		   			</select>
				</td>
				<td><c:out value="${produit.prixHt}"/></td>
				<td><c:out value="${produit.prixFormate}"/></td>
				<td><span id="totalProduit${i.index}"><c:out value="${produit.prixTotalFormate}"/></span></td>
				<td>
					<a href="#" onclick="document.acheterPanier.action.value=2; document.acheterPanier.idColoris.value=<c:out value="${produit.colId}"/>; document.acheterPanier.idProduit.value=<c:out value="${produit.proId}"/>;document.acheterPanier.submit();">
						<img src="/${ROOT}/resources/pic/panier/corbeille.gif" border="0" style="border-style: none"/> 
					</a>
				</td>
			</tr>
		</c:forEach>
		<!-- endArticle -->
		
		<!-- start ouvrage -->
		<c:forEach var="ouvrage" items="${monPanier.mesOuvrages}" varStatus="i">
			<tr>
				<td>
		        	<img src="/${ROOT}/<c:out value="${ouvrage.images[0].pathPhoto}"/>" width="75" height="75" alt="<c:out value="${ouvrage.reference}"/>" />
		            <div>
		               	<spring:message code="monPanier.nom" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />		               	
		            </div>
	               <p>
		               	<c:out value="${ouvrage.titre}"/><br/>		               	
		           </p>
		        </td>
		       	
				<td>&nbsp;</td>
				<td><c:out value="${ouvrage.reference}"/></td>
				<td>
					<select class="listederoulante" id="quantiteReserveeOuvrage<c:out value='${i.index}'/>" name="quantiteReserveeOuvrage[<c:out value='${i.index}'/>]" onchange="document.acheterPanier.action.value=6; document.acheterPanier.submit();">
		   				<c:forEach begin="1" end="${ouvrage.quantite}" step="1" var="j">
		   					<option value="<c:out value="${j}"/>" <c:if test="${ouvrage.quantiteReservee == j}">selected="selected"</c:if>><c:out value="${j}"/></option>
		   				</c:forEach>
		   			</select>
				</td>
				<td><c:out value="${ouvrage.prixHt}"/></td>
				<td><c:out value="${ouvrage.prixFormate}"/></td>
				<td><span id="totalouvrage${i.index}"><c:out value="${ouvrage.prixTotalFormate}"/></span></td>
				<td>
					<a href="#" onclick="document.acheterPanier.action.value=2;document.acheterPanier.idOuvrage.value=<c:out value="${ouvrage.id}"/>;document.acheterPanier.submit();">
						<img src="/${ROOT}/resources/pic/panier/corbeille.gif" border="0" style="border-style: none"/> 
					</a>
				</td>
			</tr>
		</c:forEach>
		<!-- endOuvrage -->
		
		<c:if test="${empty monPanier.mesProduits && empty monPanier.mesOuvrages}" >
		<tr>
			<td class="b brown"><spring:message code="monPanier.panierVide"/></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		</c:if>
	</table>
	<div class="actions">
		<ul class="actions fl">
			<li class="noSep">
				<a href="#" onclick="document.acheterPanier.action.value=3;document.acheterPanier.submit();" title="<spring:message code="monPanier.bouton.vider"/>"><spring:message code="monPanier.bouton.vider"/></a>
			</li>
		</ul>
		<ul class="actions fr"> 
			<li class="noSep"><a href="#" onclick="retourPanier();" title="<spring:message code="monPanier.bouton.continuer"/>"><spring:message code="monPanier.bouton.continuer"/></a></li>
			<%--<li class="noSep">
				<c:if test="${empty achat}">
					<a href="#" onclick="document.acheterPanier.action.value=4;document.acheterPanier.submit();" title="<spring:message code="monPanier.bouton.acheter"/>"><spring:message code="monPanier.bouton.acheter"/></a>
				</c:if>
			</li>--%>
		</ul>
	</div>
	</form>
	<c:if test="${not empty achat}">
		<div class="blocsAdresses">
	    	<c:if test="${not empty panierAuthenticationError}">
				<span style="color:red;"><br/><br/><spring:message code="authentification.error" /><br/></span>
			</c:if>
	    	<div>
	    		<strong class="brown"><br/><spring:message code="monPanier.identification.membreIdentification" htmlEscape="false"/><br/></strong><br/>
		    </div>
	    	<div>
		    	<spring:message code="monPanier.identification.pasMembre" htmlEscape="false"/><a href="/${ROOT}/devenirMembre.htm" class="L magenta"><span class="magenta"><spring:message code="monPanier.identification.pasMembre.button" htmlEscape="false"/></span></a><br/><br/>
	    	</div>
			<div>
				<form name="newAuthenticationForm" action="" method="post">
					<table class="formulaire">
					    <col class="col1"/>
						<col class="col2"/>
						<tr>
							<td class="left"><spring:message code="monPanier.identification.mail" /></td>
							<td class="right"><input class="field" type="text" name="login" value="" /></td>
						</tr>
						<tr>
							<td class="left"><spring:message code="monPanier.identification.password" /></td>
							<td class="right"><input class="field" type="password" name="password" value="" /></td>
						</tr>
						<%--
		   				<tr>
							<td class="left noborder"></td>
							<td class="right pt20">
								 
							   	<spring:message code="monPanier.identification.nextStep" htmlEscape="false"/>
								
							    <a class="bouton" href="#" onclick="document.acheterPanier.action.value=5;document.acheterPanier.login.value=document.newAuthenticationForm.login.value;document.acheterPanier.password.value=document.newAuthenticationForm.password.value;document.acheterPanier.submit();" title="Valider"><span><span><spring:message code="monPanier.identification.nextStepButton" /></span></span></a>
							</td>
			    		</tr>
			    		--%>
					</table>
				</form>
			</div>
		</div>
		<div class="lalivraison">
			<spring:message code="monPanierRecapitulatif.livraison.firstStep"/><br/><br/>
			<a href="#" class="bouton" onclick="document.acheterPanier.action.value=5;document.acheterPanier.login.value=document.newAuthenticationForm.login.value;document.acheterPanier.password.value=document.newAuthenticationForm.password.value;document.acheterPanier.submit();" title="<spring:message code="monPanierRecapitulatif.livraison.nextStepButton"/>"><span><span><spring:message code="monPanierRecapitulatif.livraison.nextStepButton"/></span></span></a>
	    </div>
    </c:if>	
    <c:if test="${empty achat}">
		<div class="lalivraison">
			<spring:message code="monPanierRecapitulatif.livraison.firstStep"/><br/><br/>
			<a href="#" class="bouton" onclick="document.acheterPanier.action.value=4;document.acheterPanier.submit();" title="<spring:message code="monPanierRecapitulatif.livraison.nextStepButton"/>"><span><span><spring:message code="monPanierRecapitulatif.livraison.nextStepButton"/></span></span></a>
	    </div>
	</c:if>
<!-- endPanier -->
<div class="XP"></div>


