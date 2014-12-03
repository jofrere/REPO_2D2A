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
    	<spring:message code="espacePrivatif.exp" htmlEscape="false"/>
	</p>
</div>
<div id="separationEnteteFiche"></div>
<!-- endEnteteFiche -->

<!-- startCorpsFiche -->
<div id="ficheCorps">   
    <form name="mesCoordonnees" method="post" action="">
   		<input type="hidden" name="idAdresse" value="0"/>
		<input type="hidden" name="action" value="0" />
   
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
		
  		<table class="formulaire">
		<col class="col1"/>
		<col class="col2"/>
		<!-- CIVILITE -->
		<spring:bind path="membre.civId">
			<tr>
				<td class="left title"><spring:message code="inscription.civilite" /></td>
				<td class="right"></td>
			</tr>
			<spring:bind path="membre.civId">
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
			
			<spring:bind path="membre.nom">
			<tr>
				<td class="left">
					<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.civilite.nom" /><c:if test="${status.error}"></span></c:if>
				</td>
				<td class="right">	
					<input class="field"  type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
			    </td>
			</tr>
		    </spring:bind>
	        
			<spring:bind path="membre.prenom">
			<tr>
				<td class="left">
					<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.civilite.prenom" /><c:if test="${status.error}"></span></c:if>
				</td>
				<td class="right">	
					<input class="field"  type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
			    </td>
			</tr>
		    </spring:bind>
		    
	   		<tr>
				<td class="left title"><spring:message code="inscription.coordonnees" /><br><p class="b brown fs13 mt5"><spring:message code="inscription.coordonnees.facture" /></p></td>
				<td class="right"></td>
			</tr>
	    
	    
	   		<spring:bind path="membre.adresses[0].societe">
			<tr>
				<td class="left">
					<spring:message code="inscription.coordonnees.societe" />
				</td>
				<td class="right">	
					<input class="field"  type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
			    </td>
			</tr>
		    </spring:bind>
		    
			<spring:bind path="membre.adresses[0].adresse">
			<tr>
				<td class="left">
					<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.coordonnees.adresse" /><c:if test="${status.error}"></span></c:if>
				</td>
				<td class="right">	
					<input class="field"  type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
			    </td>
			</tr>
		    </spring:bind>
			
			<spring:bind path="membre.adresses[0].complementAdresse">
			<tr>
				<td class="left">
					<spring:message code="inscription.coordonnees.adresseCplt" />
				</td>
				<td class="right">	
					<input class="field"  type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
			    </td>
			</tr>
		    </spring:bind>
			
			<spring:bind path="membre.adresses[0].codePostal">
			<tr>
				<td class="left">
					<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.coordonnees.codePostal" /><c:if test="${status.error}"></span></c:if>
				</td>
				<td class="right">	
					<input class="field"  type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
			    </td>
			</tr>
		    </spring:bind>
			
			<spring:bind path="membre.adresses[0].ville">
			<tr>
				<td class="left">
					<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.coordonnees.ville" /><c:if test="${status.error}"></span></c:if>
				</td>
				<td class="right">	
					<input class="field"  type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
			    </td>
			</tr>
		    </spring:bind>
	
			<tr>
				<spring:bind path="membre.adresses[0].payId">
					<td class="left space">
						<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.coordonnees.pays" /><c:if test="${status.error}"></span></c:if>
					</td>
					<td class="right">
				    	<select class="listederoulante" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>">
				    		<option <c:if test="${empty membre.adresses[0].payId}">selected="selected"</c:if> value="0"><spring:message code="inscription.coordonnees.pays"/></option>
				    		<c:forEach var="pays" items="${listePays}">
								<option <c:if test="${pays.payId == membre.adresses[0].payId}">selected="selected"</c:if> value="<c:out value="${pays.payId}"/>"><c:out value="${pays.nom}"/></option>
							</c:forEach>
						</select>
					</td>
				</spring:bind>
			</tr>
			<tr>
				<td class="left title"><spring:message code="inscription.telnum" /><br/><p class="b brown fs13 mt5"><spring:message code="inscription.telnum.exp" /></p></td>
				<td class="right"></td>
			</tr>
			<spring:bind path="membre.adresses[0].telPrive">
			<tr>
				<td class="left">
					<spring:message code="inscription.coordonnees.telPrive" />
				</td>
				<td class="right">	
					<input class="field"  type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
			    </td>
			</tr>
		    </spring:bind>
			
			<spring:bind path="membre.adresses[0].telBureau">
			<tr>
				<td class="left">
					<spring:message code="inscription.coordonnees.telBureau" />
				</td>
				<td class="right">	
					<input class="field"  type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
			    </td>
			</tr>
		    </spring:bind>
			
			<spring:bind path="membre.adresses[0].fax">
			<tr>
				<td class="left">
					<spring:message code="inscription.coordonnees.fax" />
				</td>
				<td class="right">	
					<input class="field"  type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
			    </td>
			</tr>
		    </spring:bind>
			<tr>
				<td class="left title"><spring:message code="inscription.carnetAdresse" /></td>
				<td class="right"></td>
			</tr>
			<c:forEach items="${membre.adresses}" var="adresse" varStatus="i">
				<c:if test="${not i.first}">
					<tr>
						<td class="left">
						</td>
						<td class="right">
							<table>
								<tr>
									<td width="200">
										<a href="#" class="magenta" onclick="document.mesCoordonnees.action.value=1;document.mesCoordonnees.idAdresse.value=<c:out value="${adresse.adrId}"/> ;document.mesCoordonnees.submit();">
											<c:out value="${adresse.nomAdresse}" />
										</a>
									</td>
									<td>
										<a href="#" onclick="document.mesCoordonnees.action.value=2;document.mesCoordonnees.idAdresse.value=<c:out value="${adresse.adrId}"/> ;document.mesCoordonnees.submit();">
											<img src="/${ROOT}/resources/pic/panier/corbeille.gif"/>
										</a>
									</td>
								</tr>
							</table>							
					    </td>
					</tr>
				</c:if>
			</c:forEach>
			<tr>
				<td class="left">
				</td>
				<td class="right">
					<br>
					<a class="magenta" href="/${ROOT}/mesAdresses.htm"><spring:message code="adresse.ajoutAdresse" /></a>
			    </td>
			</tr>
			<tr>
				<td class="left title"><spring:message code="inscription.identifiant" /></td>
				<td class="right"></td>
			</tr>
			<spring:bind path="membre.login">
			<tr>
				<td class="left">
					<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.mail" /><c:if test="${status.error}"></span></c:if>
				</td>
				<td class="right">	
					<input class="field"  type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
			    </td>
			</tr>
		    </spring:bind>
			
			<spring:bind path="membre.newLogin">
			<tr>
				<td class="left">
					<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.newMail" /><c:if test="${status.error}"></span></c:if>
				</td>
				<td class="right">	
					<input class="field"  type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
			    </td>
			</tr>
		    </spring:bind>
			
			<spring:bind path="membre.newLoginConf">
			<tr>
				<td class="left">
					<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.newMailConf" /><c:if test="${status.error}"></span></c:if>
				</td>
				<td class="right">	
					<input class="field"  type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
			    </td>
			</tr>
		    </spring:bind>
		    
		    <tr>
				<td class="left title"><spring:message code="inscription.changePassword" /></td>
				<td class="right"></td>
			</tr>
	
			<spring:bind path="membre.newPassword">
			<tr>
				<td class="left">
					<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.newPassword" /><c:if test="${status.error}"></span></c:if>
				</td>
				<td class="right">	
					<input class="field"  type="password" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
			    </td>
			</tr>
		    </spring:bind>
		
			<spring:bind path="membre.newPasswordConf">
			<tr>
				<td class="left">
					<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.newPasswordConf" /><c:if test="${status.error}"></span></c:if>
				</td>
				<td class="right">	
					<input class="field"  type="password" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
			    </td>
			</tr>
			</spring:bind>
			
		    <tr>
				<td class="left title"><spring:message code="inscription.infoPerso" /></td>
				<td class="right"></td>
			</tr>
			
			<tr>
				<td class="left">
					<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.dateNaiss" /><c:if test="${status.error}"></span></c:if>
				</td>
				<td class="right">
					<spring:message code="inscription.jourNaiss" />
					<spring:bind path="membre.jourNaiss">
			    		<input type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="2" maxlength="2"/>
			    	</spring:bind>
			    	<spring:message code="inscription.moisNaiss" />
					<spring:bind path="membre.moisNaiss">
			    		<input type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="2" maxlength="2"/>
			    	</spring:bind>
			    	<spring:message code="inscription.anneeNaiss" />
					<spring:bind path="membre.anneeNaiss">
			    		<input type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="4" maxlength="4"/>
			    	</spring:bind>
			    </td>
			</tr>
			
			<tr>
				<td class="left space">
					<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.profession" /><c:if test="${status.error}"></span></c:if>
				</td>
				<td class="right">
					<spring:bind path="membre.profId">
			    		<select class="listederoulante" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>">
			    			<option <c:if test="${empty membre.profession.profId}">selected="selected"</c:if> value="0"><spring:message code="inscription.profession"/></option>
			    			<c:forEach var="prof" items="${listeProfession}">
								<option <c:if test="${prof.profId == membre.profId}">selected="selected"</c:if> value="<c:out value="${prof.profId}"/>"><c:out value="${prof.titre}"/></option>
							</c:forEach>
						</select>
			    	</spring:bind>					
				</td>
			</tr>
			
			<spring:bind path="membre.centreInteret">
			<tr>
				<td class="left">
					<spring:message code="inscription.centreInteret" />
				</td>
				<td class="right">	
					<textarea class="field" rows="2" cols="70" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>"><c:out value="${status.value}"/></textarea>
			    </td>
			</tr>
		    </spring:bind>
			
			
			<col class="col1"/>
			<col class="col2"/>
			<tr>
				<td class="left noborder"></td>
				<td class="right pt20">
					<spring:bind path="membre.newsletter">	    		
    					<input class="checkbox" type="checkbox" name="<c:out value="${status.expression}"/>" value="1" <c:if test="${status.value == 1}">checked="checked"</c:if> /><spring:message code="inscription.newsletter" />
    				</spring:bind>
    				<br/>
    				<br/>
					<a onclick="document.mesCoordonnees.submit();" class="bouton" href="#" title="<spring:message code="inscription.validerModif"/>"><span><span><spring:message code="inscription.validerModif"/></span></span></a>
				</td>
			</tr>
			</spring:bind>
			
			<tr>
				<td class="left noborder"></td>
				<td class="right pt20">
					<h1><spring:message code="monComptePrivate.desinscription1"/> <a href="/${ROOT}/desinscription.htm"><spring:message code="monComptePrivate.desinscription2"/></a></h1>
				</td>
			</tr>
			
  		</table>
    </form>
</div>