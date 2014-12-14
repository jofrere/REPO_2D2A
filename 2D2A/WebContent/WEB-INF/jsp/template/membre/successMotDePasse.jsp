<%@ include file="../../head/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">

	<!-- Head -->
  	<jsp:include page="../../head/head.jsp" />
  	<!-- Fin Head -->
  	
  	<!-- Body -->
  	
  	<body>
  		<div id="global">
	  		
	  		<c:if test="${not empty sessionScope.AUTHENTICATED_MEMBER && empty no_auth}">
	  			<jsp:include page="../../header/headerMember.jsp"/>
	  		</c:if>
			
			<div id="space">
				<img src="/${ROOT}/resources/pic/gabarit/head.png" width="1245" height="50" alt="head" />
				<!-- startContent -->
				<div id="content">
					<!-- startHeader -->
					<div id="header">
					  	<jsp:include page="../../header/header.jsp" />
					</div>
					<!-- endHeader -->
		
					<!-- startMenuH -->
		        	<jsp:include page="../../top_menu/top_menu.jsp" />
			    	<!-- endMenuH -->
				
					<!-- startSeparator -->
			    	<div class="XP"></div> 
					<!-- endSeparator -->
				 
				 	<!-- left_menu -->
				  	<div id="left_menu">		  	    	
				  	   	<jsp:include page="../../left_menu/left_menu_monCompte.jsp" />
				  	</div>	
				  	<!-- fin left_menu -->
				  	
				  	<!-- start fil Ariane -->
			  	    <div class="crawlBar">
				  	    <jsp:include page="../../center/filAriane.jsp" />
			  	    </div>
			  	    <!-- end fil Ariane -->
			  	    
			  	        
				  	<!-- start center -->
					<div id="corps">
						<jsp:include page="../../center/membre/successMotDePasse.jsp" />
			  	    </div>	
			  	    <!-- fin center -->  	    
				</div>
				<!-- endContent -->
				<p class="XP"></p> 
			</div>
			
			<!-- startFooter -->
			<div id="footer">
				<jsp:include page="../../footer/footer.jsp" />
			</div>
			<img id="imgFooter" src="/${ROOT}/resources/pic/gabarit/footer.png" width="1245" height="50" alt="head" />
			<!-- endFooter -->
		</div>
	</body>
</html>