<%@ include file="../../head/include.jsp" %>

<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->
	<p class="b brown fs13 mt5">Modification d'une page libre</p>
	<!-- endTitleFiche -->
</div>
<div id="separationEnteteFiche"></div>
<!-- endEnteteFiche -->

<div id="ficheCorps">
	<form name="freeTemplate" id="freeTemplate" method="post" action="">
		
		<input type="hidden" name="id" value="<c:out value="${id}"/>">
		<input type="hidden" name="action" value="1">
		
		<table class="formulaire">
			<col class="col1"/>
			<col class="col2"/>
			
			<tr>
				<td class="left">Contenu de la page</td>
				<td class="right"><textarea rows="40" cols="160" id="contenu" name="contenu" style="width: 600px"><c:out value="${contenu}"/></textarea></td>
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
						<a onclick="document.getElementById('freeTemplate').submit();" class="bouton" href="#" title="Valider"><span><span>Valider</span></span></a>
					<br/>
					<br/>
					<br/>
				</td>
			</tr>
		</table>
	</form>
</div>


