<%@ include file="../head/include.jsp" %>

<script type="text/javascript" src="/${ROOT}/resources/js/topMenu.js"></script>

<div id="menuH_Back">
	<div class="languageChoose">	
		<form id="langForm" action="" method="post">
			<div>
				<input type="hidden" name="lang" id="lang" value="" />
				<input type="hidden" name="rubrique" value="<c:out value='${rubrique.rubId}'/>"/>
				<input type="hidden" name="idProduit" value="<c:out value='${produit.proId}'/>"/>
			</div>
		</form>
		<c:choose>
			<c:when test="${sessionScope.lang == 'FR'}">
			    <a href="#" class="L magenta"><span class="white">Fr</span></a>
			    &nbsp;-&nbsp;
			    
			  	<a href="#" class="L brownLight" onclick="document.getElementById('lang').value='EN';document.getElementById('langForm').submit();"><span class="brown">En</span></a>
			</c:when>
			<c:otherwise>
				<a href="#" class="L brownLight" onclick="document.getElementById('lang').value='FR';document.getElementById('langForm').submit();"><span class="brown">Fr</span></a>
				&nbsp;-&nbsp;
	
				<a href="#" class="L magenta"><span class="white">En</span></a>
			</c:otherwise>
		</c:choose>
	</div>
	
	<div class="menuHDeroulant">
		<ul class="menuHDeroulant">
			<!-- elementsMenuDeroulantHorizontal -->
			<li>
		    	<a href="/${ROOT}/gestionGenerale/modifAccueil.htm"><span>Accueil</span></a>
			</li>
		    
		    <li>
		    	<a href="/${ROOT}/boutique/rubrique.htm"><span>Boutique</span></a>
			</li>
			
			<li>
		    	<a href="/${ROOT}/membre/membre.htm"><span>Membres</span></a>
			</li>
			
			<li>
		    	<a href="/${ROOT}/commande/commande.htm"><span>Commandes</span></a>
			</li>
			
			<li>
		    	<a href="/${ROOT}/office/mail.htm"><span>Office</span></a>
			</li>
			
			<li>
		    	<a href="#"><span>...</span></a>
			</li>
		    
		</ul>
	</div>
</div>