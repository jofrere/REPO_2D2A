<%@ include file="../../head/include.jsp" %>
<script type="text/javascript" src="/${ROOT}/resources/js/print.js"></script> 


<div id="enteteFiche">
     <c:if test="${empty param['imprimer']}">
        <div id="actionPagePopup">
    	    <a href="#" onclick="javascript:imprime_zone('Imprimer', 'ficheCorps', window.location);" class="imprimer" title="Imprimer" style="align:center;"></a>
	    </div>
	</c:if>
</div>

<!-- startCorpsFiche -->
<div id="ficheCorpsPopup">
	<c:out value="${conditionsGenerales}" escapeXml="false"/>
	<br />
	<br />
	<p align="center"><a class="bouton" href="#" onclick="window.close();" title="Valider"><span><span><spring:message code="conditionsGenerales.close" /></span></span></a></p>
</div>
