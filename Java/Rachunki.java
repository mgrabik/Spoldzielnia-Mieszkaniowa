package bdbt_gra_projS;

public class Rachunki {

	private int ID_Rachunku;
	private float Prad;
	private float Gaz;
	private float Woda;
	private float Smieci;
	private float Eksploatacja;
	private float Ogrzewanie;
	private float Fundusz_remontowy;
	private float Winda;
	private String Oplacony;
	private int ID_Mieszkania;
	private int ID_Spoldzielni;

	public Rachunki(int iD_Rachunku, float prad, float gaz, float woda, float smieci, float eksploatacja,
			float ogrzewanie, float fundusz_remontowy, float winda, String oplacony, int iD_Mieszkania, int iD_Spoldzielni) {
		super();
		ID_Rachunku = iD_Rachunku;
		Prad = prad;
		Gaz = gaz;
		Woda = woda;
		Smieci = smieci;
		Eksploatacja = eksploatacja;
		Ogrzewanie = ogrzewanie;
		Fundusz_remontowy = fundusz_remontowy;
		Winda = winda;
		Oplacony = oplacony;
		ID_Mieszkania = iD_Mieszkania;
		ID_Spoldzielni = iD_Spoldzielni;
	}

	/* Getters and setters */

	public Rachunki() {
		// TODO Auto-generated constructor stub
	}

	public int getID_Rachunku() {
		return ID_Rachunku;
	}

	public void setID_Rachunku(int iD_Rachunku) {
		ID_Rachunku = iD_Rachunku;
	}

	public float getPrad() {
		return Prad;
	}

	public void setPrad(float prad) {
		Prad = prad;
	}

	public float getGaz() {
		return Gaz;
	}

	public void setGaz(float gaz) {
		Gaz = gaz;
	}

	public float getWoda() {
		return Woda;
	}

	public void setWoda(float woda) {
		Woda = woda;
	}

	public float getSmieci() {
		return Smieci;
	}

	public void setSmieci(float smieci) {
		Smieci = smieci;
	}

	public float getEksploatacja() {
		return Eksploatacja;
	}

	public void setEksploatacja(float eksploatacja) {
		Eksploatacja = eksploatacja;
	}

	public float getOgrzewanie() {
		return Ogrzewanie;
	}

	public void setOgrzewanie(float ogrzewanie) {
		Ogrzewanie = ogrzewanie;
	}

	public float getFundusz_remontowy() {
		return Fundusz_remontowy;
	}

	public void setFundusz_remontowy(float fundusz_remontowy) {
		Fundusz_remontowy = fundusz_remontowy;
	}

	public float getWinda() {
		return Winda;
	}

	public void setWinda(float winda) {
		Winda = winda;
	}

	public String getOplacony() {
		return Oplacony;
	}

	public void setOplacony(String oplacony) {
		Oplacony = oplacony;
	}
	
	public int getID_Mieszkania() {
		return ID_Mieszkania;
	}

	public void setID_Mieszkania(int iD_Mieszkania) {
		ID_Mieszkania = iD_Mieszkania;
	}
	
	public int getID_Spoldzielni() {
		return ID_Spoldzielni;
	}

	public void setID_Spoldzielni(int iD_Spoldzielni) {
		ID_Spoldzielni = iD_Spoldzielni;
	}

	
	/* toString() */
	@Override
	public String toString() {
		return "Rachunki [ID_Rachunku=" + ID_Rachunku + ", Prad=" + Prad + ", Gaz=" + Gaz + ", Woda=" + Woda
				+ ", Smieci=" + Smieci + ", Ekspolatacja=" + Eksploatacja + ", Ogrzewanie=" + Ogrzewanie
				+ ", Funfusz_remontowy=" + Fundusz_remontowy + ", Winda=" + Winda + ", Oplacony=" + Oplacony
				+ ", ID_Mieszkania=" + ID_Mieszkania + ", ID_Spoldzielni=" + ID_Spoldzielni + "]";
	}
}
