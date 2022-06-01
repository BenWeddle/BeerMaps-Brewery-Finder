package com.techelevator.controller;

import com.techelevator.dao.BeverageDao;
import com.techelevator.dao.BreweryDao;
import com.techelevator.dao.UserDao;
import com.techelevator.model.Brewery;
import com.techelevator.model.User;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@CrossOrigin
@RestController
@RequestMapping(value = "/brewery")
public class BreweryController {

    private BreweryDao breweryDao;
    private UserDao userDao;
    private BeverageDao beverageDao;

    public BreweryController(BreweryDao breweryDao, UserDao userDao, BeverageDao beverageDao){
        this.beverageDao = beverageDao;
        this.userDao = userDao;
        this.breweryDao = breweryDao;
    }
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/add", method = RequestMethod.POST)
    public boolean addBrewery(@RequestBody Brewery brewery, Principal principal) {
        boolean success = true;

//        if (isAdmin(userDao.currentUser(principal))){
//            breweryDao.addBrewery(brewery);
//            success = true;
//        }

        breweryDao.addBrewery(brewery, principal);
        return success;
    }

    public boolean isAdmin(User user){
        return user.getAuthorities().contains("ROLE_ADMIN");
    }

}
