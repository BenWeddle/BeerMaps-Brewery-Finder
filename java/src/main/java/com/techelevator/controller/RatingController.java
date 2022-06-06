package com.techelevator.controller;

import com.techelevator.dao.BeverageDao;
import com.techelevator.dao.BreweryDao;
import com.techelevator.dao.RatingDao;
import com.techelevator.dao.UserDao;
import com.techelevator.model.Rating;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@CrossOrigin
@RequestMapping(value = "/rating")
@RestController
public class RatingController {

    private BeverageDao beverageDao;
    private UserDao userDao;
    private BreweryDao breweryDao;
    private RatingDao ratingDao;

    public RatingController(BeverageDao beverageDao, UserDao userDao, BreweryDao breweryDao, RatingDao ratingDao) {
        this.beverageDao = beverageDao;
        this.userDao = userDao;
        this.breweryDao = breweryDao;
        this.ratingDao = ratingDao;
    }

    @ResponseStatus(HttpStatus.ACCEPTED)
    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_BREWER','ROLE_USER')")
    @RequestMapping(path = "/{type}/{ratingId}", method = RequestMethod.GET)
    public Rating getRatingByRatingId(@PathVariable int ratingId, @PathVariable String type) {
        return ratingDao.getRatingByRatingId(ratingId, type);
    }

    @ResponseStatus(HttpStatus.ACCEPTED)
    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_BREWER','ROLE_USER')")
    @RequestMapping(path = "/all/{type}/{id}", method = RequestMethod.GET)
    public List<Rating> getRatingsByTypeAndId(@PathVariable int id, @PathVariable String type) {
        return ratingDao.getRatingsByTypeAndId(id, type);
    }

    @ResponseStatus(HttpStatus.ACCEPTED)
    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_BREWER','ROLE_USER')")
    @RequestMapping(path = "/list/{type}", method = RequestMethod.GET)
    public List<Rating> listRatingsByType(@PathVariable String type) {
        return ratingDao.listRatingByType(type);
    }

    @ResponseStatus(HttpStatus.CREATED)
    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_BREWER','ROLE_USER')")
    @RequestMapping(path = "/add", method = RequestMethod.POST)
    public boolean addRating(@RequestBody Rating rating, Principal principal) {
        return ratingDao.addRating(rating, principal);
    }

    @ResponseStatus(HttpStatus.ACCEPTED)
    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_BREWER','ROLE_USER')")
    @RequestMapping(path = "/delete/{ratingId}", method = RequestMethod.DELETE)
    public boolean deleteRating(@PathVariable int ratingId) {
        return ratingDao.deleteRating(ratingId);
    }

    @ResponseStatus(HttpStatus.ACCEPTED)
    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_BREWER','ROLE_USER')")
    @RequestMapping(path = "/add", method = RequestMethod.PUT)
    public boolean updateRating(@RequestBody Rating rating) {
        return ratingDao.updateRating(rating);
    }
}
