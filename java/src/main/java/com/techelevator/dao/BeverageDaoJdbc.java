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
                "WHERE beverage_name = '%?%'";
         SqlRowSet results = jdbcTemplate.queryForRowSet(sql, name);
         if (results.next()) {
             beverage = mapRowToBeverage(results);
         }
         return beverage;
    }

    @Override
    public boolean addABeverage(Beverage beverage) {
        return false;
    }

    @Override
    public boolean deleteBeverage(int beverageId) {
        return false;
    }

    @Override
    public boolean updateBeverage(Beverage beverage) {
        return false;
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
