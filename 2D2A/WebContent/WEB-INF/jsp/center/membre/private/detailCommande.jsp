<%@ include file="../../../head/include.jsp" %>
	
<div id="enteteFiche">
	<strong class="brown"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.civilite.titre}"/>&nbsp;<c:out value="${sessionScope.AUTHENTICATED_MEMBER.prenom}"/>&nbsp;<c:out value="${sessionScope.AUTHENTICATED_MEMBER.nom}"/></strong><br/>
	<spring:message code="maCommande.detail.titre"/>&nbsp;<c:out value="${maCommande.dateNormale}"/>
</div>

<div id="commande">
	<table class="articles" summary="Articles">
		<colgroup class="description"><col/></colgroup>
		<colgroup class="prices" span="4"></colgroup>
	      	<thead>
	      		<tr>
	              <th>&nbsp;</th>
	              <th><spring:message code="monPanier.coloris"/></th>
	              <th><spring:message code="monPanier.ref"/></th>
	              <th><spring:message code="monPanier.quantiteArticle"/></th>
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
				<td id="prixTotal">
			    	<c:out value="${maCommande.prix}"/>
			    </td>
			</tr>
	   </tfoot>
	   	
	   	<!-- startArticle -->
	   	<c:forEach var="commandeProduit" items="${maCommande.produits}" varStatus="i">
			<tr>
				<td>
		        	<a href="#"  title="<c:out value="${commandeProduit.produit.reference}"/>" ><img src="/${ROOT}/<c:out value="${commandeProduit.produit.images[0].vignette}"/>" width="75" height="75" alt="<c:out value="${commandeProduit.produit.reference}"/>" /></a>
		            <div>
		               	<spring:message code="monPanier.nom" /><br />
		               	<spring:message code="monPanier.designer" /><br />
		               	<spring:message code="monPanier.editeur" />
		            </div>
	               <p>
		               	<c:out value="${commandeProduit.produit.nom}"/><br/>
		               	<c:out value="${commandeProduit.produit.designer.prenom}"/>&nbsp;<c:out value="${commandeProduit.produit.designer.nom}"/><br/>
						<c:out value="${commandeProduit.produit.editeur.prenom}"/>&nbsp;<c:out value="${commandeProduit.produit.editeur.nom}"/>
		           </p>
		        </td>
		        <td>
					<c:forEach var="coloris" items="${commandeProduit.produit.coloris}">
			   			<c:if test="${coloris.colId == commandeProduit.colId}">
			   				<div class="coloris" style="background-image: url('/${ROOT}/<c:out value="${coloris.picto}"/>');" />
			   			</c:if>
			   		</c:forEach>
				</td>
				<td><c:out value="${commandeProduit.produit.reference}"/></td>
				<td>
					<c:out value="${commandeProduit.quantite}"/>
				</td>
				<td><c:out value="${commandeProduit.prixUnitaire}"/></td>
				<td><c:out value="${commandeProduit.quantite * commandeProduit.prixUnitaire}"/></td>
			</tr>
		</c:forEach>
		<!-- endArticle -->
		
		<!-- start ouvrage -->
		<c:forEach var="commandeOuvrage" items="${maCommande.ouvrages}" varStatus="i">
			<tr>
				<td>
		        	<a href="#"  title="<c:out value="${commandeOuvrage.ouvrage.reference}"/>" ><img src="/${ROOT}/<c:out value="${commandeOuvrage.ouvrage.images[0].pathPhoto}"/>" width="75" height="75" alt="<c:out value="${commandeOuvrage.ouvrage.reference}"/>" /></a>
		            <div>
		               	<spring:message code="monPanier.nom" /><br />
		            </div>
	               <p>
		               	<c:out value="${commandeOuvrage.ouvrage.titre}"/><br/>
		           </p>
		        </td>
		       	
				<td>&nbsp;</td>
				<td><c:out value="${commandeOuvrage.ouvrage.reference}"/></td>
				<td>
					<c:out value="${commandeOuvrage.quantite}"/>
				</td>
				<td><c:out value="${commandeOuvrage.prixUnitaire}"/></td>
				<td><c:out value="${commandeOuvrage.quantite * commandeOuvrage.prixUnitaire}"/></td>
			</tr>
		</c:forEach>
		<!-- endOuvrage -->
		
	
	</table>
</div>

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
