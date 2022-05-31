package com.techelevator.controller;

import com.techelevator.dao.BeverageDao;
import com.techelevator.dao.BreweryDao;
import com.techelevator.dao.UserDao;
import com.techelevator.model.Beverage;
import com.techelevator.model.User;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

//Authorization
@CrossOrigin
@RequestMapping(value = "/beverage")
@RestController
public class BeverageController {

    private BeverageDao beverageDao;
    private UserDao userDao;
    private BreweryDao breweryDao;

    public BeverageController(BeverageDao beverageDao, UserDao userDao, BreweryDao breweryDao) {
        this.beverageDao = beverageDao;
        this.userDao = userDao;
        this.breweryDao = breweryDao;

    }
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/add", method = RequestMethod.POST)
    public boolean addBeverage(@RequestBody Beverage beverage, Principal principal) {
        boolean success = false;

        /* Need to verify user
        * is not a user */
        if (isBrewer(userDao.currentUser(principal))){
            beverageDao.addABeverage(beverage);
        success = true;
        }
        return success;
    }




    public boolean isBrewer(User user) {
       return user.getAuthorities().contains("ROLE_BREWER");
    }
}
