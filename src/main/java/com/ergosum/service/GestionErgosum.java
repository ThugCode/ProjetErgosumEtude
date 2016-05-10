package com.ergosum.service;

import hibernate.metier.*;


import com.ergosum.meserreurs.*;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.*;

public class GestionErgosum {

	private List<Jouet> mesJouets = null;
	private List<Catalogue> mesCatalogues = null;
	private List<Categorie> mesCategories = null;
	private List<Trancheage> mesTranches = null;
	private List<CatalogueQuantites> mesCataloguesQuantites = null;
	private Session session;

	/**
	 * Ajout d'un jouet
	 */

	public void ajouter(Jouet unJouet) throws HibernateException,
			ServiceHibernateException {
		Transaction tx = null;
		try {
			session = ServiceHibernate.currentSession();
			tx = session.beginTransaction();
			// on transfère la nouvelle commande à la base
			session.save(unJouet);
			tx.commit();
			ServiceHibernate.closeSession();
		}

		catch (ServiceHibernateException ex) {
			throw new ServiceHibernateException("Erreur de service Hibernate: "
					+ ex.getMessage(), ex);
		} catch (HibernateException ex) {
			if (tx != null) {
				tx.rollback();
			}
			throw new MonException("Erreur  Hibernate: ", ex.getMessage());
		}
		ServiceHibernate.closeSession();
	}

	/**
	 * Recherche d'un jouet
	 */

	@SuppressWarnings("unchecked")
	public Jouet rechercherJouet(String id) throws HibernateException,
			ServiceHibernateException {
		Jouet unJouet = null;
		try {
			session = ServiceHibernate.currentSession();
			// On passe une requête SQL
			Query query = session.createQuery(
					" FROM Jouet AS j  where j.numero = ?").setString(0, id);
			// Solution pour récupérer une ligne, il faut passer par un
			// itérateur
			Iterator<Jouet> it = query.list().iterator();
			while (it.hasNext()) {
				unJouet = it.next();
			}
		} catch (ServiceHibernateException ex) {
			throw new ServiceHibernateException("Erreur de service Hibernate: "
					+ ex.getMessage(), ex);
		} catch (HibernateException ex) {
			throw new MonException("Erreur  Hibernate: ", ex.getMessage());
		}
		return unJouet;
	}

	/**
	 * Recherche d'une catégorie
	 */
	@SuppressWarnings("unchecked")
	public Categorie rechercherCategorie(String id) throws HibernateException,
			ServiceHibernateException {
		Categorie uneCategorie = null;
		try {
			session = ServiceHibernate.currentSession();
			// On passe une requête SQL
			Query query = session.createQuery(
					" FROM Categorie AS c  where c.codecateg = ?").setString(0, id);
			// Solution pour récupérer une ligne, il faut passer par un
			// itérateur
			Iterator<Categorie> it = query.list().iterator();
			while (it.hasNext()) {
				uneCategorie = it.next();
			}
			ServiceHibernate.closeSession();
		} catch (ServiceHibernateException ex) {
			throw new ServiceHibernateException("Erreur de service Hibernate: "
					+ ex.getMessage(), ex);
		} catch (HibernateException ex) {
			throw new MonException("Erreur  Hibernate: ", ex.getMessage());
		}
		return uneCategorie;
	}

	/**
	 * Recherche d'une tranche d'âge
	 */
	@SuppressWarnings("unchecked")
	public Trancheage rechercherTrancheage(String id)
			throws HibernateException, ServiceHibernateException {
		Trancheage uneTrancheage = null;
		try {
			session = ServiceHibernate.currentSession();
			// On passe une requête SQL
			Query query = session.createQuery(
					" FROM Trancheage AS t  where t.codetranche = ?").setString(0, id);
			// Solution pour récupérer une ligne, il faut passer par un
			// itérateur
			Iterator<Trancheage> it = query.list().iterator();
			while (it.hasNext()) {
				uneTrancheage = it.next();
			}
			ServiceHibernate.closeSession();
		} catch (ServiceHibernateException ex) {
			throw new ServiceHibernateException("Erreur de service Hibernate: "
					+ ex.getMessage(), ex);
		} catch (HibernateException ex) {
			throw new MonException("Erreur  Hibernate: ", ex.getMessage());
		}
		return uneTrancheage;
	}

	/**
	 * recherche d'un catalogue
	 */
	@SuppressWarnings("unchecked")
	public Catalogue rechercherCatalogue(String id) throws HibernateException,
			ServiceHibernateException {
		Catalogue unCatalogue = null;
		try {
			session = ServiceHibernate.currentSession();
			// On passe une requête SQL
			Query query = session.createQuery(
					" FROM Catalogue AS c  where c.annee = ?").setString(0, id);
			// Solution pour récupérer une ligne, il faut passer par un
			// itérateur
			Iterator<Catalogue> it = query.list().iterator();
			while (it.hasNext()) {
				unCatalogue = it.next();
			}
			ServiceHibernate.closeSession();
		} catch (ServiceHibernateException ex) {
			throw new ServiceHibernateException("Erreur de service Hibernate: "
					+ ex.getMessage(), ex);
		} catch (HibernateException ex) {
			throw new MonException("Erreur  Hibernate: ", ex.getMessage());
		}
		return unCatalogue;
	}

	/**
	 * Liste de tous les jouets
	 */
	@SuppressWarnings("unchecked")
	public List<Jouet> listerTousLesJouets(String categorie, String trancheAge) throws HibernateException,
			ServiceHibernateException {
		try {

			boolean first = true;
			session = ServiceHibernate.currentSession();
			// On passe une requête SQL en utilisant les noms des fichiers hbm

			String marequete = "SELECT j  FROM Jouet AS j";
			
			if(categorie != null) {
				if(first) {
					marequete += " WHERE";
					first = false;
				}
				
				marequete += " j.categorie = "+categorie;
			}
			if(trancheAge != null) {
				if(first) {
					marequete += " WHERE";
					first = false;
				}
				else {
					marequete += " AND";
				}
				marequete += " j.trancheage = "+trancheAge;
			}
			
			Query query = session.createQuery(marequete);
			mesJouets = query.list();
			ServiceHibernate.closeSession();
		} catch (ServiceHibernateException ex) {
			throw new ServiceHibernateException("Erreur de service Hibernate: "
					+ ex.getMessage(), ex);
		} catch (HibernateException ex) {
			throw new MonException("Erreur  Hibernate: ", ex.getMessage());
		}

		return mesJouets;
	}
	
	/**
	 * Liste de tous les catalogues
	 */

	@SuppressWarnings("unchecked")
	public List<Catalogue> listerTousLesCatalogues() throws HibernateException,
			ServiceHibernateException {
		try {
			session = ServiceHibernate.currentSession();
			// On passe une requête SQL en utilisant les noms des fichiers hbm
			String marequete = "SELECT c  FROM Catalogue AS c";
			Query query = session.createQuery(marequete);
			mesCatalogues = query.list();
			ServiceHibernate.closeSession();
		} catch (ServiceHibernateException ex) {
			throw new ServiceHibernateException("Erreur de service Hibernate: "
					+ ex.getMessage(), ex);
		} catch (HibernateException ex) {
			throw new MonException("Erreur Hibernate: ", ex.getMessage());
		}

		return mesCatalogues;
	}

	/**
	 * Liste de toutes les tranches d'âges
	 */

	@SuppressWarnings("unchecked")
	public List<Trancheage> listerToutesLesTranches()
			throws HibernateException, ServiceHibernateException {
		try {
			session = ServiceHibernate.currentSession();
			// On passe une requête SQL en utilisant les noms des fichiers hbm
			String marequete = "SELECT t FROM Trancheage AS t";
			Query query = session.createQuery(marequete);
			mesTranches = query.list();
			ServiceHibernate.closeSession();
		} catch (ServiceHibernateException ex) {
			throw new ServiceHibernateException("Erreur de service Hibernate: "
					+ ex.getMessage(), ex);
		} catch (HibernateException ex) {
			throw new MonException("Erreur Hibernate: ", ex.getMessage());
		}

		return mesTranches;
	}

	/**
	 * Liste de toutes les catégories
	 */

	@SuppressWarnings("unchecked")
	public List<Categorie> listerToutesLesCategories()
			throws HibernateException, ServiceHibernateException {
		try {
			session = ServiceHibernate.currentSession();
			// On passe une requête SQL en utilisant les noms des fichiers hbm
			String marequete = "SELECT c  FROM Categorie AS c";
			Query query = session.createQuery(marequete);
			mesCategories = query.list();
			ServiceHibernate.closeSession();
		} catch (ServiceHibernateException ex) {
			throw new ServiceHibernateException("Erreur de service Hibernate: "
					+ ex.getMessage(), ex);
		} catch (HibernateException ex) {
			throw new MonException("Erreur Hibernate: ", ex.getMessage());
		}

		return mesCategories;
	}

	/**
	 * Liste des quantites par catalogue
	 */
	@SuppressWarnings("unchecked")
	public List<CatalogueQuantites> listerCatalogueQuantites(int anneeDebut,
			int nbAnnees) throws HibernateException, ServiceHibernateException {
		try {
			session = ServiceHibernate.currentSession();
			String marequete = "SELECT ca.annee, ca.quantiteDistribuee, co.quantite FROM Catalogue AS ca, Comporte AS co WHERE ca.annee BETWEEN "
					+ anneeDebut
					+ " AND "
					+ (anneeDebut + nbAnnees)
					+ " AND co.catalogue.annee = ca.annee";
			Query query = session.createQuery(marequete);
			List resultat = query.list();

			ServiceHibernate.closeSession();
			mesCataloguesQuantites = new ArrayList<CatalogueQuantites>();

			for (int i = 0; i < resultat.size(); i++)
				mesCataloguesQuantites.add(new CatalogueQuantites(
						((Object[]) resultat.get(i))[0].toString(),
						((Object[]) resultat.get(i))[1].toString(),
						((Object[]) resultat.get(i))[2].toString()));

		} catch (ServiceHibernateException ex) {
			throw new ServiceHibernateException("Erreur de service Hibernate: "
					+ ex.getMessage(), ex);
		} catch (HibernateException ex) {
			throw new MonException("Erreur  Hibernate: ", ex.getMessage());
		}

		return mesCataloguesQuantites;
	}

	/**
	 * Modification d'un jouet
	 */
	public void modifier(Jouet unJouet) throws HibernateException,
			ServiceHibernateException {

		Transaction tx = null;
		try {
			// il faut fermer la session courante pour
			// libérer l'objet que l'on veut modifier
			ServiceHibernate.closeSession();
			session = ServiceHibernate.currentSession();
			tx = session.beginTransaction();
			session.update(unJouet);
			tx.commit();
			ServiceHibernate.closeSession();
		} catch (ServiceHibernateException ex) {
			// on remonte l'erreur
			throw new ServiceHibernateException("Erreur de service Hibernate: "
					+ ex.getMessage(), ex);
		}

		catch (HibernateException ex) {
			if (tx != null) {
				tx.rollback();
			}
			throw new MonException("Erreur  Hibernate: ", ex.getMessage());
		}
	}

	/**
	 * Modification d'un catalogue
	 */

	public void modifierCatalogue(Catalogue unCatalogue)
			throws HibernateException, ServiceHibernateException {

		Transaction tx = null;
		try {
			// il faut fermer la session courante pour
			// libérer l'objet que l'on veut modifier
			ServiceHibernate.closeSession();
			session = ServiceHibernate.currentSession();
			tx = session.beginTransaction();
			session.update(unCatalogue);
			tx.commit();
			ServiceHibernate.closeSession();
		} catch (ServiceHibernateException ex) {
			// on remonte l'erreur
			throw new ServiceHibernateException("Erreur de service Hibernate: "
					+ ex.getMessage(), ex);
		}

		catch (HibernateException ex) {
			if (tx != null) {
				tx.rollback();
			}
			throw new MonException("Erreur  Hibernate: ", ex.getMessage());
		}
	}

	/**
	 * Suppression d'un jouet
	 */
	public void effacer(String[] tabnum) throws HibernateException,
			ServiceHibernateException {
		Transaction tx = null;
		Jouet unJouet;
		for (int i = 0; i < tabnum.length; i++) {
			try {
				// il faut fermer la session courante pour
				// libérer les objets que l'on veut effacer
				session = ServiceHibernate.currentSession();
				tx = session.beginTransaction();
				unJouet = rechercherJouet(tabnum[i]);
				session.delete(unJouet);
				tx.commit();
				ServiceHibernate.closeSession();
			} catch (ServiceHibernateException ex) {
				// on remonte l'erreur
				throw new ServiceHibernateException(
						"Erreur de service Hibernate: " + ex.getMessage(), ex);
			}

			catch (HibernateException ex) {
				if (tx != null) {
					tx.rollback();
				}
				throw new MonException("Erreur  Hibernate: ", ex.getMessage());
			}
		}

	}
	
	/*
	 * Méthodes pour construire un dictionnaire 
	 */
	
	@SuppressWarnings("unchecked")
	public HashMap<Categorie, Integer> StatCategorie(int annee)
	{
		ArrayList<Categorie> resultatCategories = new ArrayList<Categorie>();
		ArrayList<Comporte> resultatComporte = null;
		HashMap<Categorie, Integer> categories = new HashMap<Categorie, Integer>();

		Session session = ServiceHibernate.currentSession();
		// On ne peut pas tout faire en une seule requête étant donné que l'on souhaite obtenir l'objet en id de hashmap
		Query rqComporte = session.createQuery("SELECT c FROM Comporte AS c WHERE c.catalogue.annee = " + annee);
		resultatComporte = (ArrayList<Comporte>) rqComporte.list();
		System.out.println("Il y a " + resultatComporte.size() + " jouets dans le catalogue " + annee);
		
		for (int i = 0; i < resultatComporte.size(); i++)
	
		{
			Query rqCategories = session.createQuery("SELECT DISTINCT c FROM Categorie AS c WHERE c.codecateg = " + resultatComporte.get(i).getJouet().getCategorie().getCodecateg());
			Categorie categorie = (Categorie) rqCategories.uniqueResult();
			
			if (resultatCategories.contains(categorie))
				categories.put(categorie, (categories.get(categorie)) + resultatComporte.get(i).getQuantite());
			else
				categories.put(categorie, resultatComporte.get(i).getQuantite());
			resultatCategories.add(categorie);
		}

		ServiceHibernate.closeSession();

		return categories;
	}

	/*
	 * On recherche le catalgue qui correspond à l'année 
	 * On construit pour ce catalogue tous les jouets
	 * Avec les catégories 
	 */
	
	@SuppressWarnings("unchecked")
	public HashMap<Categorie, Integer> rechercherDictionnaire(String annee) throws HibernateException, ServiceHibernateException
	{
		HashMap<Categorie, Integer> unDicoCatalogue = null;
		Catalogue cat = null;
		try
		{
			session = ServiceHibernate.currentSession();
			// On passe une requête SQL
			Query query = session.createQuery(" FROM Catalogue AS cata WHERE cata.annee = " + Integer.parseInt(annee));
			// Solution pour récupérer une ligne, il faut passer par un
			
			Iterator<Catalogue> it = query.list().iterator();
			while (it.hasNext())
			{
				cat = it.next();
				unDicoCatalogue = StatCategorie(Integer.parseInt(annee));
			}
			ServiceHibernate.closeSession();
		} catch (ServiceHibernateException ex)
		{
			throw new ServiceHibernateException("Erreur de service Hibernate: " + ex.getMessage(), ex);
		} catch (HibernateException ex)
		{
			throw new MonException("Erreur  Hibernate: ", ex.getMessage());
		}
		return unDicoCatalogue;
	}

}
