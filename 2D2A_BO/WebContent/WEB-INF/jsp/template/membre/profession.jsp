<%@ include file="../../head/include.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">

	<!-- Head -->
  	<jsp:include page="../../head/head.jsp" />
  	<!-- Fin Head -->
  	
  	<!-- Body -->
  	<body>
  		<div id="global">
  	
	  		<div id="space">
				<img src="/${ROOT}/resources/pic/gabarit/head.png" width="1245" height="50" alt="head" />
				<!-- startContent -->
				<div id="content">
	  		
		  		<div id="header">
		  			<jsp:include page="../../header/header.jsp" />
		  		</div>
		  			  		
		  	    <!-- top_menu -->
		  	    <jsp:include page="../../top_menu/top_menu.jsp" />
		  	    <!-- fin top_menu -->
		  	    
		  	    <!-- startSeparator -->
				<div class="XP"></div> 
				<!-- endSeparator -->
		  	    
		  	    <!-- left_menu -->
		  	    <div id="left_menu">		  	    	
		  	    	<jsp:include page="../../left_menu/membre/left_menu.jsp" />
		  	    </div>	
		  	    <!-- fin left_menu -->
		  	    
		  	    <!-- start center -->
				<div id="corps">
					<jsp:include page="../../center/membre/profession.jsp" />
				</div>	
				<!-- fin center -->  	    
			</div>
			<!-- endContent -->
			<p class="XP"></p> 
		</div>
		<!-- fin page -->
  </body>
  <!-- Fin body -->
</html>

