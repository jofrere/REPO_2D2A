<%@ include file="../head/include.jsp" %>

<c:if test="${empty param['imprimer']}">
	<div id="menuV" class="menuV">
	
		<div class="menuVSep"><br /></div>
			<ul class="menuVDeroulant">
				<c:forEach var="acc" items="${accueils}">
					<li <c:if test="${accueilId == acc.accId}">class="sel"</c:if>><a href="/${ROOT}/${acc.friendlyName}/accueil.htm"><c:out value='${acc.logoAccueil}'/></a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
</c:if>


