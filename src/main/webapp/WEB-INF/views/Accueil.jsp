<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	</head>
	<body>
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
					<div class="page-title"><h1>Accueil</h1> <span>Application de gestion des jouets</span></div>
					<div id="side-content">
						<h4>Bienvenue</h4>
						<p>Cette application vous permettra de modifier les jouets ainsi que leurs catalogues.</p>
						<p>En vous souhaitant une agréable visite.</p>
						<a href="http://polytech.univ-lyon1.fr" target="_blank" title="Polytech Lyon">
						<img src="<c:url value='/resources/img/polytech.png' />"  alt="Polytech Lyon" style="width: 100px; float: right;" /></a>
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