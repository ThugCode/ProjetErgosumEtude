<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:layout titre="Dictionnaire catalogue">
	<jsp:body>
		<h4>Voici le dictionnaire pour le catalogue choisi de l'année : ${anneecatalogue}  </h4>
		<input type="hidden" name="uneErreur" value="${MesErreurs}"	id="id_erreur">
		<table>
			<tr>
				<th>Catégorie</th>
				<th>Quantité  distribuée</th>
			</tr>
			<c:set var="totalQteD" value="${0}" />
			<c:forEach items="${dictionnaire}" var="ligneDico">
				<tr>
					<c:set var="totalQteD" value="${totalQteD + ligneDico.value}" />
					<td>${ligneDico.key.libcateg}</td>
					<td>${ligneDico.value}</td>
				</tr>
			</c:forEach>
				<tr>
					<td>Total :</td>
					<td>${totalQteD}</td>
				</tr>
		</table>
	</jsp:body>
</t:layout>