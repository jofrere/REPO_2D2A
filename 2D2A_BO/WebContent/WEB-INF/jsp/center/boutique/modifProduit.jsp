<%@ include file="../../head/include.jsp" %>

<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->
	<p class="b brown fs13 mt5">
		<c:choose>
			<c:when test="${produit.action == 5}">Modification d'un produit</c:when>
			<c:when test="${produit.action == 4}">Création d'un produit</c:when>
		</c:choose>
	</p>
	<!-- endTitleFiche -->
</div>
<div id="separationEnteteFiche"></div>
<!-- endEnteteFiche -->

<div id="ficheCorps">

	<form name="modifProduitForm" id="modifProduitForm" method="post" action="" enctype="multipart/form-data">
			<spring:bind path="produit.*">
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

		<spring:bind path="produit.proId">
			<input type="hidden" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>">
		</spring:bind>
		
		<spring:bind path="produit.action">
			<input type="hidden" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>">
		</spring:bind>
		
		<table class="formulaire">
			<col class="col1"/>
			<col class="col2"/>
			
			<tr>
				<td class="left title">Visibilité sur le site</td>
				<td class="right">&nbsp;</td>
			</tr>
			
			<tr>	
				<spring:bind path="produit.achatDepot">
					<td class="left">Achat/Dépot</td>
					<td class="right">
						<input type="radio" <c:if test="${status.value == 0}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="0"/>&nbsp;Achat 2D2A<br />
						<input type="radio" <c:if test="${status.value == 1}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="1"/>&nbsp;Dépôt 2D2A
					</td>
				</spring:bind>
			</tr>
			<tr>
				<td class="left">&nbsp;</td>
				<td class="right">&nbsp;</td>
			</tr>
			<tr>
				<spring:bind path="produit.visuLang">
					<td class="left">Visibilité</td>
					<td class="right">
						<input type="radio" <c:if test="${status.value == 0}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="0"/>&nbsp;Aucune visibilité<br />
						<input type="radio" <c:if test="${status.value == 1}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="1"/>&nbsp;Site Français<br />
						<input type="radio" <c:if test="${status.value == 2}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="2"/>&nbsp;Site Anglais<br />
						<input type="radio" <c:if test="${status.value == 3}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="3"/>&nbsp;Partout
					</td>
				</spring:bind>
			</tr>
			<tr>	
				<spring:bind path="produit.keyword">
					<td class="left">Référencement</td>
					<td class="right">
						<input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="100" maxlength="100"/>
					</td>
				</spring:bind>
			</tr>
			
			<tr>
				<td class="left">&nbsp;</td>
				<td class="right">&nbsp;</td>
			</tr>
			
			<tr>	
				<spring:bind path="produit.rubriquesId">
					<td class="left">Rubriques</td>
					<td class="right">
						<c:forEach var="rubrique" items="${listeRubrique}" varStatus="i">
							<c:forEach begin="1" end="${rubrique.depth}">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</c:forEach>
							<input type="checkbox" <c:forEach var="rub" items="${produit.rubriques}"><c:if test="${rub.rubId == rubrique.rubId}">checked="checked"</c:if></c:forEach> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${rubrique.rubId}"/>"/>&nbsp;<c:out value="${rubrique.nom}"/><br />
						</c:forEach>
					</td>
				</spring:bind>
			</tr>
			
			<tr>
				<td class="left">&nbsp;</td>
				<td class="right">&nbsp;</td>
			</tr>
			
			<tr>
				<td class="left title">Description du produit</td>
				<td class="right">&nbsp;</td>
			</tr>
			
			<tr>	
				<spring:bind path="produit.reference">
					<td class="left">Référence</td>
					<td class="right">
						<input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="10" maxlength="10"/>
					</td>
				</spring:bind>
			</tr>
			<tr>	
				<spring:bind path="produit.nom">
					<td class="left">Nom de l'aticle</td>
					<td class="right">
						<input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="50" maxlength="50"/>
					</td>
				</spring:bind>
			</tr>
			
			<tr>	
				<spring:bind path="produit.description">
					<td class="left">Description</td>
					<td class="right">
						<textarea rows="4" cols="70" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>"><c:out value="${status.value}"/></textarea>
					</td>
				</spring:bind>
			</tr>
			
			<tr>	
				<spring:bind path="produit.desId">
					<td class="left">Designer</td>
					<td class="right">
						<select id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>">
							<c:forEach var="designer" items="${listeDesigner}">
							Ma valeur == <c:out value="${status.value}"/>
							La courante =<c:out value="${designer.id}"/>= 
								<option value="<c:out value="${designer.id}"/>" <c:if test="${status.value == designer.id}">selected="selected"</c:if>><c:out value="${designer.prenom}"/>&nbsp;<c:out value="${designer.nom}"/></option>
							</c:forEach>
						</select>
					</td>
				</spring:bind>
			</tr>
			<tr>	
				<spring:bind path="produit.ediId">
					<td class="left">Editeur</td>
					<td class="right">
						<select id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>">
							<c:forEach var="editeur" items="${listeEditeur}">
								<option value="<c:out value="${editeur.id}"/>" <c:if test="${status.value == editeur.id}">selected="selected"</c:if>><c:out value="${editeur.prenom}"/>&nbsp;<c:out value="${editeur.nom}"/></option>
							</c:forEach>
						</select>
					</td>
				</spring:bind>
			</tr>
			<tr>	
				<spring:bind path="produit.materiaux">
					<td class="left">Matériaux</td>
					<td class="right">
						<input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="100" maxlength="100"/>
					</td>
				</spring:bind>
			</tr>
			<tr>	
				<spring:bind path="produit.poids">
					<td class="left">Poids</td>
					<td class="right">
						<input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="6" maxlength="6"/> kg.
					</td>
				</spring:bind>
			</tr>
			<tr>	
				<spring:bind path="produit.hauteur">
					<td class="left">Hauteur</td>
					<td class="right">
						<input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="6" maxlength="6"/> cm.
					</td>
				</spring:bind>
			</tr>
			<tr>	
				<spring:bind path="produit.largeur">
					<td class="left">Largeur</td>
					<td class="right">
						<input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="6" maxlength="6"/> cm.
					</td>
				</spring:bind>
			</tr>
			<tr>	
				<spring:bind path="produit.profondeur">
					<td class="left">Prodondeur</td>
					<td class="right">
						<input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="6" maxlength="6"/> cm.
					</td>
				</spring:bind>
			</tr>
			<tr>	
				<spring:bind path="produit.diametre">
					<td class="left">Diamètre</td>
					<td class="right">
						<input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="6" maxlength="6"/> cm.
					</td>
				</spring:bind>
			</tr>
			<tr>	
				<spring:bind path="produit.colorisId">
					<td class="left">Coloris</td>
					<td class="right">
						<c:forEach var="coloris" items="${listeColoris}">
							<input type="checkbox" <c:forEach var="col" items="${produit.coloris}"><c:if test="${col.colId == coloris.colId}">checked="checked"</c:if></c:forEach> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${coloris.colId}"/>"/>&nbsp;<img src="/${ROOT}/<c:out value="${coloris.picto}"/>" width="50" height="15" border="0"/>&nbsp;<c:out value="${coloris.nom}"/><br />
						</c:forEach>
					</td>
				</spring:bind>
			</tr>
			<tr>
				<td class="left">&nbsp;</td>
				<td class="right">&nbsp;</td>
			</tr>
			<tr>	
				<spring:bind path="produit.specId">
					<td class="left">Spécificité produit</td>
					<td class="right">
						<c:forEach var="spec" items="${listeSpec}">
							<input type="checkbox" <c:forEach var="spe" items="${produit.specs}"><c:if test="${spe.speId == spec.speId}">checked="checked"</c:if></c:forEach> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${spec.speId}"/>"/>&nbsp;<c:out value="${spec.nom}"/><br />
						</c:forEach>
					</td>
				</spring:bind>
			</tr>
			<tr>
				<spring:bind path="produit.descAnnee">
					<td class="left">Année</td>
					<td class="right">
						<input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
					</td>
				</spring:bind>
			</tr>
			<tr>	
				<spring:bind path="produit.paysId">
					<td class="left">Pays</td>
					<td class="right">
						<select id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>">
							<c:forEach var="pays" items="${listePays}">
								<option value="<c:out value="${pays.payId}"/>" <c:if test="${status.value == pays.payId}">selected="selected"</c:if>><c:out value="${pays.nom}"/></option>
							</c:forEach>
						</select>
					</td>
				</spring:bind>
			</tr>
			
			<tr>	
				<spring:bind path="produit.signeApp">
					<td class="left">Signes apparents</td>
					<td class="right">
						<textarea rows="4" cols="70" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>"><c:out value="${status.value}"/></textarea>
					</td>
				</spring:bind>
			</tr>
			<tr>	
				<spring:bind path="produit.information">
					<td class="left">Informations</td>
					<td class="right">
						<textarea rows="4" cols="70" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>"><c:out value="${status.value}"/></textarea>
					</td>
				</spring:bind>
			</tr>
			
			<tr>
				<td class="left">&nbsp;</td>
				<td class="right">&nbsp;</td>
			</tr>
				
			<tr>
				<td class="left title">Vente du produit</td>
				<td class="right">&nbsp;</td>
			</tr>
			
			<tr>
				<spring:bind path="produit.dateEntreeStr">
					<td class="left">Date d'entrée <i><small>(jj/mm/yyyy)</small></i></td>
					<td class="right">
						<input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="6" maxlength="50"/>
					</td>
				</spring:bind>
			</tr>
			<tr>	
				<spring:bind path="produit.prix">
					<td class="left">Prix</td>
					<td class="right">
						<input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
					</td>
				</spring:bind>
			</tr>
			<tr>	
				<spring:bind path="produit.prixAchat">
					<td class="left">Prix d'achat</td>
					<td class="right">
						<input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
					</td>
				</spring:bind>
			</tr>
			<tr>	
				<spring:bind path="produit.prixLoc">
					<td class="left">Prix location</td>
					<td class="right">
						<input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="30" maxlength="50"/>
					</td>
				</spring:bind>
			</tr>
			<tr>	
				<spring:bind path="produit.quantite">
					<td class="left">Quantité</td>
					<td class="right">
						<input type="text" id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" size="6" maxlength="3"/>
					</td>
				</spring:bind>
			</tr>
			<tr>	
				<spring:bind path="produit.dispoLoc">
					<td class="left">Vente/Location</td>
					<td class="right">
						<input type="radio" <c:if test="${status.value == 0}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="0"/>Aucun<br />
						<input type="radio" <c:if test="${status.value == 1}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="1"/>Vente<br />
						<input type="radio" <c:if test="${status.value == 2}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="2"/>Location<br />
						<input type="radio" <c:if test="${status.value == 3}">checked="checked"</c:if> id="<c:out value="${status.expression}"/>" name="<c:out value="${status.expression}"/>" value="3"/>Les deux
					</td>
				</spring:bind>
			</tr>
			<tr>
				<td class="left">Photos</td>
				<td class="right">			
					<span id="modifProduit">
				
						<c:forEach var="image" items="${produit.images}" varStatus="i">
							<p>
								<spring:bind path="produit.images[${i.index}].photo">
									Image actuelle <img id="<c:out value="${status.expression}"/>" src="/${ROOT}/<c:out value="${status.value}"/>" style="border:1px; border-style:solid;border-color:#5a2041;" width="400" height="400" />
									<input type="hidden" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/><br />
								</spring:bind>
								<spring:bind path="produit.images[${i.index}].photoFile">
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
						<a onclick="document.getElementById('modifProduitForm').submit();" class="bouton" href="#" title="Valider"><span><span>Valider</span></span></a>
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
				
				<%--
				<span id="modifProduit">
				
					<c:forEach var="image" items="${produit.images}" varStatus="i">
						<p style="clear: left;">
							<spring:bind path="produit.images[${i.index}].photo">
								<label class="label" for="<c:out value="${status.expression}"/>">Image actuelle</td>
								<img style="float: left;" id="<c:out value="${status.expression}"/>" src="/${ROOT}/<c:out value="${status.value}"/>"/>
								<input type="hidden" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
							</spring:bind>
							<spring:bind path="produit.images[${i.index}].photoFile">
								<label class="label" for="<c:out value="${status.expression}"/>">Modifier : </td>
								<input style="float: left;" type="file" id="<c:out value="${i.index}"/>" name="<c:out value="${status.expression}"/>" size="30" maxlength="100" />
								<img src="/${ROOT}/resources/img/picto_site/delete.gif" onclick="deleteField(event);"/>
							</spring:bind>
						</td>
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
								
					<p style="clear: left;">
						<label class="label" for="images[${last}].photoFile">Ajouter : </td>
						<input style="float: left;" type="file" id="<c:out value="${last}"/>" name="images[${last}].photoFile" size="30" maxlength="100" />
					</td>
				</span>
				<br />
				
				
				<p>
					<c:set var="found" value="0" scope="page"/>
					<!-- CHANGE -->
					
					<select id="source"  size="10" class="multipleSelect" ondblclick="Add();" multiple="multiple">				
						<c:forEach var="prod" items="${listeProduit}">
							<c:if test="${prod.proId != produit.proId}">
								<c:forEach var="p" items="${produit.produitsAssociated}">
									<c:if test="${p.proId == prod.proId}">
										<c:set var="found" value="1" scope="page"/>
									</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${found == 0 && prod.proId != produit.proId}">
								<option  value="<c:out value="${prod.proId}"/>"><c:out value="${prod.nom}"/></option>
							</c:if>
							<c:set var="found" value="0" scope="page"/>
						</c:forEach>
					</select>			
			
					<!-- buttons -->
					<input type="button" value="-->" onclick="Add();">
					<input type="button" value="<--" onclick="Del();">
		
					<!-- Multiple select cible -->
					<spring:bind path="produit.prodsAssocId">
					  	<select name="prodsAssocId"  id="cible" size="10" class="multipleSelect" ondblclick="Del();" multiple="multiple">
					  		<c:forEach var="prod" items="${listeProduit}">
					  			<c:if test="${prod.proId != produit.proId}">
					  				<c:forEach var="p" items="${produit.produitsAssociated}">
										<c:if test="${p.proId == prod.proId}">
											<c:set var="found" value="1" scope="page"/>								
										</c:if>
									</c:forEach>
								</c:if>
								<c:if test="${found == 1}">
									<option value="<c:out value="${prod.proId}"/>"><c:out value="${prod.nom}"/></option>
								</c:if>
								<c:set var="found" value="0" scope="page"/>
							</c:forEach>
					  	</select>
					</spring:bind>
						<!-- END CHANGE -->
				</td>
				
			
				<div align="center">
					<input type="submit" name="Valider" value="Valider" onClick="forceSelectProdsAssocId();"/>
				</div>
			--%>
		