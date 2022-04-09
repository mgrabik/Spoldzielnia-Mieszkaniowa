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
public class WynagrodzeniaDAO {
	
	/* JdbcTemplate */
	@Autowired
	private JdbcTemplate jdbcTemplate;

	/* Constructor for jdbcTemplate */
	public WynagrodzeniaDAO(JdbcTemplate jdbcTemplate) {
		super();
		this.jdbcTemplate = jdbcTemplate;
	}

	/* List for data from database */
	public List<Wynagrodzenia> list() {

		String sql = "SELECT * FROM Wynagrodzenia";
		List<Wynagrodzenia> listWynagrodzenia = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Wynagrodzenia.class));

		return listWynagrodzenia;
	}
	
	/* (C)reate - insert new record */
	public void save(Wynagrodzenia wynagrodzenia) {
		SimpleJdbcInsert insertActor = new SimpleJdbcInsert(jdbcTemplate);
		insertActor.withTableName("Wynagrodzenia").usingColumns("Data", "Kwota_podstawowa", "Premia", "ID_Pracownika");

		BeanPropertySqlParameterSource param = new BeanPropertySqlParameterSource(wynagrodzenia);
		insertActor.execute(param);
	}

	/* (R)ead - Read data from database */
	public Wynagrodzenia get(int id) {
		Object[] args = { id };
		String sql = "SELECT * FROM Wynagrodzenia WHERE ID_Wynagrodzenia = " + args[0];
		Wynagrodzenia wynagrodzenia = jdbcTemplate.queryForObject(sql, BeanPropertyRowMapper.newInstance(Wynagrodzenia.class));
		return wynagrodzenia;
	}

	/* (U)pdate - data inside database */
	public void update(Wynagrodzenia wynagrodzenia) {
		String sql = "UPDATE Wynagrodzenia SET Data=:Data, Kwota_podstawowa=:Kwota_podstawowa, Premia=:Premia, ID_Pracownika=:ID_Pracownika WHERE ID_Wynagrodzenia=:ID_Wynagrodzenia";
		BeanPropertySqlParameterSource param = new BeanPropertySqlParameterSource(wynagrodzenia);
		NamedParameterJdbcTemplate template = new NamedParameterJdbcTemplate(jdbcTemplate);

		template.update(sql, param);

	}

	/* (D)elete - choosen data */
	public void delete(int id) {
		String sql = "DELETE FROM Wynagrodzenia WHERE ID_Wynagrodzenia = ?";
		jdbcTemplate.update(sql, id);
	}

}
