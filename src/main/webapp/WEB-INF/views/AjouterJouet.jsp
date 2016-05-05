<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:layout titre="Ajout d'un jouet" phrase="Formulaire d'ajout d'un jouet">
	<jsp:body>		  
		<h4>Ajouter un jouet</h4>
		<input type="hidden" name="uneErreur" value="${MesErreurs}"	id="id_erreur">
		<form method="post" action="sauverJouet.htm" onsubmit="return verif();">
			<input type="hidden" name="type" value="ajout" id="type" />
			<table>
				<!-- input fields -->
				<tr>
					<td>Numéro</td>
					<td><input type="text" name="id" value="${jouet.numero}" id="id" /></td>
				</tr>
				<tr>
					<td>Libellé</td>
					<td><input type="text" name="libelle" value="${jouet.libelle}" id="libelle" /></td>
				</tr>
				<tr>
					<td>Catégorie</td>
					<td><select name="codecateg">
							<c:forEach items="${categories}" var="categorie">
								<option value="${categorie.codecateg}">${categorie.libcateg}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td>Tranche âge</td>
					<td><select name="codetranche">
							<c:forEach items="${tranches}" var="tranche">
								<option value="${tranche.codetranche}">${tranche.agemin}
									&agrave; ${tranche.agemax} ans</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td>Quantité de distribution</td>
					<td><input type="text" name="quantiteDistribution"
						id="quantiteDistribution" /> dans le catalogue <select
						name="codecatalogue">
							<c:forEach items="${catalogues}" var="catalogue">
								<option value="${catalogue.annee}">${catalogue.annee}</option>
							</c:forEach>
					</select></td>
				</tr>
	
				<!-- Boutons Ajouter/Reset -->
				<tr>
					<td colspan="2"><input type="submit" name="ajouter"
						value="Ajouter" /> &nbsp;&nbsp; <input type="reset" name="reset"
						value="Reset" /></td>
				</tr>
			</table>
		</form>
	</jsp:body>
</t:layout>