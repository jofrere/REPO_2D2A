<%@ include file="../../../head/include.jsp" %>


<!-- startEnteteFiche -->
<div id="enteteFiche">
	<%-- 
	<spring:message code="espacePrivatif.mesCoordonnees" />
	--%>
	<!-- startTitleFiche -->
	<p class="b brown fs13 mt5"><spring:message code="espacePrivatif.bienvenue"/>&nbsp;<b><c:out value="${membre.civilite.titre}"/>&nbsp;<c:out value="${membre.prenom}"/>&nbsp;<c:out value="${membre.nom}"/></b></p>
	<!-- endTitleFiche -->
	<p class="mt5 brown">
    	<c:out value="${DATE_TODAY}"/>
	</p>
</div>

<div id="separationEnteteFiche"></div>
<!-- endEnteteFiche -->

<!-- startCorpsFiche -->
<div id="ficheCorps">  
    <form name="mesAdresses" id="mesAdresses" method="post" action="">
   		<input type="hidden" name="membreId" value="<c:out value="${membre.memId}"/>" />
    	<input type="hidden" name="action" value="<c:out value="${adresse.action}"/>" />
      
      	<spring:bind path="adresse.*">
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
		<!-- CIVILITE -->
			<tr>
				<td class="left title"><spring:message code="adresse.carnetAdresse" /><br/><p class="b brown fs13 mt5"><spring:message code="adresse.nomAdresse.exp" /></p></td>
				<td class="right"></td>
			</tr>
      	
    	<spring:bind path="adresse.nomAdresse">
			<tr>
				<td class="left">
					<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="adresse.nomAdresse" /><c:if test="${status.error}"></span></c:if>
				</td>
				<td class="right">	
					<input class="field"  type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
			    </td>
			</tr>
		</spring:bind>
    	
    
    	<!-- Partie civilite --> 
    	
    	<tr>
			<td class="left title"><spring:message code="inscription.civilite" /></td>
			<td class="right"></td>
		</tr>
		<spring:bind path="adresse.civId">
		<tr>
			<td class="left">
				<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.civilite.titre" /><c:if test="${status.error}"></span></c:if>
			</td>
			<td class="right">						
				<c:forEach var="civ" items="${listeCivilite}">
					<input class="radio" type="radio" <c:if test="${civ.civId == membre.civId}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${civ.civId}"/>"/><c:out value="${civ.titre}"/>
					<span class="pr10"></span>
				</c:forEach>
			</td>
		</tr>
		</spring:bind>
    	
    	<spring:bind path="adresse.nom">
		<tr>
			<td class="left">
				<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.civilite.nom" /><c:if test="${status.error}"></span></c:if>
			</td>
			<td class="right">	
				<input class="field"  type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
		    </td>
		</tr>
	    </spring:bind>
        
		<spring:bind path="adresse.prenom">
		<tr>
			<td class="left">
				<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.civilite.prenom" /><c:if test="${status.error}"></span></c:if>
			</td>
			<td class="right">	
				<input class="field"  type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
		    </td>
		</tr>
	    </spring:bind>
	    
    	<!-- Partie adresses -->
    	    	
    	<spring:bind path="adresse.societe">
		<tr>
			<td class="left">
				<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="inscription.coordonnees.societe" /><c:if test="${status.error}"></span></c:if>
			</td>
			<td class="right">	
				<input class="field"  type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
		    </td>
		</tr>
	    </spring:bind>
    	
    	
		<spring:bind path="adresse.adresse">
		<tr>
			<td class="left">
				<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.coordonnees.adresse" /><c:if test="${status.error}"></span></c:if>
			</td>
			<td class="right">	
				<input class="field"  type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
		    </td>
		</tr>
	    </spring:bind>
	        
    	<spring:bind path="adresse.complementAdresse">
		<tr>
			<td class="left">
				<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="inscription.coordonnees.adresseCplt" /><c:if test="${status.error}"></span></c:if>
			</td>
			<td class="right">	
				<input class="field"  type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
		    </td>
		</tr>
	    </spring:bind>
    	<spring:bind path="adresse.codePostal">
		<tr>
			<td class="left">
				<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.coordonnees.codePostal" /><c:if test="${status.error}"></span></c:if>
			</td>
			<td class="right">	
				<input class="field"  type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
		    </td>
		</tr>
	    </spring:bind>
	    <spring:bind path="adresse.ville">
		<tr>
			<td class="left">
				<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.coordonnees.ville" /><c:if test="${status.error}"></span></c:if>
			</td>
			<td class="right">	
				<input class="field"  type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
		    </td>
		</tr>
	    </spring:bind>
	    <spring:bind path="adresse.payId">
		<tr>
			<td class="left">
				<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.coordonnees.pays" /><c:if test="${status.error}"></span></c:if>
			</td>
			<td class="right">
				<select id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>">
		    		<option <c:if test="${empty adresse.payId}">selected="selected"</c:if> value="0"><spring:message code="inscription.coordonnees.pays"/></option>
		    		<c:forEach var="pays" items="${listePays}">
						<option <c:if test="${pays.payId == adresse.payId}">selected="selected"</c:if> value="<c:out value="${pays.payId}"/>"><c:out value="${pays.nom}"/></option>
					</c:forEach>
				</select>
		    </td>
		</tr>
	    </spring:bind>
	    <spring:bind path="adresse.telPrive">
		<tr>
			<td class="left">
				<c:if test="${status.error}"></c:if><spring:message code="inscription.coordonnees.telPrive" /><c:if test="${status.error}"></c:if>
			</td>
			<td class="right">	
				<input class="field"  type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
		    </td>
		</tr>
	    </spring:bind>

	 	<spring:bind path="adresse.telBureau">
		<tr>
			<td class="left">
				<c:if test="${status.error}"></c:if><spring:message code="inscription.coordonnees.telBureau" /><c:if test="${status.error}"></c:if>
			</td>
			<td class="right">	
				<input class="field"  type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
		    </td>
		</tr>
	    </spring:bind>
		<spring:bind path="adresse.fax">
		<tr>
			<td class="left">
				<c:if test="${status.error}"></c:if><spring:message code="inscription.coordonnees.fax" /><c:if test="${status.error}"></c:if>
			</td>
			<td class="right">	
				<input class="field"  type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
		    </td>
		</tr>
	    </spring:bind>		    
    	<!-- Validation -->

		<tr>
			<td class="left noborder">
			</td>
			<td class="right pt20">
				<a class="bouton" href="#" onclick="document.getElementById('mesAdresses').submit();"><span><span><spring:message code="inscription.validerModif"/></span></span></a>
		    </td>
		</tr>
    </table>
    </form>
</div>