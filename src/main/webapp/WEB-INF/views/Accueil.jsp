<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:layout titre="Accueil" phrase="Application de gestion des jouets">
    <jsp:body>
			<h4>Bienvenue</h4>
			<p>Cette application vous permettra de modifier les jouets ainsi que leurs catalogues.</p>
			<p>En vous souhaitant une agréable visite.</p>
			<a href="http://polytech.univ-lyon1.fr" target="_blank" title="Polytech Lyon">
			<img src="<c:url value='/resources/img/polytech.png' />"  alt="Polytech Lyon" style="width: 100px; float: right;" /></a>
	 </jsp:body>
</t:layout>