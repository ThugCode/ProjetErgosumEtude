function chargement() {
	var obj = document.getElementById("id_erreur");
	if (obj.value != '')
		alert('Erreur signalée  : "' + obj.value + "'");
}

$( document ).ready( chargement );