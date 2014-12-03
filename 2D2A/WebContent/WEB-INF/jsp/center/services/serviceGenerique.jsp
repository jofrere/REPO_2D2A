<%@ include file="../../head/include.jsp" %>

<script type="text/javascript" src="/${ROOT}/resources/js/inscription.js"></script> 

<tr>
	<td class="left space">&nbsp;</td>
	<td class="right">&nbsp;</td>
	
</tr>

<tr>
	
	<td class="left title"><spring:message code="service.general.info" /></td>
	<td class="right"><small><spring:message code="service.general.expInfo" /></small></td>

</tr>
			
<!-- ADRESSES PROFESSIONNELLE -->
<tr>
	<spring:bind path="service.organisationPro">
		<td class="left">
 					<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="service.general.organisation" /><c:if test="${status.error}"></span></c:if>
		</td>
		<td class="right"><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/></td>
	</spring:bind>	
</tr>

<tr>
	<td class="left"><spring:message code="service.general.directionPro" /></td>
	<td class="right">
		<spring:bind path="service.directionPro">
    		<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
  		</spring:bind>
	</td>
</tr>

<tr>
	<spring:bind path="service.adressePro">
		<td class="left">
 					<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="inscription.coordonnees.adresse" /><c:if test="${status.error}"></span></c:if>
		</td>
		<td class="right"><input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/></td>
	</spring:bind>	
</tr>

<tr>
	<td class="left"><spring:message code="inscription.coordonnees.adresseCplt" /></td>
	<td class="right">
		<spring:bind path="service.complementAdressePro">
    		<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
  			</spring:bind>
	</td>
</tr>

<tr>
	 <spring:bind path="service.codePostalPro">
		<td class="left">
  				<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="inscription.coordonnees.codePostal" /><c:if test="${status.error}"></span></c:if>
		</td>
		<td class="right">
			<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
		</td>
	 </spring:bind>
</tr>

<tr>
	<spring:bind path="service.villePro">
		<td class="left">
		   	<c:if test="${status.error}"><span id="obligatoire"></c:if><spring:message code="inscription.coordonnees.ville" /><c:if test="${status.error}"></span></c:if>
		</td>
		<td class="right">
			<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
		</td>
	</spring:bind>
</tr>

<tr>
	<td class="left"><spring:message code="service.general.sadresser" /></td>
	<td class="right">
		<spring:bind path="service.sadresserPro">
    		<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
    	</spring:bind>
	</td>
</tr>

<tr>
	<td class="left"><spring:message code="inscription.coordonnees.telBureau" /></td>
	<td class="right">
		<spring:bind path="service.telPro">
 					<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
    	</spring:bind>
	</td>
</tr>

<tr>
	<td class="left"><spring:message code="inscription.coordonnees.fax" /></td>
	<td class="right">
		<spring:bind path="service.faxPro">
    		<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
    	</spring:bind>
	</td>
</tr>

<tr>
	<td class="left space"><spring:message code="service.general.siteInternet" /></td>
	<td class="right">
		<spring:bind path="service.sitePro">
    		<input class="field"  type="text" name="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>"/>
    	</spring:bind>
	</td>
</tr>
<!-- END ADRESSES -->
	
