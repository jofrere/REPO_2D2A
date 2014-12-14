<%@ include file="../../head/include.jsp" %>

<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->
	<p class="b brown fs13 mt5">Gestion des Coloris</p>
	<!-- endTitleFiche -->
</div>
<div id="separationEnteteFiche"></div>
<!-- endEnteteFiche -->

<div id="ficheCorps">	
	<table class="formulaire">
		<col class="col1_Back"/>
		<col class="col1_Back"/>
		<col class="col1_Back"/>
		<col class="col1_Back"/>
		<tr>
			<th>Nom français</th>
			<th>Nom anglais</th>
			<th>Picto</th>
			<th>&nbsp;</th>
		</tr>
		<tr><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td>&nbsp;</td></tr>
		<c:forEach var="coloris" items="${listeColoris}" varStatus="i">
			<tr>				
				<td class="back"><c:out value="${coloris.nom_FR}"/></td>
				<td class="back"><c:out value="${coloris.nom_EN}"/></td>
				<td class="back"><img id="picto" src="/${ROOT}/<c:out value="${coloris.picto}"/>" width="50" height="15" border="0"/></td>				
				<td>
					<form style="display:inline;" name="coloris_modif_<c:out value="${i.index}"/>" method="post" action="./modifColoris.htm">
						<input type="hidden" name="colId" value="<c:out value="${coloris.colId}"/>">
						<input type="hidden" name="nom_FR" value="<c:out value="${coloris.nom_FR}"/>">
						<input type="hidden" name="nom_EN" value="<c:out value="${coloris.nom_EN}"/>">
						<input type="hidden" name="picto" value="<c:out value="${coloris.picto}"/>">
						<input type="hidden" name="action" value="2"/>
					</form>
						
					<form style="display:inline;" name="coloris_del_<c:out value="${i.index}"/>" method="post" action="./modifColoris.htm">
						<input type="hidden" name="colId" value="<c:out value="${coloris.colId}"/>">
						<input type="hidden" name="action" value="3"/>					
					</form>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#" onclick="document.coloris_modif_<c:out value="${i.index}"/>.submit();"><img src="/${ROOT}/resources/pic/panier/edit.gif" border="0"/></a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#" onclick="if (confirm('Etes-vous certain de vouloir supprimer ce coloris ?')) eval('document.coloris_del_<c:out value="${i.index}"/>.submit();')"><img src="/${ROOT}/resources/pic/panier/corbeille.gif" border="0"/></a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<div style="text-align: center; width: 100%;">
		<br />
		<br :>
		<form style="display:inline; width: 100%;" name="coloris_add" id="coloris_add" method="post" action="./modifColoris.htm">
			<input type="hidden" name="action" value="1"/>
			<a onclick="document.getElementById('coloris_add').submit();" class="bouton" href="#" title="Créer un nouveau coloris"><span><span>Créer un nouveau coloris</span></span></a>
		</form>
	</div>
</div>
