<%@ include file="../../head/include.jsp" %>

<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->
	<p class="b brown fs13 mt5"><spring:message code="service.general.title" /></p>
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
						<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="service.general.exp" htmlEscape="false"/><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right">
						<input class="radio" type="radio" <c:if test="${service.objetDemande == 1}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<spring:message code="service.general.demande1" />" onchange="document.getElementById('objetDemande').value=1;"/><spring:message code="service.general.demande1" /><br />
						<input class="radio" type="radio" <c:if test="${service.objetDemande == 2}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<spring:message code="service.general.demande2" />" onchange="document.getElementById('objetDemande').value=2;"/><spring:message code="service.general.demande2" /><br />
						<input class="radio" type="radio" <c:if test="${service.objetDemande == 3}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<spring:message code="service.general.demande3" />" onchange="document.getElementById('objetDemande').value=3;"/><spring:message code="service.general.demande3" /><br />
						<input class="radio" type="radio" <c:if test="${service.objetDemande == 4}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<spring:message code="service.general.demande4" />" onchange="document.getElementById('objetDemande').value=4;"/><spring:message code="service.general.demande4" /><br />
						<input class="radio" type="radio" <c:if test="${service.objetDemande == 5}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<spring:message code="service.general.demande5" />" onchange="document.getElementById('objetDemande').value=5;"/><spring:message code="service.general.demande5" /><br />
						<input class="radio" type="radio" <c:if test="${service.objetDemande == 6}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<spring:message code="service.general.demande6" />" onchange="document.getElementById('objetDemande').value=6;"/><spring:message code="service.general.demande6" /><br />
						<input class="radio" type="radio" <c:if test="${service.objetDemande == 7}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<spring:message code="service.general.demande7" />" onchange="document.getElementById('objetDemande').value=7;"/><spring:message code="service.general.demande7" /><br />
						<input class="radio" type="radio" <c:if test="${service.objetDemande == 8}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<spring:message code="service.general.demande8" />" onchange="document.getElementById('objetDemande').value=8;"/><spring:message code="service.general.demande8" />
						<span class="pr10"></span>
					</td>
				</spring:bind>
				<spring:bind path="service.objetDemande">
					<input type="hidden" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
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
			<!-- Fin Objet -->
			
						
			<!-- CIVILITE -->
			
			<tr>
				<td class="left title"><spring:message code="inscription.civilite" /></td>
				<td class="right"></td>
			</tr>
			
			<tr>
				<spring:bind path="service.typePersonneStr">
					<td class="left">
						<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="service.general.vousetes" htmlEscape="false"/><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right">
						<input class="radio" type="radio" <c:if test="${service.typePersonne == 1}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<spring:message code="service.general.typePersonne1" />" onchange="document.getElementById('typePersonne').value=1;"/><spring:message code="service.general.typePersonne1" />
						<input class="radio" type="radio" <c:if test="${service.typePersonne == 2}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<spring:message code="service.general.typePersonne2" />" onchange="document.getElementById('typePersonne').value=2;"/><spring:message code="service.general.typePersonne2" />
						<input class="radio" type="radio" <c:if test="${service.typePersonne == 3}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<spring:message code="service.general.typePersonne3" />" onchange="document.getElementById('typePersonne').value=3;"/><spring:message code="service.general.typePersonne3" />
						<input class="radio" type="radio" <c:if test="${service.typePersonne == 4}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<spring:message code="service.general.typePersonne4" />" onchange="document.getElementById('typePersonne').value=4;"/><spring:message code="service.general.typePersonne4" />
						<input class="radio" type="radio" <c:if test="${service.typePersonne == 5}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<spring:message code="service.general.typePersonne5" />" onchange="document.getElementById('typePersonne').value=5;"/><spring:message code="service.general.typePersonne5" />
						<input class="radio" type="radio" <c:if test="${service.typePersonne == 6}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<spring:message code="service.general.typePersonne6" />" onchange="document.getElementById('typePersonne').value=6;"/><spring:message code="service.general.typePersonne6" />
						<input class="radio" type="radio" <c:if test="${service.typePersonne == 7}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<spring:message code="service.general.typePersonne7" />" onchange="document.getElementById('typePersonne').value=7;"/><spring:message code="service.general.typePersonne7" />
						<span class="pr10"></span>
					</td>
				</spring:bind>
				<spring:bind path="service.typePersonne">
					<input type="hidden" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
				</spring:bind>
			</tr>
			
			<spring:bind path="service.civId">
				<tr>
					<td class="left">
						<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.civilite.titre" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right">						
						<c:forEach var="civ" items="${listeCivilite}">
							<input class="radio" type="radio" <c:choose><c:when test="${not empty sessionScope.AUTHENTICATED_MEMBER.civilite.civId}"><c:if test="${sessionScope.AUTHENTICATED_MEMBER.civilite.civId == civ.civId}">checked="checked"</c:if></c:when><c:otherwise><c:if test="${civ.civId == service.civId}">checked="checked"</c:if></c:otherwise></c:choose> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${civ.civId}"/>"/><c:out value="${civ.titre}"/>
							<span class="pr10"></span>
						</c:forEach>
					</td>
				</tr>
			</spring:bind>
			
		    <spring:bind path="service.prenom">
				<tr>
					<td class="left">
						<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.civilite.prenom" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right "><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:choose><c:when test="${not empty sessionScope.AUTHENTICATED_MEMBER.prenom}"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.prenom}"/></c:when><c:otherwise><c:out value="${status.value}"/></c:otherwise></c:choose>"/></td>
				</tr>
			</spring:bind>
			
			<spring:bind path="service.nom">
				<tr>
					<td class="left">
						<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.civilite.nom" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right "><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:choose><c:when test="${not empty sessionScope.AUTHENTICATED_MEMBER.nom}"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.nom}"/></c:when><c:otherwise><c:out value="${status.value}"/></c:otherwise></c:choose>"/></td>
				</tr>
			</spring:bind>
			<!-- END CIVILITE -->
			
			<!-- ADRESSES -->
			<tr>
				<spring:bind path="service.adresse">
					<td class="left">
    					<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="inscription.coordonnees.adresse" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right"><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:choose><c:when test="${not empty sessionScope.AUTHENTICATED_MEMBER.adresses[0].adresse}"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].adresse}"/></c:when><c:otherwise><c:out value="${status.value}"/></c:otherwise></c:choose>"/></td>
				</spring:bind>	
			</tr>
			
			<tr>
				<td class="left"><spring:message code="inscription.coordonnees.adresseCplt" /></td>
				<td class="right">
					<spring:bind path="service.complementAdresse">
			    		<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:choose><c:when test="${not empty sessionScope.AUTHENTICATED_MEMBER.adresses[0].complementAdresse}"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].complementAdresse}"/></c:when><c:otherwise><c:out value="${status.value}"/></c:otherwise></c:choose>"/>
	    			</spring:bind>
				</td>
			</tr>
			
			<tr>
				 <spring:bind path="service.codePostal">
					<td class="left">
	    				<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="inscription.coordonnees.codePostal" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right">
						<input class="field" type="text" name="<c:out value="${status.expression}"/>" value="<c:choose><c:when test="${not empty sessionScope.AUTHENTICATED_MEMBER.adresses[0].codePostal}"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].codePostal}"/></c:when><c:otherwise><c:out value="${status.value}"/></c:otherwise></c:choose>"/>
					</td>
				 </spring:bind>
			</tr>
			
			<tr>
				<spring:bind path="service.ville">
					<td class="left">
					   	<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="inscription.coordonnees.ville" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right">
						<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:choose><c:when test="${not empty sessionScope.AUTHENTICATED_MEMBER.adresses[0].ville}"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].ville}"/></c:when><c:otherwise><c:out value="${status.value}"/></c:otherwise></c:choose>"/>
					</td>
				</spring:bind>
			</tr>
			
			<tr>
				<spring:bind path="service.payId">
					<td class="left space">
						<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="inscription.coordonnees.pays" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right">
				    	<select class="listederoulante" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>">
				    		<option <c:if test="${empty service.payId}">selected="selected"</c:if> value="0"><spring:message code="inscription.coordonnees.pays"/></option>
				    		<c:forEach var="pays" items="${listePays}">
								<option <c:choose><c:when test="${not empty sessionScope.AUTHENTICATED_MEMBER.adresses[0].pays.payId}"><c:if test="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].pays.payId == pays.payId}">selected="selected"</c:if></c:when><c:otherwise><c:if test="${pays.payId == service.payId}">selected="selected"</c:if></c:otherwise></c:choose> value="<c:out value="${pays.payId}"/>"><c:out value="${pays.nom}"/></option>
							</c:forEach>
						</select>
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
				<spring:bind path="service.question">
					<td class="left"><spring:message code="service.general.question" /></td>
					<td class="right">
				    	<textarea rows="5" cols="100" name="<c:out value="${status.expression}"/>"/><c:out value="${status.value}"/></textarea>
					</td>
				</spring:bind>
			</tr>
			
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
