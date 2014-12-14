<%@ include file="../../head/include.jsp" %>

<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->
	<p class="b brown fs13 mt5">Gestion des professions</p>
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
		<c:forEach var="profession" items="${listeProfessions}" varStatus="i">
			<tr>
				<td class="left_Back">Nom en Français</td>
				<td class="right_Back"><c:out value="${profession.titre_FR}"/></td>
				<td class="left_Back">Nom en Anglais</td>
				<td class="right_Back"><c:out value="${profession.titre_EN}"/></td>
				<td>
					<form style="display:inline;" name="profession_modif_<c:out value="${i.index}"/>" method="post" action="./modifProfession.htm">
						<input type="hidden" name="profId" value="<c:out value="${profession.profId}"/>">
						<input type="hidden" name="titre_FR" value="<c:out value="${profession.titre_FR}"/>">
						<input type="hidden" name="titre_EN" value="<c:out value="${profession.titre_EN}"/>">
						<input type="hidden" name="action" value="2"/>						
					</form>
		
					<form style="display:inline;" name="profession_del_<c:out value="${i.index}"/>" method="post" action="./modifProfession.htm">
						<input type="hidden" name="profId" value="<c:out value="${profession.profId}"/>">
						<input type="hidden" name="action" value="3"/>						
					</form>
					<div style="display:block; width= 50%; text-align: right;">
						<a href="#" onclick="document.profession_modif_<c:out value="${i.index}"/>.submit();"><img src="/${ROOT}/resources/pic/panier/edit.gif" border="0"/></a>				
						<a href="#" onclick="if (confirm('Etes-vous certain de vouloir supprimer cette profession ?')) eval('document.profession_del_<c:out value="${i.index}"/>.submit();')"><img src="/${ROOT}/resources/pic/panier/corbeille.gif" border="0"/></a>
					</div>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<div style="text-align: center; width: 100%;">
		<br />
		<br :>
		<form style="display:inline; width: 100%;" name="profession_add" id="profession_add" method="post" action="./modifProfession.htm">
			<input type="hidden" name="action" value="1"/>
			<a onclick="document.getElementById('profession_add').submit();" class="bouton" href="#" title="Créer une nouvelle profession"><span><span>Créer une nouvelle profession</span></span></a>
		</form>
	</div>
</div>
