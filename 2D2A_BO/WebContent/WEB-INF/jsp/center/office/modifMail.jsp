<%@ include file="../../head/include.jsp" %>

<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->
	<p class="b brown fs13 mt5">Modification d'un mail</p>
	<!-- endTitleFiche -->
</div>
<div id="separationEnteteFiche"></div>
<!-- endEnteteFiche -->

<div id="ficheCorps">

	<form name="modifmail" id="modifmail" method="post" action="">
				
		<spring:bind path="mail.maiId">
			<input type="hidden" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>">
		</spring:bind>
		
		<spring:bind path="mail.action">
			<input type="hidden" name="<c:out value="${status.expression}"/>" value="1">
		</spring:bind>
		
		<table class="formulaire">
			<col class="col1"/>
			<col class="col2"/>
			
			<tr>
				<spring:bind path="mail.nom">
					<td class="left">Nom du mail</td>
					<td class="right"><input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="50" maxlength="100"/></td>
				</spring:bind>
			</tr>

			<tr>
				<spring:bind path="mail.sujet">
					<td class="left">Objet du mail</td>
					<td class="right"><input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="50" maxlength="255"/></td>
				</spring:bind>
			</tr>

			<tr>	
				<spring:bind path="mail.contenu">
					<td class="left">Contenu du mail</td>
					<td class="right"><textarea rows="15" cols="100" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>"><c:out value="${status.value}"/></textarea></td>
				</spring:bind>
			</tr>

			<tr>	
				<spring:bind path="mail.expediteur">
					<td class="left">Expéditeur du mail</td>
					<td class="right"><input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="50" maxlength="255"/></td>
				</spring:bind>
			</tr>

			<tr>	
				<spring:bind path="mail.reponse">
					<td class="left">Adresse de réponse au mail</td>
					<td class="right"><input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="50" maxlength="255"/></td>
				</spring:bind>
			</tr>

			<tr>	
				<spring:bind path="mail.activation">
					<td class="left">Activation du mail</td>
					<td class="right"><input type="checkbox" <c:if test="${mail.activation == true}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>"/></td>
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
							<a onclick="document.getElementById('modifmail').submit();" class="bouton" href="#" title="Valider"><span><span>Valider</span></span></a>
						<br/>
						<br/>
						<br/>
					</td>
				</tr>
			</table>
	</form>
</div>