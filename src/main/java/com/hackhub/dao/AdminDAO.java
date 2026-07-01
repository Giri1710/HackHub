package com.hackhub.dao;

import com.hackhub.model.Admin;
import com.hackhub.util.DBConnection;

import java.sql.*;

public class AdminDAO {

    public Admin login(String username, String password) {

        Admin admin = null;

        String sql =
            "SELECT * FROM admins WHERE username=? AND password=?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                admin = new Admin();

                admin.setAdminId(rs.getInt("admin_id"));
                admin.setUsername(rs.getString("username"));
                admin.setPassword(rs.getString("password"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return admin;
    }
}