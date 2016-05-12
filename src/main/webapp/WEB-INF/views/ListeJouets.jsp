<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:layout titre="Liste des jouets ERGOSUM" phrase="Retrouvez ci-dessous vos jouets préférés">
	<jsp:body>
		<h4>Liste des jouets</h4>
		<input type="hidden" name="uneErreur" value="${MesErreurs}"
			id="id_erreur">
			
		<form action="afficherJouets.htm">
			<select name="categories">
			    <option value="" selected disabled>Choisir une categorie...</option>
	    		<c:forEach items="${categories}" var="categorie">
            		<option ${categorie.codecateg == categorieSelected.codecateg  ? 'selected' : ''} value="${categorie.codecateg}">${categorie.libcateg}</option>
	    		</c:forEach>
			</select>
			
			<select name="tranches">
			    <option value="" selected>Choisir une tranche d'age...</option>
	    		<c:forEach items="${tranches}" var="tranche">
            		<option ${tranche.codetranche == trancheSelected.codetranche  ? 'selected' : ''} value="${tranche.codetranche}">${tranche.agemin} ans - ${tranche.agemax} ans</option>
	    		</c:forEach>
			</select>
			
			<input type="submit" value="Trier" />
			<a type="button" href="afficherJouets.htm" >Reset</a> 
		</form>
		
		<form name="deleteForm" method="post" action="effacerJouet.htm">
			<table>
				<tr>
					<th><a href="javascript:checkAll(document.deleteForm.id)">Selectionner
							<br />tous les éléments
					</a></th>
					<th>Action</th>
					<th>Numéro</th>
					<th>Libellé</th>
					<th>Code Catégorie</th>
					<th>Code Tranche Age</th>
				</tr>
	
				<c:forEach items="${mesJouets}" var="item">
					<tr>
						<td><input type="checkbox" name="id" value="${item.numero}"></td>
						<td><a href="modifierJouet.htm?id=${item.numero}">Modifier</a></td>
						<td>${item.numero}</td>
						<td>${item.libelle}</td>
						<td>${item.categorie.codecateg}</td>
						<td>${item.trancheage.codetranche}</td>
					</tr>
				</c:forEach>
	
			</table>
			<input type="submit" name="Delete Checked"
				value="Effacer les jouets marqués" /> &nbsp;&nbsp; <input
				type="reset" name="Reset" value="Reset" />
		</form>
	</jsp:body>
</t:layout>