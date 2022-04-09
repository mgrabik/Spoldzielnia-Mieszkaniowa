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
public class RachunkiDAO {

	/* JdbcTemplate */
	@Autowired
	private JdbcTemplate jdbcTemplate;

	/* Constructor for jdbcTemplate */
	public RachunkiDAO(JdbcTemplate jdbcTemplate) {
		super();
		this.jdbcTemplate = jdbcTemplate;
	}

	/* List for data from database */
	public List<Rachunki> list() {

		String sql = "SELECT * FROM Rachunki";
		List<Rachunki> listRachunki = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Rachunki.class));

		return listRachunki;
	}
	
	public List<Rachunki> list_resident() {

		String sql = "SELECT * FROM Rachunki WHERE ID_Rachunku=2";
		List<Rachunki> list_resident = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Rachunki.class));

		return list_resident;
	}

	/* (C)reate - insert new record */
	public void save(Rachunki rachunki) {
		SimpleJdbcInsert insertActor = new SimpleJdbcInsert(jdbcTemplate);
		insertActor.withTableName("Rachunki").usingColumns("Prad", "Gaz", "Woda", "Smieci", "Eksploatacja",
				"Ogrzewanie", "Fundusz_remontowy", "Winda", "Oplacony", "ID_Mieszkania", "ID_Spoldzielni");

		BeanPropertySqlParameterSource param = new BeanPropertySqlParameterSource(rachunki);
		insertActor.execute(param);
	}

	/* (R)ead - Read data from database */
	public Rachunki get(int id) {
		Object[] args = { id };
		String sql = "SELECT * FROM Rachunki WHERE ID_Rachunku = " + args[0];
		Rachunki rachunki = jdbcTemplate.queryForObject(sql, BeanPropertyRowMapper.newInstance(Rachunki.class));
		return rachunki;
	}

	/* (U)pdate - data inside database */
	public void update(Rachunki rachunki) {
		String sql = "UPDATE Rachunki SET Prad=:Prad, Gaz=:Gaz, Woda=:Woda, Smieci=:Smieci, Eksploatacja=:Eksploatacja, Ogrzewanie=:Ogrzewanie, Fundusz_remontowy=:Fundusz_remontowy, Winda=:Winda, Oplacony=:Oplacony, ID_Mieszkania=:ID_Mieszkania, ID_Spoldzielni=:ID_Spoldzielni WHERE ID_Rachunku=:ID_Rachunku";
		BeanPropertySqlParameterSource param = new BeanPropertySqlParameterSource(rachunki);
		NamedParameterJdbcTemplate template = new NamedParameterJdbcTemplate(jdbcTemplate);

		template.update(sql, param);

	}

	/* (D)elete - choosen data */
	public void delete(int id) {
		String sql = "DELETE FROM RACHUNKI WHERE ID_Rachunku = ?";
		jdbcTemplate.update(sql, id);
	}
}
