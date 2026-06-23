package com.hackhub.dao;

import com.hackhub.model.User;
import com.hackhub.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    // Register User
    public boolean registerUser(User user) {

    boolean success = false;

    String sql = "INSERT INTO users(name,email,password,college,region,skills,interests,availability,profile_image) VALUES(?,?,?,?,?,?,?,?,?)";

    try (
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(sql)
    ) {

        ps.setString(1, user.getName());
        ps.setString(2, user.getEmail());
        ps.setString(3, user.getPassword());
        ps.setString(4, user.getCollege());
        ps.setString(5, user.getRegion());
        ps.setString(6, user.getSkills());
        ps.setString(7, user.getInterests());
        ps.setString(8, user.getAvailability());
        ps.setString(9, user.getProfileImage());

        int rows = ps.executeUpdate();

        System.out.println("Rows inserted: " + rows);

        success = rows > 0;

    } catch (Exception e) {

        System.out.println("REGISTER ERROR:");
        e.printStackTrace();

        return false;
    }

    return success;
}

    // Login User
    public User loginUser(
        String email,
        String password) {

    User user = null;

    String sql =
            "SELECT * FROM users "
            + "WHERE email=? "
            + "AND password=?";

    try (

        Connection con =
                DBConnection.getConnection();

        PreparedStatement ps =
                con.prepareStatement(sql)

    ) {

        ps.setString(1, email);
        ps.setString(2, password);

        ResultSet rs =
                ps.executeQuery();

        if (rs.next()) {

            user = new User();

            user.setUserId(
                    rs.getInt("user_id"));

            user.setName(
                    rs.getString("name"));

            user.setEmail(
                    rs.getString("email"));

            user.setCollege(
                    rs.getString("college"));

            user.setRegion(
                    rs.getString("region"));

            user.setSkills(
                    rs.getString("skills"));

            user.setInterests(
                    rs.getString("interests"));

            user.setAvailability(
                    rs.getString("availability"));
        }

    } catch (Exception e) {

        e.printStackTrace();
    }

    return user;
}
}