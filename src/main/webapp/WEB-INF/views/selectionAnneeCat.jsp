<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:layout titre="Affichage des catalogues">
	<jsp:body>
		<h4>Choix du catalogue</h4>
		Choisir une date : <br />
		<form method="post" action="afficherCatalogues.htm">
			<label for="anneeDebut">Année de départ :</label> <br />
			<input type="text" name="anneeDebut" id="anneeDebut" value="2002" /><br />
			<label for="nbAnnees">Nombre d'années :</label> <br />
			<input type="text" name="nbAnnees" id="nbAnnees" value="2" /><br />
			<br /> <input type="submit" value="Afficher" />
		</form>
	</jsp:body>
</t:layout>