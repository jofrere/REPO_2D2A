<%@ include file="../../head/include.jsp" %>

<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->
	<p class="b brown fs13 mt5"><spring:message code="service.archives.title" /></p>
	<!-- endTitleFiche -->
</div>
<div id="separationEnteteFiche"></div>
<!-- endEnteteFiche -->

<!-- startCorpsFiche -->
<div id="ficheCorps">
	<form name="serviceArchives" method="post" action="" id="serviceArchives" enctype="multipart/form-data">
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
				<td class="left title">
    				<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="service.archives.createur" /><c:if test="${status.error}"></span></c:if>
				</td>
				<td class="right"></td>	
			</tr>
			
			<tr>
				<spring:bind path="service.prenom">
					<td class="left">
    					<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="service.archives.prenom" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right"><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/></td>
				</spring:bind>	
			</tr>
			
			<tr>
				<spring:bind path="service.nom">
					<td class="left">
    					<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="service.archives.nom" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right"><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/></td>
				</spring:bind>	
			</tr>
			
			<tr>
				<spring:bind path="service.lieuNaissance">
					<td class="left">
    					<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="service.archives.lieuNaissance" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right"><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/></td>
				</spring:bind>	
			</tr>
			
			<tr>
				<spring:bind path="service.dateNaissance">
					<td class="left">
    					<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="service.archives.dateNaissance" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right"><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/></td>
				</spring:bind>	
			</tr>
			
			<tr>
				<spring:bind path="service.dateDeces">
					<td class="left">
    					<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="service.archives.dateDeces" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right"><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/></td>
				</spring:bind>	
			</tr>
			
			
			<!-- Objet requete -->
			<tr>
				<spring:bind path="service.objetDemande">
					<td class="left title">
						<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="service.archives.creation" htmlEscape="false"/><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right">
						<input class="checkbox" type="checkbox" <c:forEach var="objet" items="${status.value}"><c:if test="${objet == '1'}">checked="checked"</c:if></c:forEach> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="1"/><spring:message code="service.archives.demande1" /><br />
						<input class="checkbox" type="checkbox" <c:forEach var="objet" items="${objetDemande}"><c:if test="${objet == '2'}">checked="checked"</c:if></c:forEach> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="2"/><spring:message code="service.archives.demande2" /><br />
						<input class="checkbox" type="checkbox" <c:forEach var="objet" items="${objetDemande}"><c:if test="${objet == '3'}">checked="checked"</c:if></c:forEach> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="3"/><spring:message code="service.archives.demande3" /><br />
						<input class="checkbox" type="checkbox" <c:forEach var="objet" items="${objetDemande}"><c:if test="${objet == '4'}">checked="checked"</c:if></c:forEach> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="4"/><spring:message code="service.archives.demande4" /><br />
						<input class="checkbox" type="checkbox" <c:forEach var="objet" items="${objetDemande}"><c:if test="${objet == '8'}">checked="checked"</c:if></c:forEach> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="8"/><spring:message code="service.general.demande8" />
						<span class="pr10"></span>
					</td>
				</spring:bind>
			</tr>
			
			<tr>
				<td class="left">&nbsp;</td>
				<td class="right">
					<spring:bind path="service.autreDemande">
						<input type="text" class="field" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
					</spring:bind>
				</td>
			</tr>
			
			<tr>
				<spring:bind path="service.biographie">
					<td class="left">
    					<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="service.archives.biographie" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right"><textarea class="field" rows="5" cols="100" name="<c:out value="${status.expression}"/>"/><c:out value="${status.value}"/></textarea></td>
				</spring:bind>
			</tr>
			
			<tr>
				<spring:bind path="service.information">
					<td class="left">
    					<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="service.archives.information" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right"><textarea class="field" rows="5" cols="100" name="<c:out value="${status.expression}"/>"/><c:out value="${status.value}"/></textarea></td>
				</spring:bind>	
			</tr>

			<tr>
				<spring:bind path="service.collaboration">
					<td class="left">
    					<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="service.archives.collaboration" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right"><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/></td>
				</spring:bind>	
			</tr>
			
			<tr>
				<spring:bind path="service.bibliographie">
					<td class="left">
    					<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="service.archives.bibliographie" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right"><textarea class="field" rows="5" cols="100" name="<c:out value="${status.expression}"/>"/><c:out value="${status.value}"/></textarea></td>
				</spring:bind>	
			</tr>
			
			<tr>
				<spring:bind path="service.webSite">
					<td class="left">
					   	<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="evt.siteWeb" /><c:if test="${status.error}"></span></c:if>
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
							<a onclick="document.getElementById('serviceArchives').submit();" class="bouton" href="#" title="<spring:message code="service.valider"/>"><span><span><spring:message code="service.valider"/></span></span></a>
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
