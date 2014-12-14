<%@ include file="../../head/include.jsp" %>

<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->
	<p class="b brown fs13 mt5">
		<c:choose>
			<c:when test="${ouvrage.action == 5}">Modification d'un ouvrage</c:when>
			<c:when test="${ouvrage.action == 4}">Création d'un ouvrage</c:when>
		</c:choose>
	</p>
	<!-- endTitleFiche -->
</div>
<div id="separationEnteteFiche"></div>
<!-- endEnteteFiche -->

<div id="ficheCorps">

	<form name="modifOuvrageForm" id="modifOuvrageForm" method="post" action="" enctype="multipart/form-data">
		<spring:bind path="ouvrage.id">
			<input type="hidden" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>">
		</spring:bind>
		
		<spring:bind path="ouvrage.action">
			<input type="hidden" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>">
		</spring:bind>
		
		<table class="formulaire">
			<col class="col1"/>
			<col class="col2"/>
			
			<tr>	
				<spring:bind path="ouvrage.type">
					<td class="left">Type</td>
					<td class="right">
						<input type="radio" <c:if test="${status.value == 0}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="0"/>&nbsp;Presse<br />
						<input type="radio" <c:if test="${status.value == 1}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="1"/>&nbsp;Bibliothèque
					</td>
				</spring:bind>
			</tr>
			<tr>
				<td class="left">&nbsp;</td>
				<td class="right">&nbsp;</td>
			</tr>
			<tr>	
				<spring:bind path="ouvrage.reference">
					<td class="left">Référence</td>
					<td class="right">
						<input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="10" maxlength="10"/>
					</td>
				</spring:bind>
			</tr>
			<tr>	
				<spring:bind path="ouvrage.titre">
					<td class="left">Titre</td>
					<td class="right">
						<input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="50" maxlength="50"/>
					</td>
				</spring:bind>
			</tr>
			<tr>	
				<spring:bind path="ouvrage.auteur">
					<td class="left">Auteur</td>
					<td class="right">
						<input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="50" maxlength="50"/>
					</td>
				</spring:bind>
			</tr>
			<tr>	
				<spring:bind path="ouvrage.langue">
					<td class="left">Langue</td>
					<td class="right">
						<input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="50" maxlength="50"/>
					</td>
				</spring:bind>
			</tr>
			<tr>	
				<spring:bind path="ouvrage.annee">
					<td class="left">Année</td>
					<td class="right">
						<input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="4" maxlength="4"/>
					</td>
				</spring:bind>
			</tr>
			<tr>	
				<spring:bind path="ouvrage.reliure">
					<td class="left">Reliure</td>
					<td class="right">
						<input type="radio" <c:if test="${status.value == 0}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="0"/>&nbsp;Sans reliure<br />
						<input type="radio" <c:if test="${status.value == 1}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="1"/>&nbsp;Avec reliure
					</td>
				</spring:bind>
			</tr>
			<tr>	
				<spring:bind path="ouvrage.format">
					<td class="left">Format</td>
					<td class="right">
						<input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="20" maxlength="20"/>
					</td>
				</spring:bind>
			</tr>
			<tr>	
				<spring:bind path="ouvrage.nbPages">
					<td class="left">Nombre de pages</td>
					<td class="right">
						<input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="4" maxlength="4"/>
					</td>
				</spring:bind>
			</tr>
			<tr>	
				<spring:bind path="ouvrage.theme">
					<td class="left">Thème</td>
					<td class="right">
						<textarea rows="4" cols="70" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>"><c:out value="${status.value}"/></textarea>
					</td>
				</spring:bind>
			</tr>
			<tr>	
				<spring:bind path="ouvrage.sommaire">
					<td class="left">Sommaire</td>
					<td class="right">
						<textarea rows="4" cols="70" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>"><c:out value="${status.value}"/></textarea>
					</td>
				</spring:bind>
			</tr>
			<tr>	
				<spring:bind path="ouvrage.information">
					<td class="left">Information</td>
					<td class="right">
						<textarea rows="4" cols="70" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>"><c:out value="${status.value}"/></textarea>
					</td>
				</spring:bind>
			</tr>
			<tr>	
				<spring:bind path="ouvrage.prix">
					<td class="left">Prix</td>
					<td class="right">
						<input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="10" maxlength="10"/>
					</td>
				</spring:bind>
			</tr>
			<tr>	
				<spring:bind path="ouvrage.quantite">
					<td class="left">Quantité</td>
					<td class="right">
						<input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="5" maxlength="5"/>
					</td>
				</spring:bind>
			</tr>
			<tr>
				<td class="left">Photos</td>
				<td class="right">			
					<span id="modifProduit">
				
						<c:forEach var="image" items="${ouvrage.images}" varStatus="i">
							<p>
								<spring:bind path="ouvrage.images[${i.index}].pathPhoto">
									Image actuelle <img id="<c:out value="${status.expression}"/>" src="/${ROOT}/<c:out value="${status.value}"/>" style="border:1px; border-style:solid;border-color:#5a2041;" width="400" height="400" />
									<input type="hidden" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/><br />
								</spring:bind>
								<spring:bind path="ouvrage.images[${i.index}].photoFile">
									Modifier : <input type="file" id="<c:out value="${i.index}"/>" name="<c:out value="${status.expression}"/>"/> <img src="/${ROOT}/resources/pic/panier/corbeille.gif" onclick="deleteField2(event);"/>
								</spring:bind>
							</p>
							<br />
							<br />
							<c:if test="${i.last}">
								<c:set var="last" value="${i.index}" scope="page"/>
							</c:if>
						</c:forEach>
						
						<c:choose>
							<c:when test="${empty last}">
								<c:set var="last" value="0" scope="page"/>
							</c:when>
							<c:otherwise>
								<c:set var="last" value="${last+1}" scope="page"/>
							</c:otherwise>
						</c:choose>
									
						<p>
							Ajouter :<br /><input type="file" id="<c:out value="${last}"/>" name="images[${last}].photoFile"/>
						</p>
					</span>
				</td>
			</tr>
		</table>
		<table class="formulaire">
			<tr>
				<td class="left noborder"></td>
				<td class="right pt20">
					<span class="pl20 pr20"></span>
					<span class="pl20 pr20"></span>
					<span class="pl20 pr20"></span>
					<span class="pl20 pr20"></span>
						<a onclick="document.getElementById('modifOuvrageForm').submit();" class="bouton" href="#" title="Valider"><span><span>Valider</span></span></a>
					<br/>
					<br/>
					<br/>
				</td>
			</tr>
		</table>
	</form>
</div>

<script>
	initForm2(<c:out value="${last}"/>);
	var pathDeleteBtn = '/${ROOT}/resources/pic/panier/corbeille.gif'; 
</script>