package bdbt_gra_projS;

import java.sql.Date;

public class Pracownicy {

	/* Field from database */
	private int ID_Pracownika;
	private String Imie;
	private String Nazwisko;
	private String Plec;
	private Date Data_urodzenia;
	private String PESEL;
	private String Nr_telefonu;
	private String Email;
	private Date Data_rozpoczenia_pracy;
	private String Ubezpieczenie;
	private Date Data_ostatniego_badania;
	private String Nr_konta;
	private int ID_Spoldzielni;
	private int ID_Stanowiska;
	private int ID_Adresu;

	public Pracownicy() {

	}

	/* Constructor */
	public Pracownicy(int iD_Pracownika, String imie, String nazwisko, String plec, Date data_urodzenia, String pESEL,
			String nr_telefonu, String email, Date data_rozpoczenia_pracy, String ubezpieczenie,
			Date data_ostatniego_badania, String nr_konta, int iD_Spoldzielni, int iD_Stanowiska, int iD_Adresu) {
		super();
		ID_Pracownika = iD_Pracownika;
		Imie = imie;
		Nazwisko = nazwisko;
		Plec = plec;
		Data_urodzenia = data_urodzenia;
		PESEL = pESEL;
		Nr_telefonu = nr_telefonu;
		Email = email;
		Data_rozpoczenia_pracy = data_rozpoczenia_pracy;
		Ubezpieczenie = ubezpieczenie;
		Data_ostatniego_badania = data_ostatniego_badania;
		Nr_konta = nr_konta;
		ID_Spoldzielni = iD_Spoldzielni;
		ID_Stanowiska = iD_Stanowiska;
		ID_Adresu = iD_Adresu;
	}

	
	/* Getters and setters */

	public int getID_Pracownika() {
		return ID_Pracownika;
	}

	public void setID_Pracownika(int iD_Pracownika) {
		ID_Pracownika = iD_Pracownika;
	}

	public String getImie() {
		return Imie;
	}

	public void setImie(String imie) {
		Imie = imie;
	}

	public String getNazwisko() {
		return Nazwisko;
	}

	public void setNazwisko(String nazwisko) {
		Nazwisko = nazwisko;
	}

	public String getPlec() {
		return Plec;
	}

	public void setPlec(String plec) {
		Plec = plec;
	}

	public Date getData_urodzenia() {
		return Data_urodzenia;
	}

	public void setData_urodzenia(Date data) {
		Data_urodzenia = data;
	}

	public String getPESEL() {
		return PESEL;
	}

	public void setPESEL(String pESEL) {
		PESEL = pESEL;
	}

	public String getNr_telefonu() {
		return Nr_telefonu;
	}

	public void setNr_telefonu(String nr_telefonu) {
		Nr_telefonu = nr_telefonu;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public Date getData_rozpoczenia_pracy() {
		return Data_rozpoczenia_pracy;
	}

	public void setData_rozpoczenia_pracy(Date data_rozpoczenia_pracy) {
		Data_rozpoczenia_pracy = data_rozpoczenia_pracy;
	}

	public String getUbezpieczenie() {
		return Ubezpieczenie;
	}

	public void setUbezpieczenie(String ubezpieczenie) {
		Ubezpieczenie = ubezpieczenie;
	}

	public Date getData_ostatniego_badania() {
		return Data_ostatniego_badania;
	}

	public void setData_ostatniego_badania(Date data_ostatniego_badania) {
		Data_ostatniego_badania = data_ostatniego_badania;
	}

	public String getNr_konta() {
		return Nr_konta;
	}

	public void setNr_konta(String nr_konta) {
		Nr_konta = nr_konta;
	}

	public int getID_Spoldzielni() {
		return ID_Spoldzielni;
	}

	public void setID_Spoldzielni(int iD_Spoldzielni) {
		ID_Spoldzielni = iD_Spoldzielni;
	}

	public int getID_Stanowiska() {
		return ID_Stanowiska;
	}

	public void setID_Stanowiska(int iD_Stanowiska) {
		ID_Stanowiska = iD_Stanowiska;
	}

	public int getID_Adresu() {
		return ID_Adresu;
	}

	public void setID_Adresu(int iD_Adresu) {
		ID_Adresu = iD_Adresu;
	}

	
	/* toString() */
	
	@Override
	public String toString() {
		return "Pracownicy [ID_Pracownika=" + ID_Pracownika + ", Imie=" + Imie + ", Nazwisko=" + Nazwisko + ", Plec="
				+ Plec + ", Data=" + Data_urodzenia + ", PESEL=" + PESEL + ", Nr_telefonu=" + Nr_telefonu + ", Email=" + Email
				+ ", Data_rozpoczenia_pracy=" + Data_rozpoczenia_pracy + ", Ubezpieczenie=" + Ubezpieczenie
				+ ", Data_ostatniego_badania=" + Data_ostatniego_badania + ", Nr_konta=" + Nr_konta
				+ ", ID_Spoldzielni=" + ID_Spoldzielni + ", ID_Stanowiska=" + ID_Stanowiska + ", ID_Adresu=" + ID_Adresu
				+ "]";
	}
}
