<%@ include file="../head/include.jsp" %>

<html>
	<!-- Head -->
  	<jsp:include page="../head/head.jsp" />
  	<!-- Fin Head -->
  	
  	<!-- Body -->
  	<body>
  		<div id="global">
  	
	  		<div id="space">
				<img src="/${ROOT}/resources/pic/gabarit/head.png" width="1245" height="50" alt="head" />
				<!-- startContent -->
				<div id="content">
	  		
			  		<div id="header">
			  			<jsp:include page="../header/header.jsp" />
			  		</div>		  	    
			  	    
			  	    <!-- startSeparator -->
					<div class="XP"></div> 
					<!-- endSeparator -->
			  	    
			  	    
			  	    
			  	    <!-- start center -->
					<div id="corps">
						<!-- startEnteteFiche -->
						<div id="enteteFiche">
							<!-- startTitleFiche -->
							<p class="b brown fs13 mt5">
								Authentification
							</p>
							<!-- endTitleFiche -->
						</div>
						<div id="separationEnteteFiche"></div>
						<!-- endEnteteFiche -->
						
						<div id="ficheCorps">
							<form name="authenticationForm" id="authenticationForm"  method="POST" action="">
					    	<table class="formulaire">
							<col class="col1"/>
							<col class="col2"/>	
					    	
						    	<c:if test="${not empty errors}">
						    		<tr>
						    			<td colspan="2" align="center">
									    		<span style="color: red; border: solid red 1px;">		        		
									        		<c:out value="${errors}"/>	        		
								        		</span>
						        		</td>
						        	</tr>
				    			</c:if>
					    	
					    		<tr>
					    			<td class="left title">
						    			Veuillez-vous identifier
						    		</td>
						    		<td class="right">&nbsp;</td>
						    	</tr>
						    	<tr>
					    			<td class="left">&nbsp;</td>
						    		<td class="right">&nbsp;</td>
						    	</tr>
						    	<tr>
					    			<td class="left">
						    			Nom d'utilisateur
						    		</td>
						    		<td class="right">	    		
						    			<input type="text" name="login" />
						    		</td>
							    </tr>
							    <tr>
						    		<td class="left">
							    		Mot de passe
							    	</td>
							    	<td class="right">
						    			<input type="password" name="pwd" />
						    		</td>
						    	</tr>
						    	<tr>
									<td class="left noborder"></td>
									<td class="right pt20">
										<span class="pl20 pr20"></span>
										<span class="pl20 pr20"></span>
										<span class="pl20 pr20"></span>
										<span class="pl20 pr20"></span>
											<a onclick="document.getElementById('authenticationForm').submit();" class="bouton" href="#" title="Valider"><span><span>Valider</span></span></a>
										<br/>
										<br/>
										<br/>
									</td>
								</tr>
					    	</table>
					    	</form>
				  	    </div>	
					</div>	
					<!-- fin center -->  	    
				</div>
				<!-- endContent -->
				<p class="XP"></p> 
			</div>
			<!-- fin page -->  	
  		</div>
  	</body>
</html>