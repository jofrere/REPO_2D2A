<%@ include file="../../head/include.jsp" %>

<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->
	<p class="b brown fs13 mt5">
		<c:choose>
			<c:when test="${specificite.action == 5}">
				<legend>Modification d'une spécificité produit</legend>
			</c:when>
			<c:when test="${specificite.action == 4}">
				<legend>Création d'une spécificité produit</legend>
			</c:when>
		</c:choose>
	</p>
	<!-- endTitleFiche -->
</div>
<div id="separationEnteteFiche"></div>
<!-- endEnteteFiche -->

<div id="ficheCorps">	
	<form name="modifSpecificite" id="modifSpecificite" method="post" action="">
		<spring:bind path="specificite.speId">
			<input type="hidden" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>">
		</spring:bind>
		
		<spring:bind path="specificite.action">
			<input type="hidden" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>">
		</spring:bind>
		
		<table class="formulaire">
			<col class="col1"/>
			<col class="col2"/>
			<tr>
				<spring:bind path="specificite.nom_FR">
					<td class="left title">Nom Français</td>
					<td class="right"><input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/></td>
				</spring:bind>
			</tr>
			<tr>
				<spring:bind path="specificite.nom_EN">
					<td class="left title">Nom Anglais</td>
					<td class="right"><input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/></td>
				</spring:bind>
			</tr>
			<tr>		
				<spring:bind path="specificite.abbr_FR">
					<td class="left title">Abbréviation Française</td>
					<td class="right"><input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="2" maxlength="2"/></td>
				</spring:bind>
			</tr>
			<tr>	
				<spring:bind path="specificite.abbr_EN">
					<td class="left title">Abbréviation Anglaise</td>
					<td class="right"><input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="2" maxlength="2"/></td>
				</spring:bind>
			</tr>
		</table>
		<table class="formulaire">
			<tr>
				<td class="left noborder"></td>
				<td class="right pt20">
					<span class="pl20 pr20"></span>
					<span class="pl20 pr20"></span>
					<span class="pl20 pr20"></span>
					<span class="pl20 pr20"></span>
						<a onclick="document.getElementById('modifSpecificite').submit();" class="bouton" href="#" title="Valider"><span><span>Valider</span></span></a>
					<br/>
					<br/>
					<br/>
				</td>
			</tr>
		</table>
	</form>
</div>