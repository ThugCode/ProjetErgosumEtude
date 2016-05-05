<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>


<t:layout titre="Modification d'un jouet" phrase="A l'aide du formulaire ci-dessous">
	<jsp:body>
		<h4>Modifier un jouet</h4>
		<input type="hidden" name="uneErreur" value="${MesErreurs}"
			id="id_erreur">
		<form method="post" action="sauverJouet.htm">
			<input type="hidden" name="id" value="${jouet.numero}" /> <input
				type="hidden" name="type" value="modif" id="type" />
	
			<table>
				<!-- input fields -->
				<tr>
					<td>Numéro</td>
					<td><LABEL FOR=id>"${jouet.numero}"</LABEL></td>
				</tr>
				<tr>
					<td>Libellé</td>
					<td><input type="text" name="libelle" value="${jouet.libelle}"
						id="libelle" /></td>
				</tr>
	
				<tr>
					<td>Catégorie</td>
					<td><select name="codecateg">
							<c:forEach items="${categories}" var="categorie">
								<option
									<c:if test="${jouet.categorie.codecateg==categorie.codecateg}">selected="selected"</c:if>
									value="${categorie.codecateg}">${categorie.libcateg}</option>
							</c:forEach>
					</select></td>
				</tr>
	
				<tr>
					<td>Tranche âge</td>
					<td><select name="codetranche">
							<c:forEach items="${tranches}" var="tranche">
								<option
									<c:if test="${jouet.trancheage.codetranche==tranche.codetranche}">selected="selected"</c:if>
									value="${tranche.codetranche}">${tranche.agemin}
									&agrave; ${tranche.agemax} ans</option>
							</c:forEach>
					</select></td>
				</tr>
				<!-- Boutons Modifier -->
				<tr>
					<td colspan="1"><input type="submit" name="modifier"
						value="Modifier" /></td>
				</tr>
			</table>
		</form>
	</jsp:body>
</t:layout>