package com.hackhub.dao;

import com.hackhub.model.Hackathon;
import com.hackhub.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HackathonDAO {

    public List<Hackathon> getAllHackathons() {

        List<Hackathon> hackathons
                = new ArrayList<>();

        String sql
                = "SELECT * FROM hackathons";

        try (
                Connection con
                = DBConnection.getConnection(); PreparedStatement ps
                = con.prepareStatement(sql); ResultSet rs
                = ps.executeQuery();) {

            while (rs.next()) {

                Hackathon h
                        = new Hackathon();

                h.setHackathonId(
                        rs.getInt("hackathon_id"));

                h.setTitle(
                        rs.getString("title"));

                h.setDescription(
                        rs.getString("description"));

                h.setOrganizer(
                        rs.getString("organizer"));

                h.setLocation(
                        rs.getString("location"));

                h.setRegion(
                        rs.getString("region"));

                h.setRegistrationDeadline(
                        rs.getDate(
                                "registration_deadline"));

                h.setStartDate(
                        rs.getDate("start_date"));

                h.setEndDate(
                        rs.getDate("end_date"));

                h.setStatus(
                        rs.getString("status"));

                hackathons.add(h);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return hackathons;
    }

    public boolean addHackathon(Hackathon hackathon) {

        boolean success = false;

        String sql =
        "INSERT INTO hackathons "
        + "(title,description,organizer,"
        + "location,region,start_date,"
        + "end_date,registration_deadline,status) "
        + "VALUES(?,?,?,?,?,?,?,?,?)";

        try (
                Connection con
                = DBConnection.getConnection(); PreparedStatement ps
                = con.prepareStatement(sql)) {

            ps.setString(1, hackathon.getTitle());

            ps.setString(2, hackathon.getDescription());

            ps.setString(3, hackathon.getOrganizer());

            ps.setString(4, hackathon.getLocation());

            ps.setString(5, hackathon.getRegion());

            ps.setDate(6, hackathon.getStartDate());

            ps.setDate(7, hackathon.getEndDate());

            ps.setDate(8,
                    hackathon.getRegistrationDeadline());

            ps.setString(9, hackathon.getStatus());

            int rows = ps.executeUpdate();

            success = rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }

    public List<Hackathon> filterHackathons(
            String location,
            String status) {

        List<Hackathon> list
                = new ArrayList<>();

        String sql
                = "SELECT * FROM hackathons "
                + "WHERE location LIKE ? "
                + "AND status LIKE ?";

        try (
                Connection con
                = DBConnection.getConnection(); PreparedStatement ps
                = con.prepareStatement(sql)) {

            ps.setString(
                    1,
                    "%" + location + "%");

            ps.setString(
                    2,
                    "%" + status + "%");

            ResultSet rs
                    = ps.executeQuery();

            while (rs.next()) {

                Hackathon h
                        = new Hackathon();

                h.setHackathonId(
                        rs.getInt("hackathon_id"));

                h.setTitle(
                        rs.getString("title"));

                h.setDescription(
                        rs.getString("description"));

                h.setOrganizer(
                        rs.getString("organizer"));

                h.setLocation(
                        rs.getString("location"));

                h.setRegion(
                        rs.getString("region"));

                h.setStartDate(
                        rs.getDate("start_date"));

                h.setEndDate(
                        rs.getDate("end_date"));

                h.setRegistrationDeadline(
                        rs.getDate(
                                "registration_deadline"));

                h.setStatus(
                        rs.getString("status"));

                list.add(h);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return list;

    }

}
