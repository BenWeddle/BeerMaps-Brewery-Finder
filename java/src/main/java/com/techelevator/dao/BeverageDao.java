package com.techelevator.dao;

import com.techelevator.model.Beverage;

import java.util.List;

public interface BeverageDao {
    List<Beverage> listAll();

    List<Beverage> listAllBeveragesByBreweryId(int breweryId);

    Beverage getBeverageById(int beverageId);

    Beverage getBeverageByName(String name);

    boolean addABeverage(Beverage beverage);

    boolean deleteBeverage(int beverageId);

    boolean updateBeverage(Beverage beverage);

}
