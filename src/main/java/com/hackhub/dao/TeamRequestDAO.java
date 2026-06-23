package com.hackhub.dao;

import com.hackhub.model.TeamRequest;
import com.hackhub.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TeamRequestDAO {

    public boolean sendRequest(
            TeamRequest request) {

        boolean success = false;

        String sql
                = "INSERT INTO team_requests "
                + "(team_id,sender_id,receiver_id,message,status) "
                + "VALUES(?,?,?,?,?)";

        try (
                Connection con
                = DBConnection.getConnection(); PreparedStatement ps
                = con.prepareStatement(sql)) {

            ps.setInt(
                    1,
                    request.getTeamId());

            ps.setInt(
                    2,
                    request.getSenderId());

            ps.setInt(
                    3,
                    request.getReceiverId());

            ps.setString(
                    4,
                    request.getMessage());

            ps.setString(
                    5,
                    request.getStatus());

            success
                    = ps.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return success;
    }

    public List<TeamRequest> getRequestsByReceiver(
            int receiverId) {

        List<TeamRequest> requests
                = new ArrayList<>();

        String sql
                = "SELECT * FROM team_requests "
                + "WHERE receiver_id=?";

        try (
                Connection con
                = DBConnection.getConnection(); PreparedStatement ps
                = con.prepareStatement(sql)) {

            ps.setInt(1, receiverId);

            ResultSet rs
                    = ps.executeQuery();

            while (rs.next()) {

                TeamRequest request
                        = new TeamRequest();

                request.setRequestId(
                        rs.getInt("request_id"));

                request.setTeamId(
                        rs.getInt("team_id"));

                request.setSenderId(
                        rs.getInt("sender_id"));

                request.setReceiverId(
                        rs.getInt("receiver_id"));

                request.setMessage(
                        rs.getString("message"));

                request.setStatus(
                        rs.getString("status"));

                requests.add(request);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return requests;
    }

    public boolean acceptRequest(
            int requestId,
            String email) {

        boolean success = false;

        String sql
                = "UPDATE team_requests "
                + "SET status='Accepted', "
                + "contact_email=? "
                + "WHERE request_id=?";

        try (
                Connection con
                = DBConnection.getConnection(); PreparedStatement ps
                = con.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setInt(2, requestId);

            success
                    = ps.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return success;
    }
    public boolean rejectRequest(
        int requestId) {

    boolean success = false;

    String sql =
            "UPDATE team_requests "
            + "SET status='Rejected' "
            + "WHERE request_id=?";

    try (

        Connection con =
                DBConnection.getConnection();

        PreparedStatement ps =
                con.prepareStatement(sql)

    ) {

        ps.setInt(1, requestId);

        success =
                ps.executeUpdate() > 0;

    } catch(Exception e) {

        e.printStackTrace();
    }

    return success;
}
    public TeamRequest getRequestById(
        int requestId) {

    TeamRequest request = null;

    String sql =
            "SELECT * FROM team_requests "
            + "WHERE request_id=?";

    try (

        Connection con =
                DBConnection.getConnection();

        PreparedStatement ps =
                con.prepareStatement(sql)

    ) {

        ps.setInt(1, requestId);

        ResultSet rs =
                ps.executeQuery();

        if(rs.next()) {

            request =
                    new TeamRequest();

            request.setRequestId(
                    rs.getInt("request_id"));

            request.setTeamId(
                    rs.getInt("team_id"));

            request.setSenderId(
                    rs.getInt("sender_id"));

            request.setReceiverId(
                    rs.getInt("receiver_id"));

            request.setStatus(
                    rs.getString("status"));
        }

    } catch(Exception e) {

        e.printStackTrace();
    }

    return request;
}
}
