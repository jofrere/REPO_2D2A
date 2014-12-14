<%@ include file="../head/include.jsp" %>

<c:if test="${empty param['imprimer']}">
	<form id="advancedSearch" method="post" action="/${ROOT}/recherche.htm" style="display: inline;">
		<div id="menuV" class="menuV">
			<div class="menuVSep"><br /></div>
			<div class="menuVHeadRecherche"><spring:message code="leftMenuRecherche.titre" htmlEscape="false"/></div>
			<div class="menuVSep"><br /></div>
			<div class="menuVHeadRechercheElement">
				<spring:bind path="rechercheForm.searchField">
					<spring:message code="leftMenuRecherche.votreRecherche" htmlEscape="false"/>
					<input type="text" value="<c:out value="${status.value}"/>" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>"/>
					<br />
		 		</spring:bind>
			</div>		
			<div class="menuVSep"><br /></div>
			<div class="menuVHeadRechercheElement">
				<spring:bind path="rechercheForm.rubrique">
					<spring:message code="leftMenuRecherche.boutique" htmlEscape="false"/>
					<select id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>">
						<option value="" <c:if test="${status.value == '-1'}">selected="selected"</c:if>><spring:message code="recherche.indifferent" htmlEscape="false"/></option>
						<c:forEach var="rubrique" items="${rubriques}">
							<option value="<c:out value="${rubrique.rubId}"/>" <c:if test="${status.value == rubrique.rubId}">selected="selected"</c:if>><c:out value="${rubrique.nom}"/></option>
						</c:forEach>
					</select>
					<br />
				</spring:bind>
			</div>
			<div class="menuVSep"><br /></div>
			<div class="menuVHeadRechercheElement">		
				<spring:bind path="rechercheForm.prix">
					<spring:message code="leftMenuRecherche.prix" htmlEscape="false"/>
					<select id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>">
						<option value="" <c:if test="${status.value == '-1'}">selected="selected"</c:if>><spring:message code="recherche.indifferent" htmlEscape="false"/></option>
						<c:forEach var="prix" items="${tablePrix}">
							<option value="<c:out value="${prix.key}"/>" <c:if test="${status.value == prix.key}">selected="selected"</c:if>><c:out value="${prix.value}"/></option>
						</c:forEach>
					</select>
					<br />
				</spring:bind>
			</div>
		 	<div class="menuVSep"><br /></div>
			<div class="menuVHeadRechercheElement">
				<spring:bind path="rechercheForm.editeur">
					<spring:message code="leftMenuRecherche.editeur" htmlEscape="false"/>
					<select id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>">
						<option value="-1" <c:if test="${status.value == editeur.id}">selected="selected"</c:if>><spring:message code="recherche.indifferent" htmlEscape="false"/></option>
						<c:forEach var="editeur" items="${editeurs}">
							<option value="<c:out value="${editeur.id}"/>" <c:if test="${status.value == editeur.id}">selected="selected"</c:if>><c:out value="${editeur.prenom}"/>&nbsp;<c:out value="${editeur.nom}"/></option>
						</c:forEach>
					</select>
					<br />
				</spring:bind>
			</div>
			<div class="menuVSep"><br /></div>
			<div class="menuVHeadRechercheElement">
				<spring:bind path="rechercheForm.designer">
					<spring:message code="leftMenuRecherche.designer" htmlEscape="false"/>
					<select id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>">
						<option value="-1" <c:if test="${status.value == editeur.id}">selected="selected"</c:if>><spring:message code="recherche.indifferent" htmlEscape="false"/></option>
						<c:forEach var="designer" items="${designers}">
							<option value="<c:out value="${designer.id}"/>" <c:if test="${status.value == designer.id}">selected="selected"</c:if>><c:out value="${designer.prenom}"/>&nbsp;<c:out value="${designer.nom}"/></option>
						</c:forEach>
					</select>
					<br />
				</spring:bind>
			</div>
			<div class="menuVSep"><br /></div>
			<div class="menuVHeadRechercheElement">
				<a class="bouton" href="#" onclick="document.getElementById('advancedSearch').submit()">
					<span><span><spring:message code="leftMenuRecherche.searchBtn"/></span></span>
				</a>
		 	</div>
		</div>
	</form>
</c:if>

