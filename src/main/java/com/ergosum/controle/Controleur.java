package com.ergosum.controle;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import hibernate.metier.*;

import com.ergosum.service.*;
import com.ergosum.meserreurs.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Handles requests for the application home page.
 */
@Controller
public class Controleur extends MultiActionController {
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	private static final Logger logger = LoggerFactory.getLogger(Controleur.class); 
	private Jouet unJouet;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		return new ModelAndView("Accueil");
	}
	
	/**
	 * Affichage de tous les jouets 
	 */
	@RequestMapping(value = "afficherJouets.htm")

public ModelAndView afficherLesJouets(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String destinationPage = "";
		String categorie = request.getParameter("categories") == "" ? null : request.getParameter("categories");
		String tranche = request.getParameter("tranches") == "" ? null : request.getParameter("tranches");
		try
		{
			GestionErgosum unService = new GestionErgosum();
			if (unService != null) {
				request.setAttribute("mesJouets", unService.listerTousLesJouets(categorie,tranche));
				request.setAttribute("categories", unService.listerToutesLesCategories());
				request.setAttribute("tranches", unService.listerToutesLesTranches());
			}
			request.setAttribute("chargement", true);
			request.setAttribute("js", "listeJouet");
			
			request.setAttribute("categorieSelected", unService.rechercherCategorie(categorie));
			request.setAttribute("trancheSelected", unService.rechercherTrancheage(tranche));

		} catch (ServiceHibernateException e)
		{
			request.setAttribute("MesErreurs", e.getMessage());
		} catch (MonException e)
		{
			request.setAttribute("MesErreurs", e.getMessage());
		}
		destinationPage = "/ListeJouets";
		
		return new ModelAndView(destinationPage);
	}
	

	/**
	 * Ajout d'un jouet
	 */
	@RequestMapping(value = "ajouterJouet.htm")

public ModelAndView ajoutJouet(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String destinationPage = "";

		try
		{
			GestionErgosum unService = new GestionErgosum();
			
			if (unService != null)
			{
				// on passe les numéros de client et de vendeur
				request.setAttribute("jouet", new Jouet());
				request.setAttribute("categories", unService.listerToutesLesCategories());
				request.setAttribute("tranches", unService.listerToutesLesTranches());
				request.setAttribute("catalogues", unService.listerTousLesCatalogues());
				request.setAttribute("js", "ajouterJouet");
				request.setAttribute("chargement", true);
				
		         destinationPage = "/AjouterJouet";
			}
		} catch (ServiceHibernateException e)
		{
			request.setAttribute("MesErreurs", e.getMessage());
		} catch (MonException e)
		{
			request.setAttribute("MesErreurs", e.getMessage());
		}
		
		return new ModelAndView(destinationPage);
	} 
	
	
	
	/**
	 * Sélection d'une année par catégorie
	 */
	@RequestMapping(value = "selectionnerAnnee.htm")

public ModelAndView selectionAnnee(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String destinationPage = "";
		destinationPage = "/selectionAnneeCat";
		return new ModelAndView(destinationPage);	
	}
	
	/**
	 * Sélection d'une année Ctagoriet
	 */
	@RequestMapping(value = "listerCatalogue.htm")

public ModelAndView choixCatalogue(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String destinationPage = "/Erreur";
		try
		{
			GestionErgosum unService = new GestionErgosum();
			
			if (unService != null)
				request.setAttribute("catalogues", unService.listerTousLesCatalogues());
			    destinationPage = "/ChoixCatalogue";
		} catch (ServiceHibernateException e)
		{
			request.setAttribute("MesErreurs", e.getMessage());
		} catch (MonException e)
		{
			request.setAttribute("MesErreurs", e.getMessage());
		}
		
		
		return new ModelAndView(destinationPage);	
	}
	
	
	/**
	 * Modifier Jouet
	 */
	@RequestMapping(value = "modifierJouet.htm")

public ModelAndView modifierJouet(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String destinationPage = "Erreur";
		try
		{
			String id = request.getParameter("id");
			GestionErgosum unService = new GestionErgosum();
			
			if (unService != null)
			{
				Jouet unJouet = unService.rechercherJouet(id);
				request.setAttribute("jouet", unJouet);	
				request.setAttribute("categories", unService.listerToutesLesCategories());
				request.setAttribute("tranches", unService.listerToutesLesTranches());
				destinationPage = "/ModifierJouet";
			}

		} catch (ServiceHibernateException e)
		{
			request.setAttribute("MesErreurs", e.getMessage());
		} catch (MonException e)
		{
			request.setAttribute("MesErreurs", e.getMessage());
		}
		
		
		return new ModelAndView(destinationPage);	
	}
			
		
	/**
	 * Sauver jouet
	 */
	@RequestMapping(value = "sauverJouet.htm")

public ModelAndView sauverJouet(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String destinationPage = "/Erreur";
		try
		{
			String id = request.getParameter("id");
			GestionErgosum unService = new GestionErgosum();
			if (unService != null)
			{
		
    	// fabrication du jouet à partir des paramètres de la requête
		// Si le jouet n'est pas à créer, il faut le récupérer de la session
		// courante
		// Ensuite on peut modifier ses champs
		
			if (request.getParameter("type").equals("ajout"))
				unJouet = new Jouet();
			else
			{ // on récupère le jouet courant
				
				unJouet = unService.rechercherJouet(id);
			}
			unJouet.setNumero(request.getParameter("id"));
			unJouet.setLibelle(request.getParameter("libelle"));
			System.out.println("codecateg="+request.getParameter("codecateg"));
			System.out.println("codetranche="+request.getParameter("codetranche"));
			Categorie uneCateg = unService.rechercherCategorie(request.getParameter("codecateg"));
			unJouet.setCategorie(uneCateg);
			
			Trancheage uneTranche = unService.rechercherTrancheage(request.getParameter("codetranche"));
			unJouet.setTrancheage(uneTranche);
			
			// sauvegarde du jouet
			if (request.getParameter("type").equals("modif"))
			{
				unService.modifier(unJouet);
			} else
			{
				
				Catalogue leCatalogue = unService.rechercherCatalogue(request.getParameter("codecatalogue"));
				int quantiteDistribution = Integer.parseInt(request.getParameter("quantiteDistribution"));
				if (quantiteDistribution>0)
				{
					leCatalogue.setQuantiteDistribuee(leCatalogue.getQuantiteDistribuee()+quantiteDistribution);
					unService.modifierCatalogue(leCatalogue);
				}
				unService.ajouter(unJouet);
			}
			try
			{
				request.setAttribute("mesJouets", unService.listerTousLesJouets(null,null));
				destinationPage = "/ListeJouets";
			} catch (ServiceHibernateException e)
			{
				request.setAttribute("MesErreurs", e.getMessage());
			} catch (MonException e)
			{
				request.setAttribute("MesErreurs", e.getMessage());
			}
			
			}
		} catch (Exception e)
		{
			request.setAttribute("MesErreurs", e.getMessage());
		}
		
		return new ModelAndView(destinationPage);	
	}
			
		
	
	/**
	 *  effacer  jouet
	 */	
	@RequestMapping(value = "effacerJouet.htm")
	public ModelAndView effacerJouet(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String destinationPage = "";
		try
		{
			String id = request.getParameter("id");
			GestionErgosum unService = new GestionErgosum();
			
			if (unService != null)
			{	
				// recuperation de la liste des id a effacer
				String[] ids = request.getParameterValues("id");
				// effacement de la liste des id
				try
				 {
					if (ids != null)
						{
							unService.effacer(ids);
						}
					// preparation de la liste
					request.setAttribute("mesJouets", unService.listerTousLesJouets(null,null));
				 } 
				catch (ServiceHibernateException e)
		
				{
					request.setAttribute("MesErreurs", e.getMessage());
				} 
				catch (MonException e)
				{
					request.setAttribute("MesErreurs", e.getMessage());
				}

				destinationPage = "/ListeJouets";
			}
		}
		catch (Exception e)
		{
			request.setAttribute("MesErreurs", e.getMessage());
		}
		return new ModelAndView(destinationPage);	
	}
	
	
	/**
	 *  afficher Catalogue
	 */	
	@RequestMapping(value = "afficherCatalogues.htm")
	public ModelAndView afficherCatalogue(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String destinationPage = "/Erreur";
		try
		{
			String id = request.getParameter("id");
			GestionErgosum unService = new GestionErgosum();
			
			if (unService != null)
			{
					// preparation de la liste
				request.setAttribute("mesCataloguesQuantites", unService.listerCatalogueQuantites(Integer.parseInt(request.getParameter("anneeDebut")), Integer.parseInt(request.getParameter("nbAnnees"))));	
			    destinationPage = "/AfficherCatalogues";
			}
		} 
			catch (ServiceHibernateException e)
				{
					request.setAttribute("MesErreurs", e.getMessage());
				} 
				catch (MonException e)
				{
					request.setAttribute("MesErreurs", e.getMessage());
				}
		
		return new ModelAndView(destinationPage);	
	}
	
	
	

	/**
	 *  afficher le Dictionnaire
	 */	
	@RequestMapping(value = "afficherDictionnaire.htm")
	public ModelAndView afficherDictionnaire(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String destinationPage = "/Erreur";
		try
		{
			String annee = request.getParameter("annee");
			GestionErgosum unService = new GestionErgosum();
			
			if (unService != null)
			{
				
				HashMap<Categorie, Integer> hashCatInt = unService.rechercherDictionnaire(request.getParameter("annee"));
				request.setAttribute("dictionnaire", hashCatInt);
			    request.setAttribute("anneecatalogue", annee);
			    request.setAttribute("chargement", true);
			    destinationPage = "/AfficherDictionnaire";
			}
		} 
			catch (ServiceHibernateException e)
				{
					request.setAttribute("MesErreurs", e.getMessage());
				} 
				catch (MonException e)
				{
					request.setAttribute("MesErreurs", e.getMessage());
				}
		
		return new ModelAndView(destinationPage);	
	}
	
	
	
	
	

	


}
