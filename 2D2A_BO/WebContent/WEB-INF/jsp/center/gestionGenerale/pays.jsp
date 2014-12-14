<%@ include file="../../head/include.jsp" %>

<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->
	<p class="b brown fs13 mt5">Gestion des Pays</p>
	<!-- endTitleFiche -->
</div>
<div id="separationEnteteFiche"></div>
<!-- endEnteteFiche -->

<div id="ficheCorps">	
	<table class="formulaire">
		<col class="col1_Back"/>
		<col class="col2_Back"/>
		<col class="col1_Back"/>
		<col class="col2_Back"/>
		<col class="col3_Back"/>
		<c:forEach var="pays" items="${listePays}" varStatus="i">
			<tr>
				<td class="left_Back">Nom du pays en Français</td>
				<td class="right_Back"><c:out value="${pays.nom_FR}"/></td>
				<td class="left_Back">Nom du pays en Anglais</td>
				<td class="right_Back"><c:out value="${pays.nom_EN}"/></td>
				<td>
					<form style="display:inline;" name="pays_modif_<c:out value="${i.index}"/>" method="post" action="./modifPays.htm">
						<input type="hidden" name="payId" value="<c:out value="${pays.payId}"/>">
						<input type="hidden" name="nom_FR" value="<c:out value="${pays.nom_FR}"/>">
						<input type="hidden" name="nom_EN" value="<c:out value="${pays.nom_EN}"/>">
						<input type="hidden" name="action" value="2"/>						
					</form>
		
					<form style="display:inline;" name="pays_del_<c:out value="${i.index}"/>" method="post" action="./modifPays.htm">
						<input type="hidden" name="payId" value="<c:out value="${pays.payId}"/>">
						<input type="hidden" name="action" value="3"/>						
					</form>
					<div style="display:block; width= 50%; text-align: right;">
						<a href="#" onclick="document.pays_modif_<c:out value="${i.index}"/>.submit();"><img src="/${ROOT}/resources/pic/panier/edit.gif" border="0"/></a>				
						<a href="#" onclick="if (confirm('Etes-vous certain de vouloir supprimer ce pays ?')) eval('document.pays_del_<c:out value="${i.index}"/>.submit();')"><img src="/${ROOT}/resources/pic/panier/corbeille.gif" border="0"/></a>
					</div>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<div style="text-align: center; width: 100%;">
		<br />
		<br />
		<form style="display:inline; width: 100%;" name="pays_add" id="pays_add" method="post" action="./modifPays.htm">
			<input type="hidden" name="action" value="1"/>
			<a onclick="document.getElementById('pays_add').submit();" class="bouton" href="#" title="Créer un nouveau pays"><span><span>Créer un nouveau pays</span></span></a>
		</form>
	</div>
</div>
