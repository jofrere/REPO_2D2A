<%@ include file="../head/include.jsp" %>

<c:if test="${empty param['imprimer']}">
	
	<%@page import="fr.the2d2a.utils.DebugUtils"%>
	
	<c:choose>
		<%-- Connecté --%>
		<c:when test="${not empty sessionScope.AUTHENTICATED_MEMBER && empty no_auth}">
			<!-- startZoneConnexion -->
			<div id="member">
			     <div id="memberbutton"><a href="/${ROOT}/inviterAmi.htm" title="Inviter un ami"><img src="/${ROOT}/resources/pic/gabarit/inviteFriend.jpg" width="52" height="54" alt="inviter un ami" /></a>
				     <br/>
				     <a href="/${ROOT}/inviterAmi.htm" title="Inviter un ami" class="L magenta"><span class="magenta"><spring:message code="topMenu.inviteFriend"/></span></a>
				</div>
			</div>		
		</c:when>
		<%-- Non Connecté --%>
		<c:otherwise>
			<c:if test="${empty no_auth}">
				<!-- startZoneConnexion -->
				<div id="member">
				     <div id="memberbutton"><a href="/${ROOT}/devenirMembre.htm" title="Devenir Membre"><img src="/${ROOT}/resources/pic/gabarit/inviteFriend.jpg" width="52" height="54" alt="Devenir membre" /></a>
				     <br/>
				     <a href="/${ROOT}/devenirMembre.htm" title="Devenir Membre" class="L magenta"><span class="magenta"><spring:message code="topMenu.beMember"/></span></a>
					</div>
				   <!-- startformulaireLogin -->
				   <%-- TODO: Messages d'erreur à intégrer (de ci-dessus) --%>
					<div id="loginMember">
					  	<form id="loginMemberForm" method="post" action="">
					         <div id="loginMemberFormDiv">
					             <div id="loginMemberEMail">
					             	<label for="loginEmail"><span><spring:message code="header.login" /></span></label>
					                   <span><input id="loginEmail" name="loginAuth" value="" class="maclasse" type="text"/></span>
					               	</div>
					               	<input id="loginOkButton" type="button" name="connecter" value=" " onclick="document.getElementById('auth_action').value=0;document.getElementById('loginMemberForm').submit();"/> 
									<div id="loginMemberPassword">
					               	<label for="loginPassword"><span><spring:message code="header.password" /></span></label>
					    				 <span><input id="loginPassword" name="passwordAuth" value="" class="maclasse" type="password"/></span>
					    				 <input type="hidden" name="actionAuth" id="auth_action" value="" />
									</div>
					             <div id="loginForgotPassword">(<a href="/${ROOT}/monCompte.htm" class="L brown"><span class="brown"><spring:message code="header.missPassword"/></span></a>)</div>
					         </div>
					     </form>
					 </div>
					 <!-- endformulaireLogin -->
				</div>
			</c:if>
		</c:otherwise>
	</c:choose>
</c:if>
<!-- endZoneConnexion -->
<div id="logoAndUnivers">
    <a href="/${ROOT}/accueil.htm" title="Accueil"><img class="fl" src="/${ROOT}/resources/pic/gabarit/logo.jpg" width="276" height="92" alt="logo 2d2a" /></a>
 	<%-- Fonctionalités à ajouter via gestion BO
 	<c:if test="${empty no_auth}">
 		<img src="/${ROOT}/resources/pic/gabarit/univers1.jpg" width="323" height="92" alt="univers" />
 	</c:if>--%>
</div>
