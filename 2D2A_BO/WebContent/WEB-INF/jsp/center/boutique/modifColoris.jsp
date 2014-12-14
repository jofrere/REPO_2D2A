<%@ include file="../../head/include.jsp" %>

<%@ include file="../../head/include.jsp" %>

<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->
	<p class="b brown fs13 mt5">
		<c:choose>
			<c:when test="${coloris.action == 5}">
				<legend>Modification d'un coloris</legend>
			</c:when>
			<c:when test="${coloris.action == 4}">
				<legend>Création d'un coloris</legend>
			</c:when>
		</c:choose>
	</p>
	<!-- endTitleFiche -->
</div>
<div id="separationEnteteFiche"></div>
<!-- endEnteteFiche -->

<div id="ficheCorps">
	<form name="modifColoris" id="modifColoris" method="post" action="" enctype="multipart/form-data">
		<spring:bind path="coloris.colId">
			<input type="hidden" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>">
		</spring:bind>
		
		<spring:bind path="coloris.action">
			<input type="hidden" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>">
		</spring:bind>
		
		<table class="formulaire">
			<col class="col1"/>
			<col class="col2"/>
			<tr>
				<spring:bind path="coloris.nom_FR">
					<td class="left title">Nom Français</td>
					<td class="right"><input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/></td>
				</spring:bind>
			</tr>
			<tr>
				<spring:bind path="coloris.nom_EN">
					<td class="left title">Nom Anglais</td>
					<td class="right"><input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/></td>
				</spring:bind>
			</tr>
			<tr>	
				<spring:bind path="coloris.pictoFile">
					<td class="left title">Picto</td>
					<td class="right"><input type="file" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="100"/></td>
				</spring:bind>
			</tr>
			
			<c:if test="${coloris.action == 5}">
				<tr>
					<spring:bind path="coloris.picto">
						<td class="left title">Picto actuel</td>
						<td class="right">
							<img id="<c:out value="${status.expression}"/>" src="/${ROOT}/<c:out value="${status.value}"/>" width="50" height="15" border="0"/>
							<input type="hidden" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
						</td>
					</spring:bind>
				</tr>
			</c:if>
		</table>
		<table class="formulaire">
			<tr>
				<td class="left noborder"></td>
				<td class="right pt20">
					<span class="pl20 pr20"></span>
					<span class="pl20 pr20"></span>
					<span class="pl20 pr20"></span>
					<span class="pl20 pr20"></span>
						<a onclick="document.getElementById('modifColoris').submit();" class="bouton" href="#" title="Valider"><span><span>Valider</span></span></a>
					<br/>
					<br/>
					<br/>
				</td>
			</tr>
		</table>
	</form>
</div>