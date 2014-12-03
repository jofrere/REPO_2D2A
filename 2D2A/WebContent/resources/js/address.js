function Address(societe, prenom, nom, adresse, compAdresse, codePostal, ville, pays, telPrive) {
	this.societe = societe;
	this.prenom = prenom;
	this.nom = nom;
	this.adresse = adresse;
	this.compAdresse = compAdresse;
	this.codePostal = codePostal;
	this.ville = ville;
	this.pays = pays;
	this.telPrive = telPrive;
}


function updateAddress(index) {
	
		var currentAddr = addresses[index];
		document.getElementById("societe").innerHTML = currentAddr.societe;
		document.getElementById("prenom").innerHTML = currentAddr.prenom;
		document.getElementById("nom").innerHTML = currentAddr.nom;
		document.getElementById("adresse").innerHTML = currentAddr.adresse;
		document.getElementById("compAdresse").innerHTML = currentAddr.compAdresse;
		document.getElementById("codePostal").innerHTML = currentAddr.codePostal;
		document.getElementById("ville").innerHTML = currentAddr.ville;
		document.getElementById("pays").innerHTML = currentAddr.pays;
		document.getElementById("telPrive").innerHTML = currentAddr.telPrive;
}


function updateAddress2(index) {
	
	var currentAddr = addresses[index];
	document.getElementById("societe2").innerHTML = currentAddr.societe;
	document.getElementById("prenom2").innerHTML = currentAddr.prenom;
	document.getElementById("nom2").innerHTML = currentAddr.nom;
	document.getElementById("adresse2").innerHTML = currentAddr.adresse;
	document.getElementById("compAdresse2").innerHTML = currentAddr.compAdresse;
	document.getElementById("codePostal2").innerHTML = currentAddr.codePostal;
	document.getElementById("ville2").innerHTML = currentAddr.ville;
	document.getElementById("pays2").innerHTML = currentAddr.pays;
	document.getElementById("telPrive2").innerHTML = currentAddr.telPrive;
}