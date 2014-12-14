<%@ include file="../../head/include.jsp" %>

<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->
	<p class="b brown fs13 mt5">Gestion des Pages Libres</p>
	<!-- endTitleFiche -->
</div>
<div id="separationEnteteFiche"></div>
<!-- endEnteteFiche -->

<div id="ficheCorps">

<table class="formulaire">

	<col class="col1"/>
	<col class="col2"/>
	<col class="col4_Back"/>
	
	<tr>
		<td class="left_Back"><b>Identifiant</b>.</td>
		<td class="right_Back"><b>Nom</b></td>
		<td><b>Actions</b></td>		
	</tr>
	<tr>
		<td class="left_Back">&nbsp;</td>
		<td class="right_Back">&nbsp;</td>
		<td>&nbsp;</td>		
	</tr>
	
	<c:forEach var="template" items="${listeTemplates}">
		<tr>
			<td class="left_Back"><c:out value="${template.id}"/></td>
			<td class="right_Back"><c:out value="${template.nom}"/></td>
			<td>
				<form name="modifFreeTemplate_<c:out value="${template.id}"/>" action="./modifFreeTemplate.htm" method="POST">
					<input type="hidden" name="id" value="<c:out value="${template.id}"/>"/>
					<input type="hidden" name="action" value="0"/>
					<a href="#" onclick="document.modifFreeTemplate_<c:out value="${template.id}"/>.submit();"><img src="/${ROOT}/resources/pic/panier/edit.gif" border="0"/></a>
				</form>
			</td>			
		</tr>
	</c:forEach>
</table>

</div>