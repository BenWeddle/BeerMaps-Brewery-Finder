package com.techelevator.dao;

import com.techelevator.model.Brewery;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
@Component
public class BreweryDaoJdbc implements BreweryDao{

    private JdbcTemplate jdbcTemplate;

    public BreweryDaoJdbc(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Brewery> listAll() {
        List<Brewery> breweriesList = new ArrayList<>();
        String sql = "SELECT brewery_id, name, description, outdoor_seating, pet_friendly, serves_food, on_site_brewing, brewer_id" +
                " FROM brewery ";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()){
            Brewery brewery = mapRowToBrewery(results);
            breweriesList.add(brewery);
        }
        return breweriesList;
    }

    @Override
    public Brewery getBreweryById(int breweryId) {
        Brewery brewery = null;
        String sql = "SELECT brewery_id, name, description, outdoor_seating, pet_friendly, serves_food, on_site_brewing, brewer_id" +
                " FROM brewery WHERE brewery_id = ? ";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, breweryId);
        if(results.next()) {
            brewery = mapRowToBrewery(results);
        }
        return brewery;
    }

    @Override
    public Brewery findBreweryByName(String name) {
        Brewery brewery = null;
        String sql = "SELECT brewery_id, name, description, outdoor_seating, pet_friendly, serves_food, on_site_brewing, brewer_id" +
                " FROM brewery WHERE name = ? ";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, name);
        if(results.next()) {
            brewery = mapRowToBrewery(results);
        }
        return brewery;
    }

    @Override
    public boolean addBrewery(Brewery brewery) {
        String sql = "INSERT INTO brewery (name, description, outdoor_seating, pet_friendly, serves_food, on_site_brewing, brewer_id) " +
                "VALUES (?,?,?,?,?,?,?) ";
        return  jdbcTemplate.update(sql,brewery.getBreweryName(), brewery.getDescription(), brewery.isHasOutDoorSeating(),
                brewery.isPetFriendly(), brewery.isHasFood(), brewery.isHasOnSiteBrewing(), brewery.getBrewerId()) == 0;
    }

    @Override
    public boolean deleteBrewery(int breweryId) {
        String sql = "DELETE FROM brewery WHERE brewery_id = ? " ;

        return jdbcTemplate.update(sql,breweryId) == 0;
    }

    @Override
    public boolean updateBrewery(Brewery brewery) {
        String sql = "UPDATE brewery SET name = ?, description = ?, outdoor_seating = ?, pet_friendly = ?, serves_food = ?, on_site_brewing = ?" +
                ", brewer_id = ? WHERE brewery_id = ?" ;

        return jdbcTemplate.update(sql, brewery.getBreweryName(), brewery.getDescription(), brewery.isHasOutDoorSeating(),
                brewery.isPetFriendly(), brewery.isHasFood(), brewery.isHasOnSiteBrewing(), brewery.getBrewerId() , brewery.getBreweryId()) == 0;
    }
    public Brewery mapRowToBrewery(SqlRowSet sqlRowSet) {
        Brewery brewery = new Brewery();

        brewery.setBreweryId(sqlRowSet.getInt("brewery_id"));
        brewery.setBreweryName(sqlRowSet.getString("name"));
        brewery.setDescription(sqlRowSet.getString("description"));
        brewery.setHasOnSiteBrewing(sqlRowSet.getBoolean("on_site_brewing"));
        brewery.setHasOutDoorSeating(sqlRowSet.getBoolean("outdoor_seating"));
        brewery.setPetFriendly(sqlRowSet.getBoolean("pet_friendly"));
        brewery.setHasFood(sqlRowSet.getBoolean("serves_food"));
        brewery.setBrewerId(sqlRowSet.getInt("brewer_id"));
        return brewery;
        //Need to join tables to set phone number and address_id
    }

}
