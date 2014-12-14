<%@ include file="../../../head/include.jsp" %>


    
    <div id="crawlPanier" class="phase3">
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
	
    <div id="enteteFiche">
    	<strong class="brown"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.civilite.titre}"/>&nbsp;<c:out value="${sessionScope.AUTHENTICATED_MEMBER.prenom}"/>&nbsp;<c:out value="${sessionScope.AUTHENTICATED_MEMBER.nom}"/></strong>
    </div>
    
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
			    	<c:out value="${monPanier.prix}"/>
			    </td>
			</tr>
	   </tfoot>
	   	
	   	<!-- startArticle -->
	   	<c:forEach var="produit" items="${monPanier.mesProduits}" varStatus="i">
			<tr>
				<td>
		        	<a href="#"  title="<c:out value="${produit.reference}"/>" ><img src="/${ROOT}/<c:out value="${produit.images[0].vignette}"/>" width="75" height="75" alt="<c:out value="${produit.reference}"/>" /></a>
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
					<c:out value="${produit.quantiteReservee}"/>
				</td>
				<td><c:out value="${produit.prixHt}"/></td>
				<td><c:out value="${produit.prix}"/></td>
				<td><span id="totalProduit${i.index}"><c:out value="${produit.prixTotal}"/></span></td>
			</tr>
		</c:forEach>
		<!-- endArticle -->
		
		<!-- start ouvrage -->
		<c:forEach var="ouvrage" items="${monPanier.mesOuvrages}" varStatus="i">
			<tr>
				<td>
		        	<a href="#"  title="<c:out value="${ouvrage.reference}"/>" ><img src="/${ROOT}/<c:out value="${ouvrage.images[0].pathPhoto}"/>" width="75" height="75" alt="<c:out value="${ouvrage.reference}"/>" /></a>
		            <div>
		               	<spring:message code="monPanier.nom" /><br />
		               	<%--<spring:message code="monPanier.designer" /><br />
		               	<spring:message code="monPanier.editeur" />--%>
		            </div>
	               <p>
		               	<c:out value="${ouvrage.titre}"/><br/>
		               	<%--<c:out value="${ouvrage.designer.prenom}"/>&nbsp;<c:out value="${ouvrage.designer.nom}"/><br/>
						<c:out value="${ouvrage.editeur.prenom}"/>&nbsp;<c:out value="${ouvrage.editeur.nom}"/>--%>
		           </p>
		        </td>
		       	
				<td>&nbsp;</td>
				<td><c:out value="${ouvrage.reference}"/></td>
				<td>
					<c:out value="${ouvrage.quantiteReservee}"/>
				</td>
				<td><c:out value="${ouvrage.prixHt}"/></td>
				<td><c:out value="${ouvrage.prix}"/></td>
				<td><span id="totalouvrage${i.index}"><c:out value="${ouvrage.prixTotal}"/></span></td>
			</tr>
		</c:forEach>
		<!-- endOuvrage -->
		
		<c:if test="${empty monPanier.mesProduits}" >
			<tr>
				<td class="b brown"><spring:message code="monPanier.panierVide"/></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		</c:if>
	</table>
	
	<div class="blocsAdresses">
			<div class="fl left">
				<div class="lib">
					<span class="lib"><spring:message code="monPanierRecapitulatif.factu.label"/></span>
				</div>
				<c:if test="${not empty maCommande.adresseFactu.societe}">
		    		<span id="societe">Soci&eacute;t&eacute; <c:out value="${maCommande.adresseFactu.societe}"/></span><br/>
		    	</c:if>
		    	<span id="prenom"><c:out value="${maCommande.adresseFactu.prenom}"/></span>&nbsp;<span id="nom"><c:out value="${maCommande.adresseFactu.nom}"/></span><br />
		    	<span id="adresse"><c:out value="${maCommande.adresseFactu.adresse}"/></span><br />
		    	<span id="compAdresse">
		    		<c:if test="${not empty maCommande.adresseFactu.complementAdresse}">
		    			<c:out value="${maCommande.adresseFactu.complementAdresse}"/><br />
		    		</c:if>
		    	</span>
		    	<span id="codePostal"><c:out value="${maCommande.adresseFactu.codePostal}"/></span>&nbsp;<span id="ville"><c:out value="${maCommande.adresseFactu.ville}"/></span><br />
		    	<span id="pays"><c:if test="${not empty maCommande.adresseFactu.pays.nom}">
		    		<c:out value="${maCommande.adresseFactu.pays.nom}"/><br/>
		    	</c:if></span>
		    	<span id="telPrive"><c:if test="${not empty maCommande.adresseFactu.telPrive}">
		    		<c:out value="${maCommande.adresseFactu.telPrive}"/><br />
		    	</c:if></span>
				<br />
			</div>
			<div class="fr right">
				<div class="lib">
					<span class="lib"><spring:message code="monPanierRecapitulatif.livraison.adresse"/></span>
				</div>
				<c:if test="${not empty maCommande.adresseLivraison.societe}">
		    		<span id="societe2">Soci&eacute;t&eacute; <c:out value="${maCommande.adresseLivraison.societe}"/></span><br/>
		    	</c:if>
		    	<span id="prenom2"><c:out value="${maCommande.adresseLivraison.prenom}"/></span>&nbsp;<span id="nom2"><c:out value="${maCommande.adresseLivraison.nom}"/></span><br />
		    	<span id="adresse2"><c:out value="${maCommande.adresseLivraison.adresse}"/></span><br />
		    	<span id="compAdresse2"><c:if test="${not empty maCommande.adresseLivraison.complementAdresse}">
		    		<c:out value="${maCommande.adresseLivraison.complementAdresse}"/><br />
		    	</c:if></span>
		    	<span id="codePostal2"><c:out value="${maCommande.adresseLivraison.codePostal}"/></span>&nbsp;<span id="ville2"><c:out value="${maCommande.adresseLivraison.ville}"/></span><br />
		    	<span id="pays2"><c:if test="${not empty maCommande.adresseLivraison.pays.nom}">
		    		<c:out value="${maCommande.adresseLivraison.pays.nom}"/><br/>
		    	</c:if></span>
		    	<span id="telPrive2"><c:if test="${not empty maCommande.adresseLivraison.telPrive}">
		    		<c:out value="${maCommande.adresseLivraison.telPrive}"/><br />
		    	</c:if></span>
				<br/>
			</div>
		</div>
    
	<form name="monPanierRecapitulatifForm" action="" method="post">
		<div class="XP"></div>
		
		<div class="lalivraison">
	    	<div>
		   		<c:if test="${not empty error}"><br/><span id="obligatoire"><ul></c:if>
		        	<li><spring:message code="inscription.error.acceptation" /></li>
		        <c:if test="${not empty error}"></ul></span><br /></c:if>
			</div>
		</div>
		
		<div class="CGVCheckBox">
			<spring:bind path="maCommande.acceptation">
				<input type="checkbox" name="<c:out value="${status.expression}"/>" value="1" <c:if test="${status.value==1}">checked="checked"</c:if>/>
				<label for="<c:out value="${status.expression}"/>">
					<strong class="brown"><spring:message code="monPanierRecapitulatif.livraison.acceptation"/></strong>
					<a href="#" onclick="window.open('/${ROOT}/conditionsGenerales.htm?cg=3', '_blank', 'toolbar=0, location=0, status=0, scrollbars=0, menubar=0, resizable=0, width=<spring:message code="conditionsGenerales.width"/>, height=<spring:message code="conditionsGenerales.height"/>');" title="<spring:message code="monPanierRecapitulatif.livraison.condition"/>" class="magenta"><spring:message code="monPanierRecapitulatif.livraison.condition"/></a>
				</label>
			</spring:bind>
		</div>
		<div class="lalivraison">
			<spring:message code="monPanierRecapitulatif.livraison.paiementStep"/><br/><br/>
			<a href="#" class="bouton" onclick="document.monPanierRecapitulatifForm.action.value=2;document.monPanierRecapitulatifForm.submit();" title="<spring:message code="monPanierRecapitulatif.livraison.nextStepButton"/>"><span><span><spring:message code="monPanierRecapitulatif.livraison.nextStepButton"/></span></span></a>
	    </div>
	</form>
