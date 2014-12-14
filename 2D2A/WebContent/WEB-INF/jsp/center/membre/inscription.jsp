<%@ include file="../../head/include.jsp" %>

<script type="text/javascript" src="/${ROOT}/resources/js/inscription.js"></script> 

<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->
	<p class="b brown fs13 mt5"><spring:message code="inscription.title" /></p>
	<!-- endTitleFiche -->
	<p class="mt5 brown">
    	<spring:message code="inscription.exp" htmlEscape="false"/>
	</p>
</div>
<div id="separationEnteteFiche"></div>
<!-- endEnteteFiche -->

<!-- startCorpsFiche -->
<div id="ficheCorps">
	<form name="inscription" method="post" action="" id="inscription">
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
				    <spring:bind path="membre.prenom">
					<tr>
						<td class="left">
							<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.civilite.prenom" /><c:if test="${status.error}"></span></c:if>
						</td>
						<td class="right "><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}" />"/></td>
					</tr>
					</spring:bind>
					<spring:bind path="membre.nom">
					<tr>
						<td class="left">
							<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.civilite.nom" /><c:if test="${status.error}"></span></c:if>
						</td>
						<td class="right "><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}" />"/></td>
					</tr>
					</spring:bind>
				</spring:bind>
				<!-- END CIVILITE -->
				
				<!-- ADRESSES -->
				<tr>
					<td class="left title"><spring:message code="inscription.coordonnees" /></td>
					<td class="right"></td>
				</tr>
				<tr>
					<td class="left"><spring:message code="inscription.coordonnees.societe" /></td>
					<td class="right">
						<spring:bind path="membre.adresses[0].societe">
				    		<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
		    			</spring:bind>
		    		</td>
				</tr>
				<tr>
					<spring:bind path="membre.adresses[0].adresse">
						<td class="left">
	    					<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.coordonnees.adresse" /><c:if test="${status.error}"></span></c:if>
						</td>
						<td class="right"><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/></td>
					</spring:bind>	
				</tr>
				<tr>
					<td class="left"><spring:message code="inscription.coordonnees.adresseCplt" /></td>
					<td class="right">
						<spring:bind path="membre.adresses[0].complementAdresse">
				    		<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
		    			</spring:bind>
					</td>
				</tr>
				<tr>
					 <spring:bind path="membre.adresses[0].codePostal">
						<td class="left">
		    				<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.coordonnees.codePostal" /><c:if test="${status.error}"></span></c:if>
						</td>
						<td class="right">
							<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
						</td>
					 </spring:bind>
				</tr>
				<tr>
					<spring:bind path="membre.adresses[0].ville">
						<td class="left">
						   	<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.coordonnees.ville" /><c:if test="${status.error}"></span></c:if>
						</td>
						<td class="right">
							<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
						</td>
					</spring:bind>
				</tr>
				<tr>
					<spring:bind path="membre.adresses[0].payId">
						<td class="left space">
							<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.coordonnees.pays" /><c:if test="${status.error}"></span></c:if>
						</td>
						<td class="right">
					    	<select class="listederoulante" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>">
					    		<c:forEach var="pays" items="${listePays}">
									<option <c:if test="${empty membre.adresses[0].payId || pays.payId == membre.adresses[0].payId}">selected="selected"</c:if> value="<c:out value="${pays.payId}"/>"><c:out value="${pays.nom}"/></option>
								</c:forEach>
							</select>
						</td>
					</spring:bind>
				</tr>
				<!-- END ADRESSES -->
				
				<!-- PHONE -->
				<tr>
					<td class="left title"><spring:message code="inscription.telnum" /></td>
					<td class="right"></td>
				</tr>
				<tr>
					<td class="left"><spring:message code="inscription.coordonnees.telPrive" /></td>
					<td class="right">
						<spring:bind path="membre.adresses[0].telPrive">
			    			<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
	    				</spring:bind>
					</td>
				</tr>
				<tr>
					<td class="left"><spring:message code="inscription.coordonnees.telBureau" /></td>
					<td class="right">
						<spring:bind path="membre.adresses[0].telBureau">
	    					<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
				    	</spring:bind>
					</td>
				</tr>
				<tr>
					<td class="left space"><spring:message code="inscription.coordonnees.fax" /></td>
					<td class="right">
						<spring:bind path="membre.adresses[0].fax">
				    		<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
				    	</spring:bind>
					</td>
				</tr>
				<!-- END PHONE -->				
				
				<!-- EMAIL -->
				<tr>
					<td class="left title"><spring:message code="inscription.identifiant" /></td>
					<td class="right"></td>
				</tr>
				<tr>
					<spring:bind path="membre.login">
						<td class="left">
						   	<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.mail" /><c:if test="${status.error}"></span></c:if>
						</td>
						<td class="right">
							<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" />
						</td>
					</spring:bind>
				</tr>
				<tr>
					<spring:bind path="membre.loginConf">
						<td class="left">
							<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.mailConf" /><c:if test="${status.error}"></span></c:if>
						</td>
						<td class="right">
							<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" />
						</td>
					</spring:bind>
				</tr>
				<tr>
					<spring:bind path="membre.password">
						<td class="left">
							<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.pwd" /><c:if test="${status.error}"></span></c:if>
						</td>
						<td class="right">
							<input class="field"  type="password" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" />
						</td>
					</spring:bind>
				</tr>
				<tr>
					<spring:bind path="membre.passwordConf">
						<td class="left space">
							<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.pwdConf" /><c:if test="${status.error}"></span></c:if>
						</td>
						<td class="right">
							<input class="field"  type="password" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" />
						</td>
					</spring:bind>
				</tr>
				<!-- END EMAIL -->
			
				<!-- INFOS PERSO -->
				<tr>
					<td class="left title"><spring:message code="inscription.infoPerso" /></td>
					<td class="right"></td>
				</tr>
				<tr>
					<td class="left"><spring:message code="inscription.dateNaiss" /></td>
					<td class="right">
						
						<spring:bind path="membre.calendar">
							<c:choose>
								<c:when test="${empty status.value}">
									<input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<spring:message code="inscription.formatDate"/>" onclick="clearDate(document.getElementById('<c:out value="${status.expression}"/>'))"/>
								</c:when>
								<c:otherwise>
									<input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
								</c:otherwise>
							</c:choose>
						</spring:bind>
					</td>
				</tr>
				<tr>
					<td class="left"><spring:message code="inscription.profession" /></td>
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
				<tr>
					<td class="left"><spring:message code="inscription.centreInteret" /></td>
					<td class="right">
					   	<spring:bind path="membre.centreInteret">
				    		<textarea class="field" rows="4" cols="80" name="<c:out value="${status.expression}"/>" size="60" maxlength="100"/><c:out value="${status.value}"/></textarea>
	    				</spring:bind>
					</td>
				</tr>
				<!-- END INFOS PERSO -->
				
				<!-- CHECKBOX (newsletter, conditions generales)ET ANTISPAM-->
		    
				<col class="col1"/>
				<col class="col2"/>
				<tr>
					<td class="left noborder"></td>
					<td class="right pt20">
						<spring:bind path="membre.newsletter">	    		
	    					<input class="checkbox" type="checkbox" name="<c:out value="${status.expression}"/>" value="1" <c:if test="${status.value == 1}">checked="checked"</c:if> /><spring:message code="inscription.newsletter" />
	    				</spring:bind>
						<br/>
		    			<spring:bind path="membre.acceptation">
							<input class="checkbox" type="checkbox" name="<c:out value="${status.expression}"/>" value="1" <c:if test="${status.value == 1}">checked="checked"</c:if> />
							<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.acceptation" />&nbsp;<a href="#" class="magenta" onclick="window.open('/2D2A/conditionsGenerales.htm?cg=1', '_blank', 'toolbar=0, location=0, status=0, scrollbars=0, menubar=0, resizable=0, width=<spring:message code="conditionsGenerales.width"/>, height=<spring:message code="conditionsGenerales.height"/>');"><spring:message code="inscription.acceptationSuite"/></a>.<c:if test="${status.error}"></span></c:if>
						</spring:bind>
						<br/>
						<br/>
						<spring:message code="inscription.captchaIndication" />
						<br/>
						<br/>
						<spring:bind path="membre.captcha">	
							<c:if test="${status.error}"><span id="obligatoire"></c:if>* <spring:message code="inscription.captcha" /> <c:if test="${status.error}"></span></c:if> <img src="Captcha.jpg" height="50"/><br /><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="" />
						</spring:bind>
						<br/>
						<br/>
						<spring:message code="inscription.divulgation" />
						<br/>
						<br/>
						<a class="bouton" href="/${ROOT}/accueil.htm" title="Retour accueil"><span><span><spring:message code="global.retourAccueil"/></span></span></a>
						<span class="pl20 pr20"></span>
						<span class="pl20 pr20"></span>
						<span class="pl20 pr20"></span>
						<span class="pl20 pr20"></span>
							<a onclick="document.getElementById('inscription').submit();" class="bouton" href="#" title="<spring:message code="inscription.valider"/>"><span><span><spring:message code="inscription.valider"/></span></span></a>
						<br/>
						<br/>
						<br/>

						<spring:message code="inscription.loiLiberte" />

					</td>
				</tr>
				<!-- END CHECKBOX ET ANTISPAM-->
				
				
			</table>
	</form>
</div>
<!-- endCorpsFiche -->
