<%@ include file="../../head/include.jsp" %>


<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->
	<p class="b brown fs13 mt5">Modification de l'accueil</p>
	<!-- endTitleFiche -->
</div>
<div id="separationEnteteFiche"></div>
<!-- endEnteteFiche -->

<div id="ficheCorps">
	
	<form name="accueilGestion" id="accueilGestion" method="post" action="" enctype="multipart/form-data">
	
		<spring:bind path="accueils.lang">
			<input type="hidden" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>">
		</spring:bind>
	
		<c:forEach items="${accueils.accueils}" varStatus="i">
			<spring:bind path="accueils.accueils[${i.index}].accId">
				<input type="hidden" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>">
			</spring:bind>
			
			<spring:bind path="accueils.accueils[${i.index}].lang">
				<input type="hidden" name="<c:out value="${status.expression}"/>" value="<c:out value="${accueils.lang}"/>">
			</spring:bind>
			
			<table class="formulaire">
				<col class="col1"/>
				<col class="col2"/>
				
				<tr>
					<spring:bind path="accueils.accueils[${i.index}].logoAccueil">
						<td class="left title">Accueil <c:out value="${status.value}"/></td>
						<td class="right"><input type="hidden" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"></td>
					</spring:bind>
				</tr>
	
				<tr>
					<td class="left">Titre</td>
					<td class="right">
						<spring:bind path="accueils.accueils[${i.index}].titreAccueil">
							<input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
						</spring:bind>
					</td>
				</tr>
				<tr>
					<td class="left">Texte</td>
					<td class="right">
						<spring:bind path="accueils.accueils[${i.index}].texteAccueil">
							<textarea class="texte" rows="1" cols="70" id="<c:out value="${status.expression}"/>"  name="<c:out value="${status.expression}"/>"><c:out value="${status.value}"/></textarea>
						</spring:bind>
					</td>
				</tr>
				<tr>
					<td class="left">Image</td>
					<td class="right">
						<spring:bind path="accueils.accueils[${i.index}].imageAccueilFile">
							<input type="file" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="47" maxlength="100"/>
						</spring:bind>
					</td>
				</tr>
				<tr>
					<td class="left">Image actuelle</td>
					<td class="right">
						<div class="blockAccueil">
							<spring:bind path="accueils.accueils[${i.index}].imageAccueil">
								<img id="<c:out value="${status.expression}"/>" src="/${ROOT}/<c:out value="${status.value}"/>" border="0"/>
								<input type="hidden" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
							</spring:bind>
						</div>
					</td>
				</tr>
				<tr>
					<td class="left noborder"></td>
					<td class="right pt20"></td>
				</tr>
				<tr>
					<td class="left noborder"></td>
					<td class="right pt20"></td>
				</tr>
			</table>
		</c:forEach>
			<table class="formulaire">
				<tr>
					<td class="left noborder"></td>
					<td class="right pt20">
						<span class="pl20 pr20"></span>
						<span class="pl20 pr20"></span>
						<span class="pl20 pr20"></span>
						<span class="pl20 pr20"></span>
							<a onclick="document.getElementById('accueilGestion').submit();" class="bouton" href="#" title="Valider"><span><span>Valider</span></span></a>
						<br/>
						<br/>
						<br/>
					</td>
				</tr>
			</table>
	</form>
</div>