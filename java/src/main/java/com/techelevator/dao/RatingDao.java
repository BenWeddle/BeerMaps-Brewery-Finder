package com.techelevator.dao;

import com.techelevator.model.Rating;

import java.util.List;

public interface RatingDao {

    Rating getRatingByRatingId(int ratingId);

    List<Rating> getRatingsByBeverage(int beverageId);

    List<Rating> listRatingByType(String type);

    Rating getRatingById(int id, String type);

    boolean addRating(Rating rating);

    boolean deleteRating(int ratingId);

    boolean updateRating(Rating rating);

}
