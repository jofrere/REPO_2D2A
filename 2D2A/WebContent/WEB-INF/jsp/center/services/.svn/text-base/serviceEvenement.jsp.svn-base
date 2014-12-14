<%@ include file="../../head/include.jsp" %>

<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->
	<p class="b brown fs13 mt5"><spring:message code="service.evenement.title" /></p>
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
				<spring:bind path="service.objetDemandeStr">
					<td class="left title">
						<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="service.evenement.exp" htmlEscape="false"/><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right">
						<input class="radio" type="radio" <c:if test="${service.objetDemande == 1}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<spring:message code="service.general.demande1" />" onchange="document.getElementById('objetDemande').value=1;"/><spring:message code="service.general.demande1" /><br />
						<input class="radio" type="radio" <c:if test="${service.objetDemande == 2}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<spring:message code="service.general.demande2" />" onchange="document.getElementById('objetDemande').value=2;"/><spring:message code="service.general.demande2" /><br />
						<input class="radio" type="radio" <c:if test="${service.objetDemande == 3}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<spring:message code="service.general.demande3" />" onchange="document.getElementById('objetDemande').value=3;"/><spring:message code="service.general.demande3" /><br />
						<input class="radio" type="radio" <c:if test="${service.objetDemande == 4}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<spring:message code="service.general.demande4" />" onchange="document.getElementById('objetDemande').value=4;"/><spring:message code="service.general.demande4" /><br />
						<input class="radio" type="radio" <c:if test="${service.objetDemande == 5}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<spring:message code="service.general.demande5" />" onchange="document.getElementById('objetDemande').value=5;"/><spring:message code="service.general.demande5" /><br />
						<input class="radio" type="radio" <c:if test="${service.objetDemande == 6}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<spring:message code="service.general.demande6" />" onchange="document.getElementById('objetDemande').value=6;"/><spring:message code="service.general.demande6" /><br />
						<input class="radio" type="radio" <c:if test="${service.objetDemande == 7}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<spring:message code="service.general.demande7" />" onchange="document.getElementById('objetDemande').value=7;"/><spring:message code="service.general.demande7" /><br />
						<span class="pr10"></span>
					</td>
				</spring:bind>
				<spring:bind path="service.objetDemande">
					<input type="hidden" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
				</spring:bind>
			</tr>
			
			<tr>
				<spring:bind path="service.titre">
					<td class="left">
    					<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="service.evenement.titre" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right"><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/></td>
				</spring:bind>	
			</tr>
			
			<tr>
				<spring:bind path="service.designationInfo">
					<td class="left">
    					<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="service.evenement.designationInfo" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right"><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/></td>
				</spring:bind>	
			</tr>
			
			<tr>
				<spring:bind path="service.description">
					<td class="left">
    					<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="service.evenement.description" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right"><textarea class="field" rows="5" cols="100" name="<c:out value="${status.expression}"/>"/><c:out value="${status.value}"/></textarea></td>
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
				<spring:bind path="service.prix">
					<td class="left">
					   	<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="service.evenement.prix" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right">
						<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
					</td>
				</spring:bind>
			</tr>
			
			
			<tr>
				<td class="left title"><spring:message code="service.evenement.horaireTitle" /></td>
				<td class="right"></td>
			</tr>
			
			<tr>
				<spring:bind path="service.dateDebut">
					<td class="left">
    					<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="service.evenement.dateDebut" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right"><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/></td>
				</spring:bind>	
			</tr>
			
			<tr>
				<spring:bind path="service.dateFin">
					<td class="left">
    					<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="service.evenement.dateFin" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right"><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/></td>
				</spring:bind>	
			</tr>
			
			<tr>
				<spring:bind path="service.horaire">
					<td class="left">
    					<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="service.evenement.horaire" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right"><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/></td>
				</spring:bind>	
			</tr>
			
			<!-- Fin Objet -->
			
			<!-- ADRESSES -->
			
			
			<tr>
				<spring:bind path="service.ville">
					<td class="left">
					   	<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="inscription.coordonnees.ville" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right">
						<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
					</td>
				</spring:bind>
			</tr>
			
			<tr>
				<spring:bind path="service.departement">
					<td class="left">
					   	<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="service.evenement.departement" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right">
						<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
					</td>
				</spring:bind>
			</tr>
			
			<tr>
				 <spring:bind path="service.codePostal">
					<td class="left">
	    				<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="inscription.coordonnees.codePostal" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right">
						<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
					</td>
				 </spring:bind>
			</tr>
			
			<tr>
				<spring:bind path="service.adresse">
					<td class="left">
    					<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="inscription.coordonnees.adresse" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right"><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/></td>
				</spring:bind>	
			</tr>
			
			<tr>
				<spring:bind path="service.lieu">
					<td class="left">
					   	<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="service.evenement.lieu" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right">
						<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
					</td>
				</spring:bind>
			</tr>
			
			<tr>
				<spring:bind path="service.tel">
					<td class="left">
					   	<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="evt.tel" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right">
						<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
					</td>
				</spring:bind>
			</tr>
			
			<tr>
				<spring:bind path="service.fax">
					<td class="left">
					   	<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="evt.fax" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right">
						<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
					</td>
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
			<!-- END ADRESSES -->
						
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
