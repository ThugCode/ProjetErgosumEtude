<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:layout titre="Affichage d'un dictionnaire" phrase="Sélectionnez tout d'abord un catalogue dans la liste">
	<jsp:body>
		<h4>Choix du catalogue</h4>
		<form method="post" action="afficherDictionnaire.htm">
			<select name="annee">
				<c:forEach items="${catalogues}" var="catalogue">
					<option value="${catalogue.annee}">${catalogue.annee}</option>
				</c:forEach>
			</select> <input type="submit" value="Afficher" />
		</form>
	</jsp:body>
</t:layout>