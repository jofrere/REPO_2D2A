
var globalIndex = 0;

function initForm(elemId)
{
		var index = parseInt(elemId);
		globalIndex = index;
		var e = document.getElementById(elemId);
		if(e.addEventListener){
			e.onchange = manageOnChange; 
	}else if(e.attachEvent){ 
  	e.attachEvent("onchange", manageOnChange); 
	}
}


function manageOnChange()
{
	var index = parseInt(globalIndex);
	index += 1;
	
	var e = document.getElementById(globalIndex);
	var p = document.createElement("p");
	
	// Input file
	var input = document.createElement("input");
	input.type = 'file';
	input.id = index + '';
	input.name = 'images['+index+'].photoFile';
	
	// Delete button
	var del = document.createElement("img");
	del.src = "/2D2A_BO/resources/img/picto_site/delete.gif";
	
	globalIndex = index;
	
	// Set callback
	if(input.addEventListener){ 
		input.onchange = manageOnChange; 
		del.onclick = deleteField;

	}else if(input.attachEvent){ 
  	input.attachEvent("onchange", manageOnChange); 
  	del.attachEvent("onclick", deleteField); 
	}

	p.appendChild(input);
	e.parentNode.appendChild(del);
	e.parentNode.parentNode.appendChild(p);
}


function deleteField(event)
{
	if(event.currentTarget)
	{ 
		document.getElementById("modifProduit").removeChild(event.currentTarget.parentNode);
	}
	else
	{
		document.getElementById("modifProduit").removeChild(event.srcElement.parentNode);
	}
}
