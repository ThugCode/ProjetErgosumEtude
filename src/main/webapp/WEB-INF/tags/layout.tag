<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@attribute name="titre" %>
<%@attribute name="phrase" %>

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
	<script type="text/javascript"	src="<c:url value='/resources/js/custom.js' /> "></script>
	<link rel="stylesheet" media="screen" href="<c:url value='/resources/css/superfish.css' />" />
	<script type="text/javascript" src="<c:url value='/resources/js/superfish-1.4.8/js/hoverIntent.js' /> "></script>
	<script type="text/javascript" src="<c:url value='/resources/js/superfish-1.4.8/js/superfish.js' /> "></script>
	<script type="text/javascript" src="<c:url value='/resources/js/superfish-1.4.8/js/supersubs.js' /> "></script>
	<link href='http://fonts.googleapis.com/css?family=Droid+Serif:400italic' rel='stylesheet' type='text/css'>
	
	<c:if test="${!empty js}">
		<script src="<%=request.getContextPath()%>/resources/js/${js}.js" type="text/javascript"></script> <!-- Add js associated to current vue-->
	</c:if>
	
	<c:if test="${!empty chargement}">
		<script src="<%=request.getContextPath()%>/resources/js/chargement.js" type="text/javascript"></script>
	</c:if>
</head>
<body>
	<div id="top-gap"></div>
	<div class="wrapper">
		<a href="<%=request.getContextPath()%>/"> <img id="logo"
			src="<c:url value='/resources/img/logo.png' />" alt="Ergosum " />
		</a>

		<div id="nav-bar-holder">
			<ul id="nav" class="sf-menu">
				<li class="current-menu-item"><a href="<%=request.getContextPath()%>/">Accueil</a></li>
				<li><a href="<%=request.getContextPath()%>/afficherJouets.htm">Jouets</a>
					<ul>
						<li><a href="<%=request.getContextPath()%>/afficherJouets.htm">Lister</a></li>
						<li><a href="<%=request.getContextPath()%>/ajouterJouet.htm">Ajouter</a></li>
					</ul></li>
				<li><a href="<%=request.getContextPath()%>/selectionnerAnnee.htm">Catalogues</a></li>
				<li><a href="<%=request.getContextPath()%>/listerCatalogue.htm">Dictionnaires</a></li>
			</ul>
		</div>

		<div id="content-wrap">
			<div id="page-wrap">
				<div class="page-title">
					<h1>${titre}</h1> 
					<span>${phrase}</span>
				</div>
				<div id="side-content">
					<jsp:doBody />
				</div>
			</div>
			<div id="sidebar">
				<div class="sideblock">
					<h6 class="side-title">Pages</h6>
					<ul class="cat-list">
						<li><a href="<%=request.getContextPath()%>/" class="sidebar-inside">Accueil</a></li>
						<li><a href="<%=request.getContextPath()%>/afficherJouets.htm">Jouets</a>
							<ul>
								<li><a href="<%=request.getContextPath()%>/afficherJouets.htm">Lister</a></li>
								<li><a href="<%=request.getContextPath()%>/ajouterJouet.htm">Ajouter</a></li>
							</ul></li>
						<li><a href="<%=request.getContextPath()%>/selectionnerAnnee.htm">Catalogues</a></li>
						<li><a href="<%=request.getContextPath()%>/listerCatalogue.htm">Dictionnaires</a></li>
					</ul>
				</div>
			</div>
			<div class="clear"></div>
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
					<li><a href="<%=request.getContextPath()%>/">Accueil</a></li>
					<li><a href="<%=request.getContextPath()%>/afficherJouets.htm">Jouets</a></li>
					<li><a href="<%=request.getContextPath()%>/selectionnerAnnee.htm">Catalogues</a></li>
					<li><a href="<%=request.getContextPath()%>/listerCatalogue.htm">Dictionnaires</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>