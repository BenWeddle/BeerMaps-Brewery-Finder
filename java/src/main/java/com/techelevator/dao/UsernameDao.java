package com.techelevator.dao;

import com.techelevator.model.Username;

public interface UsernameDao {

    Username getUsernameById(int userId);

    Username getUsernameByUsername(String name);
}
