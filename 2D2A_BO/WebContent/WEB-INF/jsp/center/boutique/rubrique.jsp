<%@ include file="../../head/include.jsp" %>

<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->
	<p class="b brown fs13 mt5">Gestion des Boutiques</p>
	<!-- endTitleFiche -->
</div>
<div id="separationEnteteFiche"></div>
<!-- endEnteteFiche -->

<div id="ficheCorps">
	<table class="formulaire">
		<col class="col1_Back"/>
		<col class="col1_Back"/>
		<col/>
		<tr>
			<th>Boutique</th>
			<th>Visible</th>
			<th>Actions</th>		
		</tr>
		<tr><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td class="back">&nbsp;</td></tr>
		<c:forEach var="rubrique" items="${rubriques1}">
			<tr>
				<td class="back" width="80%">
					<c:forEach begin="1" end="${rubrique.depth}">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</c:forEach>
					<form style="display: inline;" name="selectRubrique_<c:out value="${rubrique.rubId}"/>" id="selectRubrique_<c:out value="${rubrique.rubId}"/>" action="" method="POST">
						<input type="hidden" name="rubId" value="<c:out value="${rubrique.rubId}"/>"/>
						<input type="hidden" name="action" value="4"/>
						<input type="hidden" name="rootParent" value="-1"/>
					</form>
					<a class="aBack" href="#" id="rubrique" onclick="document.selectRubrique_<c:out value="${rubrique.rubId}"/>.submit();"><c:out value="${rubrique.nom}"/></a>
				</td>
				
				<td class="back" width="7%">
					<c:if test="${rubrique.visible == 0}">NON</c:if>
					<c:if test="${rubrique.visible == 1}">OUI</c:if>
				</td>
							
				<td class="back" width="13%">
					<form name="addRubrique_<c:out value="${rubrique.rubId}"/>" action="./modifRubrique.htm" method="POST">
						<input type="hidden" name="rubId" value="<c:out value="${rubrique.rubId}"/>"/>
						<input type="hidden" name="action" value="1"/>
					</form>
					
					<form name="modifRubrique_<c:out value="${rubrique.rubId}"/>" action="./modifRubrique.htm" method="POST">
						<input type="hidden" name="rubId" value="<c:out value="${rubrique.rubId}"/>"/>
						<input type="hidden" name="action" value="2"/>
					</form>
				
					<form name="delRubrique_<c:out value="${rubrique.rubId}"/>" action="./modifRubrique.htm" method="POST">
						<input type="hidden" name="rubId" value="<c:out value="${rubrique.rubId}"/>"/>
						<input type="hidden" name="action" value="3"/>
					</form>
					
					<a href="#" onclick="document.addRubrique_<c:out value="${rubrique.rubId}"/>.submit();"><img src="/${ROOT}/resources/pic/panier/add.jpg" width="15%" border="0"/></a>&nbsp;&nbsp;
					<a href="#" onclick="document.modifRubrique_<c:out value="${rubrique.rubId}"/>.submit();"><img src="/${ROOT}/resources/pic/panier/edit.gif" border="0"/></a>&nbsp;&nbsp;
					<c:if test="${rubrique.rub_rubId != -1}">
						<a href="#" onclick="if (confirm('Etes-vous certain de vouloir supprimer cette rubrique ?\nAttention, ses sous-rubriques seront-elles aussi supprimées.')) eval('document.delRubrique_<c:out value="${rubrique.rubId}"/>.submit();')"><img src="/${ROOT}/resources/pic/panier/corbeille.gif" border="0"/></a>
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>




<%--
<c:forEach var="rubrique" items="${rubriques2}">
			<tr>
				
				<td class="back">
					
					<c:forEach begin="1" end="${rubrique.depth}">
						&nbsp;&nbsp;-&nbsp;&nbsp;
					</c:forEach>
					<form style="display: inline;" name="selectRubrique_<c:out value="${rubrique.rubId}"/>" id="selectRubrique_<c:out value="${rubrique.rubId}"/>" action="" method="POST">
						<input type="hidden" name="rubId" value="<c:out value="${rubrique.rubId}"/>"/>
						<input type="hidden" name="action" value="4"/>
						<input type="hidden" name="rootParent" value="-3"/>
						<a href="#" id="rubrique" onclick="document.selectRubrique_<c:out value="${rubrique.rubId}"/>.submit();"><c:out value="${rubrique.nom}"/></a>
					</form>
					
				</td>
				
				<td class="back">
					<c:if test="${rubrique.visible == 0}">NON</c:if>
					<c:if test="${rubrique.visible == 1}">OUI</c:if>
				</td>
							
				<td class="back">
					<form name="addRubrique_<c:out value="${rubrique.rubId}"/>" action="./modifRubrique.htm" method="POST">
						<input type="hidden" name="rubId" value="<c:out value="${rubrique.rubId}"/>"/>
						<input type="hidden" name="action" value="1"/>
						<a href="#" onclick="document.addRubrique_<c:out value="${rubrique.rubId}"/>.submit();"><img src="/${ROOT}/resources/img/picto_site/add.gif" border="0"/></a>
					</form>
				</td>
				<td class="back">
					<form name="modifRubrique_<c:out value="${rubrique.rubId}"/>" action="./modifRubrique.htm" method="POST">
						<input type="hidden" name="rubId" value="<c:out value="${rubrique.rubId}"/>"/>
						<input type="hidden" name="action" value="2"/>
						
						<a href="#" onclick="document.modifRubrique_<c:out value="${rubrique.rubId}"/>.submit();"><img src="/${ROOT}/resources/img/picto_site/edit.gif" border="0"/></a>
					</form>
				</td>
				<td class="back">
					<form name="delRubrique_<c:out value="${rubrique.rubId}"/>" action="./modifRubrique.htm" method="POST">
						<input type="hidden" name="rubId" value="<c:out value="${rubrique.rubId}"/>"/>
						<input type="hidden" name="action" value="3"/>
						
						<a href="#" onclick="if (confirm('Etes-vous certain de vouloir supprimer cette rubrique ?\nAttention, ses sous-rubriques seront-elles aussi supprimées.')) eval('document.delRubrique_<c:out value="${rubrique.rubId}"/>.submit();')"><img src="/${ROOT}/resources/img/picto_site/delete.gif" border="0"/></a>
					</form>
				</td>
			</tr>
		</c:forEach>


 --%>
