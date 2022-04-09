package bdbt_gra_projS;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

@Repository
public class PracownicyDAO {

	/* JdbcTemplate */
	@Autowired
	private JdbcTemplate jdbcTemplate;

	/* Constructor for jdbcTemplate */
	public PracownicyDAO(JdbcTemplate jdbcTemplate) {
		super();
		this.jdbcTemplate = jdbcTemplate;
	}

	/* List for data from database */
	public List<Pracownicy> list() {

		String sql = "SELECT * FROM Pracownicy";
		List<Pracownicy> listPracownicy = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Pracownicy.class));

		return listPracownicy;
	}

	/* (C)reate - insert new record */
	public void save(Pracownicy pracownicy) {
		SimpleJdbcInsert insertActor = new SimpleJdbcInsert(jdbcTemplate);
		insertActor.withTableName("Pracownicy").usingColumns("Imie", "Nazwisko", "Plec", "Data_urodzenia", "PESEL",
				"Nr_telefonu", "Email", "Data_rozpoczenia_pracy", "Ubezpieczenie", "Data_ostatniego_badania",
				"Nr_konta", "ID_Spoldzielni", "ID_Stanowiska", "ID_Adresu");

		BeanPropertySqlParameterSource param = new BeanPropertySqlParameterSource(pracownicy);
		insertActor.execute(param);
	}

	/* (R)ead - Read data from database */
	public Pracownicy get(int id) {
		Object[] args = { id };
		String sql = "SELECT * FROM Pracownicy WHERE ID_Pracownika = " + args[0];
		Pracownicy pracownicy = jdbcTemplate.queryForObject(sql, BeanPropertyRowMapper.newInstance(Pracownicy.class));
		return pracownicy;
	}

	/* (U)pdate - data inside database */
	public void update(Pracownicy pracownicy) {
		String sql = "UPDATE Pracownicy SET Imie=:Imie, Nazwisko=:Nazwisko, Plec=:Plec, Data_urodzenia=:Data_urodzenia, PESEL=:PESEL, Nr_telefonu=:Nr_telefonu, Email=:Email, Data_rozpoczenia_pracy=:Data_rozpoczenia_pracy, Ubezpieczenie=:Ubezpieczenie, Data_ostatniego_badania=:Data_ostatniego_badania, Nr_konta=:Nr_konta, ID_Spoldzielni=:ID_Spoldzielni, ID_Stanowiska=:ID_Stanowiska, ID_Adresu=:ID_Adresu WHERE ID_Pracownika=:ID_Pracownika";
		BeanPropertySqlParameterSource param = new BeanPropertySqlParameterSource(pracownicy);
		NamedParameterJdbcTemplate template = new NamedParameterJdbcTemplate(jdbcTemplate);

		template.update(sql, param);

	}

	/* (D)elete - choosen data */
	public void delete(int id) {
		String sql = "DELETE FROM PRACOWNICY WHERE ID_Pracownika = ?";
		jdbcTemplate.update(sql, id);
	}
}
