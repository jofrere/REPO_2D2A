<%@ include file="../../head/include.jsp" %>

<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->
	<p class="b brown fs13 mt5">
		<c:choose>
			<c:when test="${pays.action == 5}">Modification d'un profession</c:when>
			<c:when test="${profession.action == 4}">Création d'un profession</c:when>
		</c:choose>
	</p>
	<!-- endTitleFiche -->
</div>
<div id="separationEnteteFiche"></div>
<!-- endEnteteFiche -->

<div id="ficheCorps">

	<form name="modifProfession" id="modifProfession" method="post" action="">
			
			
		<spring:bind path="profession.profId">
			<input type="hidden" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>">
		</spring:bind>
		
		<spring:bind path="profession.action">
			<input type="hidden" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>">
		</spring:bind>
			
		<table class="formulaire">
			<col class="col1"/>
			<col class="col2"/>
			
			<tr>
				<spring:bind path="profession.titre_FR">
					<td class="left">Nom en Français</td>
					<td class="right"><input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/></td>
					</p>
				</spring:bind>
			</tr>
			
			<tr>
				<spring:bind path="profession.titre_EN">
					<td class="left">Nom en Anglais</td>
					<td class="right"><input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/></td>
					</p>
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
						<a onclick="document.getElementById('modifProfession').submit();" class="bouton" href="#" title="Valider"><span><span>Valider</span></span></a>
					<br/>
					<br/>
					<br/>
				</td>
			</tr>
		</table>
		</fieldset>
	</form>
</div>
