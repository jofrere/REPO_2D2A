<%@ include file="../../head/include.jsp" %>


<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->
	<p class="b brown fs13 mt5"><spring:message code="depot.titre" /></p>
	<!-- endTitleFiche -->
	<p class="mt5 brown">
    	<spring:message code="depot.monCompte" htmlEscape="false"/>
	</p>
</div>
<div id="separationEnteteFiche"></div>
<!-- endEnteteFiche -->

<!-- startCorpsFiche -->
<div id="ficheCorps">
	<form name="depotForm" id="depotForm" method="post" action="" enctype="multipart/form-data">
		<spring:bind path="depot.*">
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
			
			<spring:bind path="depot.denomination">
				<tr>
					<td class="left">
						<label class="label" for="<c:out value="${status.expression}"/>"><spring:message code="depot.denomination" htmlEscape="false"/></label>
					</td>
					<td class="right">
						<input type="text" class="field" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
					</td>
				</tr>
			</spring:bind>
			
			<spring:bind path="depot.description">
				<tr>
						<td class="left">
							<label class="label" for="<c:out value="${status.expression}"/>"><spring:message code="depot.description" htmlEscape="false"/></label>
						</td>
						<td class="right">
							<textarea class="field" rows="2" cols="70" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>"><c:out value="${status.value}"/></textarea>
						</td>
				</tr>
			</spring:bind>

			<tr>
				<td class="left">
					<spring:message code="depot.photo" htmlEscape="false"/>
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
			
			<spring:bind path="depot.materiaux">
				<tr>
						<td class="left">
							<br/>
							<label class="label" for="<c:out value="${status.expression}"/>"><spring:message code="depot.materiaux" htmlEscape="false"/></label>
						</td>
						<td class="right">
							<br/>
							<textarea class="field" rows="2" cols="70" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>"><c:out value="${status.value}"/></textarea>
							<br/>
						</td>
				</tr>
			</spring:bind>
			
			<spring:bind path="depot.poids">
				<tr>
					<td class="left">
						<br/>
						<label class="label" for="<c:out value="${status.expression}"/>"><spring:message code="depot.poids" htmlEscape="false"/></label>
					</td>
					<td class="right">
						<br/>
						<input  class="field"   type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
					</td>
				</tr>
			</spring:bind>
			
			<tr>
				<td class="left">
					<spring:message code="depot.dimension" htmlEscape="false"/>
				</td>
				<td class="right">
					<spring:bind path="depot.hauteur">
						<label class="label" for="<c:out value="${status.expression}"/>"><spring:message code="depot.hauteur" htmlEscape="false"/></label>
						<input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="10" maxlength="5"/>
					</spring:bind>
					
					<spring:bind path="depot.largeur">
						<label class="label" for="<c:out value="${status.expression}"/>"><spring:message code="depot.largeur" htmlEscape="false"/></label>
						<input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="10" maxlength="5"/>
					</spring:bind>
					
					<spring:bind path="depot.profondeur">
						<label class="label" for="<c:out value="${status.expression}"/>"><spring:message code="depot.profondeur" htmlEscape="false"/></label>
						<input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="10" maxlength="5"/>
					</spring:bind>
					
					<spring:bind path="depot.diametre">
						<label class="label" for="<c:out value="${status.expression}"/>"><spring:message code="depot.diametre" htmlEscape="false"/></label>
						<input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="10" maxlength="5"/>
					</spring:bind>
					
				</td>
			</tr>
			
					
			<spring:bind path="depot.coloris">
				<tr>
					<td class="left">
						<label class="label" for="<c:out value="${status.expression}"/>"><spring:message code="depot.coloris" htmlEscape="false"/></label>
					</td>
					<td class="right">
						<input  class="field"   type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
					</td>
				</tr>
			</spring:bind>
			
			<spring:bind path="depot.descAnnee">
				<tr>
					<td class="left">
						<label class="label" for="<c:out value="${status.expression}"/>"><spring:message code="depot.annee" htmlEscape="false"/></label>
					</td>
					<td class="right">
						<input  class="field"   type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
					</td>
				</tr>
			</spring:bind>
			
			<spring:bind path="depot.origine">
				<tr>
					<td class="left">
						<label class="label" for="<c:out value="${status.expression}"/>"><spring:message code="depot.origine" htmlEscape="false"/></label>
					</td>
					<td class="right">
						<input  class="field"   type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
					</td>
				</tr>
			</spring:bind>
			
			<spring:bind path="depot.designer">
				<tr>
					<td class="left">
						<label class="label" for="<c:out value="${status.expression}"/>"><spring:message code="depot.designer" htmlEscape="false"/></label>
					</td>
					<td class="right">
						<input  class="field"   type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
					</td>
				</tr>
			</spring:bind>
			
			<spring:bind path="depot.editeur">
				<tr>
					<td class="left">
						<label class="label" for="<c:out value="${status.expression}"/>"><spring:message code="depot.editeur" htmlEscape="false"/></label>
					</td>
					<td class="right">
						<input  class="field"   type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
					</td>
				</tr>
			</spring:bind>
			
			<spring:bind path="depot.signeApp">
				<tr>
					<td class="left">
						<label class="label" for="<c:out value="${status.expression}"/>"><spring:message code="depot.signeApp" htmlEscape="false"/></label>
					</td>
					<td class="right">
						<input  class="field"   type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
					</td>
				</tr>
			</spring:bind>
			
			<spring:bind path="depot.bibliographie">
				<tr>
					<td class="left">
						<label class="label" for="<c:out value="${status.expression}"/>"><spring:message code="depot.biblio" htmlEscape="false"/></label>
					</td>
					<td class="right">
						<input  class="field"   type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
					</td>
				</tr>
			</spring:bind>
			
			<spring:bind path="depot.information">
				<tr>
					<td class="left">
						<label class="label" for="<c:out value="${status.expression}"/>"><spring:message code="depot.info" htmlEscape="false"/></label>
					</td>
					<td class="right">
						<input  class="field"   type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
					</td>
				</tr>
			</spring:bind>
			
			<spring:bind path="depot.prix">
				<tr>
					<td class="left">
						<label class="label" for="<c:out value="${status.expression}"/>"><spring:message code="depot.prix" htmlEscape="false"/></label>
					</td>
					<td class="right">
						<input  class="field"   type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
					</td>
				</tr>
			</spring:bind>
						
			<spring:bind path="depot.commentaire">
				<tr>
					<td class="left">
						<label class="label" for="<c:out value="${status.expression}"/>"><spring:message code="depot.commentaire" htmlEscape="false"/></label><br />
					</td>
					<td class="right">
						<textarea class="field" rows="3" cols="70" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>"><c:out value="${status.value}"/></textarea>
						<br/>
					</td>
				</tr>
			</spring:bind>
			
			<spring:bind path="depot.acceptation">
				<tr>
					<td class="left">
					</td>
					<td class="right">
						<br />
						<input type="checkbox" name="<c:out value="${status.expression}"/>" value="1" <c:if test="${status.value == 1}">checked="checked"</c:if> />
		    			<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="depot.acceptation" /><c:if test="${status.error}"></span></c:if>
		    			&nbsp;
		    			<a class="magenta" href="#" onclick="window.open('/${ROOT}/conditionsGenerales.htm?cg=2', '_blank', 'toolbar=0, location=0, status=0, scrollbars=0, menubar=0, resizable=0, width=<spring:message code="conditionsGenerales.width"/>, height=<spring:message code="conditionsGenerales.height"/>');" ><span><span><spring:message code="depot.conditions"/></span></span></a>		    			
					</td>
				</tr>			
			</spring:bind>
		
			<spring:bind path="depot.email">
				<tr>
					<td class="left">
						<br/>
						<label class="label" for="<c:out value="${status.expression}"/>"><c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="depot.mail" htmlEscape="false"/><c:if test="${status.error}"></span></c:if></label>
					</td>
					<td class="right">
						<br/>
						<input  class="field"   type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:choose><c:when test="${not empty sessionScope.AUTHENTICATED_MEMBER.login}"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.login}"/></c:when><c:otherwise><c:out value="${status.value}"/></c:otherwise></c:choose>" size="30" maxlength="50"/>
					</td>
				</tr>
			</spring:bind>
			
			<spring:bind path="depot.nom">
				<tr>
					<td class="left">
						<label class="label" for="<c:out value="${status.expression}"/>"><c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="depot.nom" htmlEscape="false"/><c:if test="${status.error}"></span></c:if></label>
					</td>
					<td class="right">
						<input  class="field"   type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:choose><c:when test="${not empty sessionScope.AUTHENTICATED_MEMBER.nom}"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.nom}"/></c:when><c:otherwise><c:out value="${status.value}"/></c:otherwise></c:choose>" size="30" maxlength="50"/>
					</td>
				</tr>
			</spring:bind>
			
			<spring:bind path="depot.prenom">
				<tr>
					<td class="left">
						<label class="label" for="<c:out value="${status.expression}"/>"><c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="depot.prenom" htmlEscape="false"/><c:if test="${status.error}"></span></c:if></label>
					</td>
					<td class="right">
						<input  class="field"   type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:choose><c:when test="${not empty sessionScope.AUTHENTICATED_MEMBER.prenom}"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.prenom}"/></c:when><c:otherwise><c:out value="${status.value}"/></c:otherwise></c:choose>" size="30" maxlength="50"/>
					</td>						
				</tr>
			</spring:bind>
			
			<spring:bind path="depot.telephone">
				<tr>
					<td class="left">
						<label class="label" for="<c:out value="${status.expression}"/>"><spring:message code="depot.telephone" htmlEscape="false"/></label>
					</td>
					<td class="right">
						<input  class="field"   type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:choose><c:when test="${not empty sessionScope.AUTHENTICATED_MEMBER.adresses[0].telPrive}"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].telPrive}"/></c:when><c:otherwise><c:out value="${status.value}"/></c:otherwise></c:choose>" size="30" maxlength="50"/>
					</td>
				</tr>
			</spring:bind>
			
			<spring:bind path="depot.adresse">
				<tr>
					<td class="left">
						<label class="label" for="<c:out value="${status.expression}"/>"><spring:message code="depot.adresse" htmlEscape="false"/></label>
					</td>
					<td class="right">
						<input  class="field"   type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:choose><c:when test="${not empty sessionScope.AUTHENTICATED_MEMBER.adresses[0].adresse}"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.adresses[0].adresse}"/></c:when><c:otherwise><c:out value="${status.value}"/></c:otherwise></c:choose>" size="30" maxlength="50"/>
					</td>
				</tr>
			</spring:bind>
			 
			<tr>
				<td class="left noborder"></td>
				<td class="right pt20">
					<a class="bouton" href="#" onclick="document.getElementById('depotForm').submit();" title="<spring:message code="depot.submit" htmlEscape="false"/>"><span><span><spring:message code="depot.submit" htmlEscape="false"/></span></span></a>
				</td>
			</tr>
		</table>
	</form>
</div>


<script>
	var pathDeleteBtn = '/${ROOT}/resources/pic/panier/corbeille.gif'; 
</script>
