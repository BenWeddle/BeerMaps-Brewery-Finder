package com.techelevator.dao;

import com.techelevator.model.User;
import com.techelevator.model.Username;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class UsernameDaoJdbc implements UsernameDao{

    private JdbcTemplate jdbcTemplate;

    public UsernameDaoJdbc(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public Username getUsernameById(int userId) {
        Username username = null;
        String sql = "SELECT username, user_id FROM users WHERE user_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
        if(results.next()){
            username = mapRowToUsername(results);
        }
        return username;
    }

    public Username mapRowToUsername(SqlRowSet rowSet){
        Username username = new Username();
        username.setUsername(rowSet.getString("username"));
        username.setUserId(rowSet.getInt("user_id"));
        return username;
    }
}
