package com.techelevator.dao;

import com.techelevator.model.Beverage;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
@Component
public class BeverageDaoJdbc implements BeverageDao{

    private JdbcTemplate jdbcTemplate;

    public BeverageDaoJdbc(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }
    @Override
    public List<Beverage> listAll() {
        List<Beverage> beveragesList = new ArrayList<>();

        String sql = "SELECT * " +
                "FROM beverage";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()){
            Beverage beverage = mapRowToBeverage(results);
            beveragesList.add(beverage);
        }
        return beveragesList;
    }

    @Override
    public List<Beverage> listAllBeveragesByBreweryId(int breweryId) {
        List<Beverage> beverageList = new ArrayList<>();
        String sql = "SELECT * " +
                "FROM beverage " +
                "JOIN brewery_beverage bb " +
                "ON beverage.beverage_id = bb.beverage_id "+
                "WHERE brewery_id = ? ";
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, breweryId);
            while (results.next()){
                Beverage beverage = mapRowToBeverage(results);
                beverageList.add(beverage);
            }
            return beverageList;


    }

    @Override
    public Beverage getBeverageById(int beverageId) {
        Beverage beverage = null;
        String sql = "SELECT * " +
                "FROM beverage " +
                "WHERE beverage_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, beverageId);
        if (results.next()) {
            beverage = mapRowToBeverage(results);
        }
        return beverage;
    }

    @Override
    public Beverage getBeverageByName(String name) {
        Beverage beverage = null;
        String sql = "SELECT * " +
                "FROM beverage " +
                "WHERE beverage_name = ? ";
         SqlRowSet results = jdbcTemplate.queryForRowSet(sql, name);
         if (results.next()) {
             beverage = mapRowToBeverage(results);
         }
         return beverage;
    }

    @Override
    public boolean addBeverageGlobally(Beverage beverage) {
        String sql = " INSERT INTO beverage (beverage_name, description, image_url, abv, beverage_type, ibu, availability) " +
                "VALUES (?,?,?,?,?,?,?) " ;


        return jdbcTemplate.update(sql, beverage.getBeverageName(), beverage.getDescription(), beverage.getImageUrl()
        , beverage.getAbv(), beverage.getBeverageType(), beverage.getIbu(), beverage.isAvailable() ) == 0;
    }

    @Override
    public boolean deleteBeverageFromBrewery(int beverageId) {
        String sql = "DELETE FROM brewery_beverage WHERE beverage_id = ?";

        return jdbcTemplate.update(sql, beverageId) == 0;
    }

    @Override
    public boolean deleteBeverageGlobally(int beverageId) {
        String sql = "BEGIN TRANSACTION; " +
                "DELETE FROM brewery_beverage WHERE beverage_id = ?; " +
                "DELETE FROM beverage WHERE beverage_id = ?; " +
                "COMMIT;";

        return jdbcTemplate.update(sql, beverageId, beverageId) == 0;
    }

    @Override
    public boolean updateBeverage(Beverage beverage) {
        String sql = " UPDATE beverage SET beverage_name = ?, description = ?, image_url = ?, abv = ?, beverage_type = ?, ibu = ?, availability = ? " +
                "WHERE beverage_id = ?" ;
        return jdbcTemplate.update(sql, beverage.getBeverageName(), beverage.getDescription(), beverage.getImageUrl()
                , beverage.getAbv(), beverage.getBeverageType(), beverage.getIbu(), beverage.isAvailable(), beverage.getBeverageId() ) == 0;
    }

    public Beverage mapRowToBeverage(SqlRowSet rowSet){
        Beverage beverage = new Beverage();
        beverage.setBeverageId(rowSet.getInt("beverage_id"));
        beverage.setBeverageName(rowSet.getString("beverage_name"));
        beverage.setDescription(rowSet.getString("description"));
        beverage.setImageUrl(rowSet.getString("image_url"));
        beverage.setAbv(rowSet.getDouble("abv"));
        beverage.setBeverageType(rowSet.getString("beverage_type"));
        beverage.setIbu(rowSet.getInt("ibu"));
        beverage.setIsAvailable(rowSet.getBoolean("availability"));
    return beverage;
    }

}
