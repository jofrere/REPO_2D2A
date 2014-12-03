<%@ include file="../../head/include.jsp" %>
 
<div>
	<div class="menu_title">ACTUALITES</div>
	<the2D2A:menu varRetour="menu" idParent="-3" typeRubrique="2"/>
	<c:out value="${menu}" escapeXml="false"/>
</div>

<script type="text/javascript">
    initMenu("menu");    
</script>