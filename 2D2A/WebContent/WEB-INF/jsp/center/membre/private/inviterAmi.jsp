<%@ include file="../../../head/include.jsp" %>

<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->
	<p class="b brown fs13 mt5"><spring:message code="inviterAmi.title" /></p>
	<!-- endTitleFiche -->
	<p class="mt5 brown">
    	<spring:message code="inviterAmi.exp" htmlEscape="false"/>
	</p>
</div>
<div id="separationEnteteFiche"></div>
<!-- endEnteteFiche -->

<!-- startCorpsFiche -->
<div id="ficheCorps">
	<form name="inviterAmiForm" method="post" action="">
		<spring:bind path="ami.*">
		    <c:if test="${status.error}"><br/><span style="color: red;"><ul></c:if>
			    <table class="formulaire">
				    <col class="col1"/>
					<col class="col2"/>					
					<tr>
						<td class="left noborder"></td>
						<td class="right pt20">
							<c:forEach items="${status.errorMessages}" var="error">
								<li><c:out value="${error}"/></li>
							</c:forEach>
						</td>
					</tr>
				</table>
			<c:if test="${status.error}"></ul></span><br /></c:if>
		</spring:bind>
		<table class="formulaire">
			<col class="col1"/>
			<col class="col2"/>
			<tr>
				<td class="left title"><spring:message code="inviterAmi.mailAmi"/></td>
				<td class="right">
					<input class="field" type="text" name="email" />
					<span class="pr10"></span>
				</td>
			</tr>
			<tr>
				<td class="left title"><spring:message code="inviterAmi.mailMessage"/></td>
				<td class="right">
					<textarea class="field" name="message" cols="30" rows="8"></textarea>
					<span class="pr10"></span>
				</td>
			</tr>
			<tr>
				<td class="left noborder"></td>
				<td class="right pt20">
					<a class="bouton" href="#" onclick="document.inviterAmiForm.submit();" title="Valider"><span><span>Valider</span></span></a>
				</td>
			</tr>
		</table>
	</form>

	<c:if test="${not empty confirmation}">
		<br /><p class="b brown fs13 mt5"><c:out value="${confirmation}"/></p>
	</c:if>

</div>