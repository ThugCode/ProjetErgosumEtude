<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:layout titre="Erreur" phrase="Oups !">
	<jsp:body>
		<h4>Une erreur est survenue</h4>
		<h2>  ${MesErreurs}</h2>
		Cliquez <a href="Accueil.htm">ici</a> pour revenir à la page principale.
	</jsp:body>
</t:layout>