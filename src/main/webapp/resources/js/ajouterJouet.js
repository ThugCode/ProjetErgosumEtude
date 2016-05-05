function verif() {
	if (document.getElementById("id").value == ""
			|| document.getElementById("libelle").value == ""
			|| document.getElementById("datedebut").value == ""
			|| document.getElementById("quantiteDistribution").value == ""
			|| document.getElementById("datefin").value == "") {
		alert("Un des champs n'est pas rempli !");
		return false;
	} else
		return true;
}