<%@ include file="../../head/include.jsp" %>


<script type="text/javascript" src="/${ROOT}/resources/js/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript">
tinyMCE.init({
	// General options
	mode : "textareas",
	theme : "advanced",
	plugins : "safari,spellchecker,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,imagemanager,filemanager",

	// Theme options
	theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,formatselect,fontselect,fontsizeselect",
	theme_advanced_buttons2 : "forecolor,backcolor,|cut,copy,paste,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,cleanup,|,insertdate,inserttime,preview,|hr,charmap,iespell,|,ltr,rtl,|,fullscreen,|nonbreaking",
	theme_advanced_buttons3 : "",
	theme_advanced_buttons4 : "",
	theme_advanced_toolbar_location : "top",
	theme_advanced_toolbar_align : "left",
	theme_advanced_statusbar_location : "bottom",
	theme_advanced_resizing : true,

	// Example content CSS (should be your site CSS)
	content_css : "css/example.css",

	// Drop lists for link/image/media/template dialogs
	template_external_list_url : "js/template_list.js",
	external_link_list_url : "js/link_list.js",
	external_image_list_url : "js/image_list.js",
	media_external_list_url : "js/media_list.js",

	// Replace values for the template plugin
	template_replace_values : {
		username : "Some User",
		staffid : "991234"
	}
});
</script>


<link id="global" rel="Stylesheet" type="text/css" href="/${ROOT}/resources/css/form.css" media="all" />

<c:choose>
	<c:when test="${lang == 'EN'}">
		<center><a href="./conditionsGenerales.htm" title="Passer en Français"><img src="/${ROOT}/resources/img/global/FR.gif" border="0" width="40" height="20" alt="Passer en Français"/></a></center>
	</c:when>
	<c:otherwise>
		<center><a href="./conditionsGenerales.htm?lang=EN" title="Passer en Anglais"><img src="/${ROOT}/resources/img/global/EN.gif" border="0" width="40" height="20" alt="Passer en Anglais"/></a></center>
	</c:otherwise>
</c:choose>

<form name="conditionsGenerales" method="post" action="">
	<fieldset>
		<legend>Modification des conditions Générales</legend>
		
		<input type="hidden" name="lang" value="<c:out value="${lang}"/>"/> 
		
		<p>
			<label class="label" for="contenu">Conditions</label>
			<textarea rows="30" cols="80" id="contenu" name="contenu"><c:out value="${contenu}"/>
			</textarea>
		</p>	
		
		<div align="center">
			<input type="submit" name="Valider" value="Valider"/>
		</div>
		
		
	</fieldset>
</form>


