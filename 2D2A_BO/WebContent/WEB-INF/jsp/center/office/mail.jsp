<%@ include file="../../head/include.jsp" %>

<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->
	<p class="b brown fs13 mt5">Gestion des Mails</p>
	<!-- endTitleFiche -->
</div>
<div id="separationEnteteFiche"></div>
<!-- endEnteteFiche -->

<div id="ficheCorps">

<table class="formulaire">

	<col class="col1"/>
	<col class="col2"/>
	<col class="col4_Back"/>
	<col class="col4_Back"/>
	
	<tr>
		<td class="left_Back"><b>Identifiant</b></th>
		<td class="right_Back"><b>Nom</b></th>
		<td><b>Activer</b></td>
		<td><b>Actions</b></td>		
	</tr>
	<tr>
		<td class="left_Back">&nbsp;</th>
		<td class="right_Back">&nbsp;</th>
		<td>&nbsp;</td>
		<td>&nbsp;</td>		
	</tr>
	
	<c:forEach var="mail" items="${listeMails}">
		<tr>
			<td class="left_Back"><c:out value="${mail.maiId}"/></td>
			<td class="right_Back"><c:out value="${mail.nom}"/></td>
			<td>
				<c:if test="${mail.activation == false}"><b>NON</b></c:if>
				<c:if test="${mail.activation == true}"><i>OUI</i></c:if>
			</td>
				
			<td>
				<form name="modifMail_<c:out value="${mail.maiId}"/>" action="./modifMail.htm" method="POST">
					<input type="hidden" name="maiId" value="<c:out value="${mail.maiId}"/>"/>
					<input type="hidden" name="action" value="0"/>
					<a href="#" onclick="document.modifMail_<c:out value="${mail.maiId}"/>.submit();"><img src="/${ROOT}/resources/pic/panier/edit.gif" border="0"/></a>
				</form>
			</td>			
		</tr>
	</c:forEach>
</table>

</div>