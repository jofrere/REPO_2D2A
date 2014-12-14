<%@ include file="../../head/include.jsp" %>


<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->	
	<p class="b brown fs13 mt5">
		<spring:message code="monCompte.title" htmlEscape="false"/>
	</p>
	<!-- endTitleFiche -->
	<p class="mt5 brown">
		<spring:message code="monCompte.exp" htmlEscape="false"/>
	</p>	
</div>
<div id="separationEnteteFiche"></div>
<!-- endEnteteFiche -->


<!-- startCorpsFiche -->
<div id="ficheCorps">
    <form name="monCompteForm" method="post" action="">
    
    <spring:bind path="membre.*">
	    <c:if test="${status.error}"><br/><span id="obligatoire"><ul></c:if>
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
	
	
	<c:if test="${not empty motDePasseSend}">
		<table class="formulaire">
		    <col class="col1"/>
		    <col class="col2"/>
		    <tr>
			    <td class="left noborder"></td>
				<td class="right pt20">
					<font  color="red"><spring:message code="authentification.motDePasseSend"/></font>
		    	</td>
		    </tr>
	    </table>
	    <br />
	</c:if>
        
	<table class="formulaire">
	    <col class="col1"/>
		<col class="col2"/>
			
    	<spring:bind path="membre.login">
		   <tr>
				<td class="left">
		    		<c:if test="${status.error}"><span id="obligatoire"></c:if>*&nbsp;<spring:message code="inscription.mail" /><c:if test="${status.error}"></span></c:if>
		    	</td>
		    	<td class="right">
			    	<input class="field" type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" />
				</td>
		    </tr>
	    </spring:bind>
	    	
	    <spring:bind path="membre.password">
		     <tr>
				<td class="left">
			    	<c:if test="${status.error}"><span id="obligatoire"></c:if>*&nbsp;<spring:message code="inscription.pwd" /><c:if test="${status.error}"></span></c:if>
				</td>
				<td class="right">
			    	<input class="field" type="password" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" />
				</td>
		    </tr>
		    <tr>
				<td class="left noborder"></td>
				<td class="right pt20">
					<spring:message code="monCompte.motDePasse" htmlEscape="false"/>
				</td>
			</tr>
	    </spring:bind>
	      	<tr>
				<td class="left noborder"></td>
				<td class="right pt20">
				    <input type="hidden" name="action" id="compte_action" value="" />
				    <a class="bouton" href="#" onclick="document.getElementById('compte_action').value=0;document.monCompteForm.submit();" title="Valider"><span><span>Valider</span></span></a>
				</td>
	    	</tr>
			<tr>
				<td class="left noborder"></td>
				<td class="right pt20">
					<a class="bouton" href="#" onclick="document.getElementById('compte_action').value=1;document.monCompteForm.submit();" title="Mot de passe oublié"><span><span>Mot de passe oublié</span></span></a>
	    		</td>
	    	</tr>
	    	
		    <tr>
				<td class="left noborder"></td>
				<td class="right pt20">
					<b><spring:message code="monCompte.inscription" htmlEscape="false"/></b>
					&nbsp;
					<a class="bouton"  href="/${ROOT}/devenirMembre.htm"><span><span><spring:message code="monCompte.devenirMembre"/></span></span></a>
				</td>
			</tr>
		</table>
    </form>
</div>