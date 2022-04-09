package bdbt_gra_projS;

import java.sql.Date;

public class Wynagrodzenia {
	
	private int ID_Wynagrodzenia;
	private Date Data;
	private float Kwota_podstawowa;
	private float Premia;
	private int ID_Pracownika;
	
	
	
	
	public Wynagrodzenia() {
		
	}

	public Wynagrodzenia(int iD_Wynagrodzenia, Date data, float kwota_podstawowa, float premia, int iD_Pracownika) {
		super();
		ID_Wynagrodzenia = iD_Wynagrodzenia;
		Data = data;
		Kwota_podstawowa = kwota_podstawowa;
		Premia = premia;
		ID_Pracownika = iD_Pracownika;
	}

	public int getID_Wynagrodzenia() {
		return ID_Wynagrodzenia;
	}

	public void setID_Wynagrodzenia(int iD_Wynagrodzenia) {
		ID_Wynagrodzenia = iD_Wynagrodzenia;
	}

	public Date getData() {
		return Data;
	}

	public void setData(Date data) {
		Data = data;
	}

	public float getKwota_podstawowa() {
		return Kwota_podstawowa;
	}

	public void setKwota_podstawowa(float kwota_podstawowa) {
		Kwota_podstawowa = kwota_podstawowa;
	}

	public float getPremia() {
		return Premia;
	}

	public void setPremia(float premia) {
		Premia = premia;
	}

	public int getID_Pracownika() {
		return ID_Pracownika;
	}

	public void setID_Pracownika(int iD_Pracownika) {
		ID_Pracownika = iD_Pracownika;
	}

	@Override
	public String toString() {
		return "Wynagrodzenia [ID_Wynagrodzenia=" + ID_Wynagrodzenia + ", Data=" + Data + ", Kwota_podstawowa="
				+ Kwota_podstawowa + ", Premia=" + Premia + ", ID_Pracownika=" + ID_Pracownika + "]";
	}
	
}
