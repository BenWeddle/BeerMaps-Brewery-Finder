package com.techelevator.dao;

import com.techelevator.model.Rating;

import java.util.List;

public interface RatingDao {

    Rating getRatingByRatingId(int id);
    List<Rating> getRatingByBeverage(int beverageId);

    List<Rating> listRatingByType(String type);

    Rating getRatingById(int id, String type);

    boolean addRating(Rating rating);

    boolean deleteRating(int id, String type);

    boolean updateRating(Rating rating);

}
