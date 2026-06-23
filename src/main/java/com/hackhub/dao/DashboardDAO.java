package com.hackhub.dao;

import com.hackhub.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DashboardDAO {

    public int getUserCount() {

        return getCount(
                "SELECT COUNT(*) FROM users");
    }

    public int getTeamCount() {

        return getCount(
                "SELECT COUNT(*) FROM teams");
    }

    public int getProjectCount() {

        return getCount(
                "SELECT COUNT(*) FROM projects");
    }

    public int getRequestCount() {

        return getCount(
                "SELECT COUNT(*) FROM requests");
    }

    private int getCount(
            String sql) {

        int count = 0;

        try (

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery()

        ) {

            if (rs.next()) {

                count = rs.getInt(1);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return count;
    }
}