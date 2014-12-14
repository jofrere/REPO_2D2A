   
		function Add() {
			var sourceLength = document.all("source").length;
			var cibleLength = document.all("cible").length;
	  	var index = -1;
	    var txtElem = "";
	   
	    for(i = 0; i < document.all("source" ).length; i++) {
	   		if (document.all("source" ).options[i].selected)
		   	{
	     		index = i;
	     		txtElem = document.all("source" ).options[i].text;
	      }
	    }
	    if (sourceLength != 0 && index != -1) {
	      document.all("cible" ).options[cibleLength] = new Option(txtElem);
	      document.all("cible" ).options[cibleLength].name = document.all("source" ).options[index].name;
	      document.all("cible" ).options[cibleLength].value = document.all("source" ).options[index].value;
	      document.all("source" ).options[index] = null;
	      
	      cibleLength = cibleLength + 1;
	      sourceLength = sourceLength - 1;
	    }
    }
   
    function Del(){
    	var sourceLength = document.all("source").length;
			var cibleLength = document.all("cible").length;
    	var index = -1;
	    var txtElem = "";

	    for(i = 0; i < document.all("cible" ).length; i++) {
	      if (document.all("cible" ).options[i].selected) {
			     index = i;
			     txtElem = document.all("cible" ).options[i].text;
	      }
	    }
	   
	    if (cibleLength != 0 && index != -1) {
	      document.all("source" ).options[sourceLength] = new Option(txtElem);
	      document.all("source" ).options[sourceLength].name = document.all("cible" ).options[index].name;
	      document.all("source" ).options[sourceLength].value = document.all("cible" ).options[index].value;
	      document.all("cible" ).options[index] = null;
	      
	      cibleLength = cibleLength - 1;
	      sourceLength = sourceLength + 1;
	    }
    }
    
    function forceSelectProdsAssocId()
    {
			var prodsId = new Array();
			var value = -1;
			var name = "";
    	for(i = 0; i < document.all("cible" ).length; i++) {
	    	value = document.all("cible" ).options[i].value;
	    	name = document.all("cible" ).options[i].name;
	    	name = document.all("cible" ).options[i].selected = true;
	    	prodsId[i] =value + " : " + name;
	    	
	    }
    }
