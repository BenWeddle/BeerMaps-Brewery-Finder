package com.techelevator.dao;

import com.techelevator.model.Brewery;

import java.util.List;

public interface BreweryDao {

    List<Brewery> listAll();

    Brewery getBreweryById(int breweryId);

    Brewery findBreweryByName(String name);

    boolean addBrewery(Brewery brewery);

    boolean deleteBrewery(Brewery brewery);

    boolean updateBrewery(Brewery brewery);







}
