package hibernate.metier;

// Generated 24 avr. 2014 11:38:54 by Hibernate Tools 4.0.0

/**
 * Comporte generated by hbm2java
 */
public class Comporte implements java.io.Serializable {

	private ComporteId id;
	private Jouet jouet;
	private Catalogue catalogue;
	private Integer quantite;

	public Comporte() {
	}

	public Comporte(ComporteId id, Jouet jouet, Catalogue catalogue) {
		this.id = id;
		this.jouet = jouet;
		this.catalogue = catalogue;
	}

	public Comporte(ComporteId id, Jouet jouet, Catalogue catalogue,
			Integer quantite) {
		this.id = id;
		this.jouet = jouet;
		this.catalogue = catalogue;
		this.quantite = quantite;
	}

	public ComporteId getId() {
		return this.id;
	}

	public void setId(ComporteId id) {
		this.id = id;
	}

	public Jouet getJouet() {
		return this.jouet;
	}

	public void setJouet(Jouet jouet) {
		this.jouet = jouet;
	}

	public Catalogue getCatalogue() {
		return this.catalogue;
	}

	public void setCatalogue(Catalogue catalogue) {
		this.catalogue = catalogue;
	}

	public Integer getQuantite() {
		return this.quantite;
	}

	public void setQuantite(Integer quantite) {
		this.quantite = quantite;
	}

}