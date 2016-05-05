<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:layout titre="Liste des catalogues ERGOSUM">
    <jsp:body>
		<h4>Voici la liste des catalogues sur l'intervalle choisi</h4>
		<input type="hidden" name="uneErreur" value="${MesErreurs}"
			id="id_erreur">
		<table>
			<tr>
				<th>Les catalogues</th>
				<th>Quantitée affectée</th>
				<th>Quantitée distribuée</th>
				<th>Différrence</th>
			</tr>
			<c:set var="totalQte" value="${0}" />
			<c:set var="totalQteD" value="${0}" />
			<c:forEach items="${mesCataloguesQuantites}" var="catalogueQuantite">
				<tr>
					<c:set var="totalQte"
						value="${totalQte + catalogueQuantite.quantite}" />
					<c:set var="totalQteD"
						value="${totalQteD + catalogueQuantite.quantiteDistribuee}" />
					<td>Année ${catalogueQuantite.id}</td>
					<td>${catalogueQuantite.quantite}</td>
					<td>${catalogueQuantite.quantiteDistribuee}</td>
					<td>${catalogueQuantite.quantite - catalogueQuantite.quantiteDistribuee}</td>
				</tr>
			</c:forEach>
			<tr>
				<td><b>Total : </b></td>
				<td>${totalQte}</td>
				<td>${totalQteD}</td>
				<td>${totalQte - totalQteD}</td>
			</tr>
		</table>
	</jsp:body>
</t:layout>