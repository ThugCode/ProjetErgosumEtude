<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Application Ergosum</title>
		<link rel="stylesheet" href="<c:url value='/resources/css/style.css' /> " type="text/css" media="screen" />
		<!--[if IE]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<script type="text/javascript" src="<c:url value='/resources/js/jquery.min.js' />"> </script>
		<script type="text/javascript" src="<c:url value='/resources/js/custom.js' /> "></script>
		<link rel="stylesheet" media="screen" href="<c:url value='/resources/css/superfish.css' />" /> 
		<script type="text/javascript" src="<c:url value='/resources/js/superfish-1.4.8/js/hoverIntent.js' /> "></script>
		<script type="text/javascript" src="<c:url value='/resources/js/superfish-1.4.8/js/superfish.js' /> "></script>
		<script type="text/javascript" src="<c:url value='/resources/js/superfish-1.4.8/js/supersubs.js' /> "></script> 
		<link href='http://fonts.googleapis.com/css?family=Droid+Serif:400italic' rel='stylesheet' type='text/css'>
		<script>
		  function verif()
		  {
		  if(document.getElementById("id").value == "" || 
		     document.getElementById("libelle").value == "" || 
		     document.getElementById("datedebut").value == "" ||
		     document.getElementById("quantiteDistribution").value == "" ||
		     document.getElementById("datefin").value == "")
		       { alert("Un des champs n'est pas rempli !"); 
		         return false; 
		       }
		  else
		    return true;
		  }
		  function Chargement()
		  {
		      var obj = document.getElementById("id_erreur");
		      if (obj.value!='')
		         alert('Erreur signal�e  : "'+obj.value+"'");
		  }
		  </script>
	</head>
	<div id="top-gap"></div>
		<div class="wrapper">
			<a href="Accueil.htm">
			
			<img id="logo" src="<c:url value='/resources/img/logo.png' />"  alt="Ergosum " />    </a>
			
			<div id="nav-bar-holder">
				<ul id="nav" class="sf-menu">
					<li class="current-menu-item"><a href="Accueil.htm">Accueil</a></li>
					<li><a href="afficherJouets.htm">Jouets</a>
						<ul>
							<li><a href="afficherJouets.htm">Lister</a></li>
							<li><a href="ajouterJouet.htm">Ajouter</a></li>
						</ul>
					</li>
					<li><a href="selectionnerAnnee.htm">Catalogues</a></li>
					<li> <a href="listerCatalogue.htm">Dictionnaires</a></li>
				</ul>
			</div>  	
	        <div id="content-wrap">
	        	<div id="page-wrap">
					<div class="page-title"><h1>Ajout d'un jouet</h1> <span>Formulaire d'ajout d'un jouet</span></div>
					<div id="side-content">
						<h4>Ajouter un jouet</h4>
						<input type ="hidden" name="uneErreur"  value="${MesErreurs}"  id ="id_erreur" >
						  <form method="post" action="sauverJouet.htm" onsubmit="return verif();">
						  <input type="hidden" name="type" value="ajout"  id="type"/> 
						  <table>
						    <!-- input fields -->
						    <tr>
						      <td>Num�ro</td>
						      <td><input type="text" name="id" value="${jouet.numero}" id="id"/></td>
						    </tr>
						    <tr>
						      <td>Libell�</td>
						      <td><input type="text" name="libelle" value="${jouet.libelle}" id="libelle"/></td>
						    </tr>
						    <tr>
						    <td>Cat�gorie</td>
						     <td>
						     <select name="codecateg">
							<c:forEach items="${categories}" var="categorie">
								<option value="${categorie.codecateg}">${categorie.libcateg}</option>
							</c:forEach>
							</select></td>
						     </tr>
						      <tr>
						      <td>Tranche �ge</td>
						     <td>
						     <select name="codetranche">
								<c:forEach items="${tranches}" var="tranche">
									<option value="${tranche.codetranche}">${tranche.agemin} &agrave; ${tranche.agemax} ans</option>
								</c:forEach>
							</select>
						     </td>
						    </tr>
						      <tr>
						      <td>Quantit� de distribution</td>
						     <td><input type="text" name="quantiteDistribution" id="quantiteDistribution"/> dans le catalogue 
						     <select name="codecatalogue">
						  	<c:forEach items="${catalogues}" var="catalogue">
						  		<option value="${catalogue.annee}">${catalogue.annee}</option>
						  	</c:forEach>
						  	</select></td>
						    </tr>
						    
						    <!-- Boutons Ajouter/Reset -->
						    <tr>
						      <td colspan="2">
						        <input type="submit" name="ajouter" value="Ajouter"/>
						        &nbsp;&nbsp;
						        <input type="reset" name="reset" value="Reset" />
						      </td>
						    </tr>
						  </table>
					  </form>
					</div>
					<div id="sidebar">
						<div class="sideblock">
							<h6 class="side-title">Pages</h6>
							<ul class="cat-list">
								<li><a href="Accueil.htm" class="sidebar-inside">Accueil</a></li>
								<li><a href="afficherJouets.htm">Jouets</a>
									<ul>
										<li><a href="afficherJouets.htm">Lister</a></li>
										<li><a href="ajouterJouet.htm">Ajouter</a></li>
									</ul>
								</li>
								<li><a href="selectionnerAnnee.htm">Catalogues</a></li>
								<li><a href="listerCatalogue.htm">Dictionnaires</a></li>
					    	</ul>
				    	</div>
					</div>
					<div class="clear"></div>
	        	</div>
	        </div>
        </div>
		<div id="footer">
			<div class="footer-wrapper">
				<div id="footer-glare"></div>
			</div>
		</div>
		<div id="footer-bottom">
			<div class="bottom-wrapper">
				<div id="bottom-left">
					<a href="Accueil.htm">Application Ergosum</a> - Gestion de jouets
				</div>
				<div id="bottom-right">
					<ul id="footer-nav">
						<li><a href="Accueil.htm">Accueil</a></li>
						<li><a href="afficherJouets.htm">Jouets</a></li>
						<li><a href="selectionnerAnnee.htm">Catalogues</a></li>
						<li> <a href="listerCatalogue.htm">Dictionnaires</a></li>
					</ul>
				</div>
			</div>
		</div>
	</body>
</html>