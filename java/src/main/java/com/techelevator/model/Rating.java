package com.techelevator.model;

import java.time.LocalDate;

public class Rating {
    private int id;
    private String type;
    private int userId;
    private int rating;
    private String ratingText;
    private LocalDate date;

    public Rating(){

    }

    public Rating(int id, String type, int userId, int rating, String ratingText, LocalDate date) {
        this.id = id;
        this.type = type;
        this.userId = userId;
        this.rating = rating;
        this.ratingText = ratingText;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getRatingText() {
        return ratingText;
    }

    public void setRatingText(String ratingText) {
        this.ratingText = ratingText;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }
}
