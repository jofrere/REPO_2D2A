<%@ include file="../../head/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">

	<!-- Head -->
  	<jsp:include page="../../head/head.jsp" />
  	<!-- Fin Head -->
  	
  	<!-- Body -->
  	
  	<body>
  		<div id="globalPopup">
	  		<div id="spacePopup">
				<%--<img src="/${ROOT}/resources/pic/gabarit/head.png" width="800" height="50" alt="head" />--%>
	  			
				<!-- startContent -->
				
				<div id="contentPopup">
					<!-- startHeader -->
					<div id="headerPopup">
					  	<jsp:include page="../../header/header.jsp" />
					</div>
					<!-- endHeader -->
					
					<!-- startSeparator -->
				    <div class="XP"></div> 
					<!-- endSeparator -->
			  	    
			  	    <!-- start center -->
				    <div id="corpsPopup">
			    		<c:if test="${empty FONCTIONAL}">
			    			<jsp:include page="../../center/membre/conditionsGenerales.jsp" />
			    		</c:if>
			  	    </div>	
			  	    <!-- fin center -->
				</div>
				<!-- endContent -->
				<p class="XP"></p>
			</div>
			
			<!-- startFooter -->
			<%--<img src="/${ROOT}/resources/pic/gabarit/footer.png" width="800" height="50" alt="head" />--%>
			<!-- endFooter -->
		</div>
	</body>
</html>





