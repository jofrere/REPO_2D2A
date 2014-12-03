<%@ include file="../../head/include.jsp" %>

<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->
	<p class="b brown fs13 mt5"><spring:message code="service.ouvrage.title" /></p>
	<!-- endTitleFiche -->
</div>
<div id="separationEnteteFiche"></div>
<!-- endEnteteFiche -->

<!-- startCorpsFiche -->
<div id="ficheCorps">
	<form name="serviceGeneral" method="post" action="" id="serviceGeneral" enctype="multipart/form-data">
		<spring:bind path="service.*">
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
		
		<table class="formulaire">
			<col class="col1"/>
			<col class="col2"/>
			
			<!-- Objet requete -->
			
			<tr>
				<spring:bind path="service.titre">
					<td class="left title">
    					<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="service.ouvrage.titre" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right"><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/></td>
				</spring:bind>	
			</tr>
			
			<tr>
				<spring:bind path="service.auteur">
					<td class="left">
    					<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="service.ouvrage.auteur" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right"><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/></td>
				</spring:bind>	
			</tr>
			
			<tr>
				<spring:bind path="service.theme">
					<td class="left">
    					<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="service.evenement.theme" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right"><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/></td>
				</spring:bind>	
			</tr>
			
			<tr>
				<spring:bind path="service.sommaire">
					<td class="left">
    					<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="service.ouvrage.sommaire" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right"><textarea class="field" rows="5" cols="100" name="<c:out value="${status.expression}"/>"/><c:out value="${status.value}"/></textarea></td>
				</spring:bind>	
			</tr>
			
			<tr>
				<spring:bind path="service.information">
					<td class="left">
    					<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="service.ouvrage.information" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right"><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/></td>
				</spring:bind>	
			</tr>

			<tr>
				<spring:bind path="service.annee">
					<td class="left">
    					<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="service.ouvrage.annee" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right"><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/></td>
				</spring:bind>	
			</tr>
			
			<tr>
				<spring:bind path="service.langue">
					<td class="left">
    					<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="service.ouvrage.langue" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right"><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/></td>
				</spring:bind>	
			</tr>
			
			<tr>
				<spring:bind path="service.format">
					<td class="left">
    					<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="service.ouvrage.format" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right"><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/></td>
				</spring:bind>	
			</tr>
			
			<tr>
				<spring:bind path="service.prix">
					<td class="left">
					   	<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="service.evenement.prix" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right">
						<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
					</td>
				</spring:bind>
			</tr>
			<!-- Fin Objet -->
						
			<!-- EMAIL -->
			<tr>
				<td class="left title"><spring:message code="inscription.identifiant" /></td>
				<td class="right"></td>
			</tr>
			
			<tr>
				<spring:bind path="service.email">
					<td class="left">
					   	<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.mail" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right">
						<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:choose><c:when test="${not empty sessionScope.AUTHENTICATED_MEMBER.login}"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.login}"/></c:when><c:otherwise><c:out value="${status.value}"/></c:otherwise></c:choose>" />
					</td>
				</spring:bind>
			</tr>
			<!-- END EMAIL -->
			
			<tr>
				<td class="left">
					<spring:message code="service.general.fichier" htmlEscape="false"/>
				</td>
				<td class="right">			
					<div id="fichiers">
	           			<br/>
		                <!-- CE SPAN RECOIT LES DIFFERENTS INPUTS CREES PUIS CACHES UNE FOIS UTILISES -->
		                <span id="input"></span> 
		                <br/>
            		</div>
				</td>
			</tr>
			
			<jsp:include page="./serviceGenerique.jsp" />
				
			<tr>
					<td class="left noborder"></td>
					<td class="right pt20">
						
						<a class="bouton" href="/${ROOT}/accueil.htm" title="<spring:message code="global.retourAccueil"/>"><span><span><spring:message code="global.retourAccueil"/></span></span></a>
						<span class="pl20 pr20"></span>
						<span class="pl20 pr20"></span>
						<span class="pl20 pr20"></span>
						<span class="pl20 pr20"></span>
							<a onclick="document.getElementById('serviceGeneral').submit();" class="bouton" href="#" title="<spring:message code="service.valider"/>"><span><span><spring:message code="service.valider"/></span></span></a>
						<br/>
						<br/>
						<br/>
					</td>
				</tr>
			
		</table>
	</form>
</div>
<!-- endCorpsFiche -->


<script>
	var pathDeleteBtn = '/${ROOT}/resources/pic/panier/corbeille.gif'; 
</script>
