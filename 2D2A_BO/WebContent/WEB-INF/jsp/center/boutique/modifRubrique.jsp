<%@ include file="../../head/include.jsp" %>

<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->
	<p class="b brown fs13 mt5">
		<c:choose>
			<c:when test="${rubrique.action == 5}">Modification d'une rubrique</c:when>
			<c:when test="${rubrique.action == 4}">Création d'une rubrique</c:when>
		</c:choose>
	</p>
	<!-- endTitleFiche -->
</div>
<div id="separationEnteteFiche"></div>
<!-- endEnteteFiche -->

<div id="ficheCorps">
	<form name="modifrubrique" id="modifrubrique" method="post" action="" enctype="multipart/form-data">
		<spring:bind path="rubrique.rubId">
			<input type="hidden" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>">
		</spring:bind>
		
		<spring:bind path="rubrique.rub_rubId">
			<input type="hidden" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>">
		</spring:bind>
		
		<spring:bind path="rubrique.action">
			<input type="hidden" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>">
		</spring:bind>
		
		<table class="formulaire">
			<col class="col1"/>
			<col class="col2"/>
			
			<tr>
			<spring:bind path="rubrique.nom">
				<td class="left">Nom de la rubrique</td>
				<td class="right"><input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/></td>
			</spring:bind>
			</tr>
	
				<tr>
			<spring:bind path="rubrique.friendlyName">
				<td class="left">Nom Friendly de la rubrique</td>
				<td class="right"><input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/></td>
			</spring:bind>
			</tr>
	
				<tr>
			<spring:bind path="rubrique.description">
				<td class="left">Description</td>
				<td class="right"><textarea rows="2" cols="70" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>"><c:out value="${status.value}"/></textarea></td>
			</spring:bind>
			</tr>
	
				<tr>
			<spring:bind path="rubrique.keyword">
				<td class="left">Keyword</td>
				<td class="right"><textarea rows="2" cols="70" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>"><c:out value="${status.value}"/></textarea></td>
			</spring:bind>
			</tr>
	
			<%--
			<p>
				<spring:bind path="rubrique.picto">
					<label class="label" for="<c:out value="${status.expression}"/>">Picto actuel</label>
					<img style="float: left;" id="<c:out value="${status.expression}"/>" src="/${ROOT}/<c:out value="${status.value}"/>"/>
					<input style="float: left;" type="hidden" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
				</spring:bind>
				<spring:bind path="rubrique.pictoFile">
					<label class="label" for="<c:out value="${status.expression}"/>">Modifier : </label>
					<input style="float: left;" type="file" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" size="30" maxlength="100"/>
				</spring:bind>
			</p>
			
			<p>
				<spring:bind path="rubrique.css">
					<label class="label" for="<c:out value="${status.expression}"/>">Css actuelle</label>
					<input style="float: left;" type="text" value="<c:out value="${status.value}"/>" readonly="readonly" size="30"/>
					<input style="float: left;" type="hidden" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
				</spring:bind>
				<spring:bind path="rubrique.cssFile">
					<label class="label" for="<c:out value="${status.expression}"/>">Modifier : </label>
					<input style="float: left;" type="file" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" size="30" maxlength="100"/>
				</spring:bind>
			</p>
			--%>
			
		<tr>
			<spring:bind path="rubrique.visible">
				<td class="left">Visible sur le site</td>
				<td class="right"><input style="float: left;" type="checkbox" <c:if test="${status.value == 1}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="1"/></td>
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
						<a onclick="document.getElementById('modifrubrique').submit();" class="bouton" href="#" title="Valider"><span><span>Valider</span></span></a>
					<br/>
					<br/>
					<br/>
				</td>
			</tr>
		</table>
	</form>
</div>