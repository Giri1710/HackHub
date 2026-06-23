package com.hackhub.dao;

import com.hackhub.model.Request;
import com.hackhub.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RequestDAO {

    public boolean sendRequest(
            Request request) {

        boolean success = false;

        String sql =
                "INSERT INTO requests "
                + "(sender_id, receiver_id, request_type, "
                + "team_id, project_id, message, status) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql)

        ) {

            ps.setInt(
                    1,
                    request.getSenderId());

            ps.setInt(
                    2,
                    request.getReceiverId());

            ps.setString(
                    3,
                    request.getRequestType());

            ps.setInt(
                    4,
                    request.getTeamId());

            ps.setInt(
                    5,
                    request.getProjectId());

            ps.setString(
                    6,
                    request.getMessage());

            ps.setString(
                    7,
                    request.getStatus());

            success =
                    ps.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return success;
    }
    public List<Request> getAllRequests() {

    List<Request> requests =
            new ArrayList<>();

    String sql =
            "SELECT * FROM requests";

    try (

        Connection con =
                DBConnection.getConnection();

        PreparedStatement ps =
                con.prepareStatement(sql);

        ResultSet rs =
                ps.executeQuery()

    ) {

        while (rs.next()) {

            Request request =
                    new Request();

            request.setRequestId(
                    rs.getInt("request_id"));

            request.setSenderId(
                    rs.getInt("sender_id"));

            request.setReceiverId(
                    rs.getInt("receiver_id"));

            request.setRequestType(
                    rs.getString("request_type"));

            request.setTeamId(
                    rs.getInt("team_id"));

            request.setProjectId(
                    rs.getInt("project_id"));

            request.setMessage(
                    rs.getString("message"));

            request.setStatus(
                    rs.getString("status"));
            request.setContactEmail(
        rs.getString(
                "contact_email"));

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

    String sql =
            "UPDATE requests "
            + "SET status='Accepted', "
            + "contact_email=? "
            + "WHERE request_id=?";

    try (

        Connection con =
                DBConnection.getConnection();

        PreparedStatement ps =
                con.prepareStatement(sql)

    ) {

        ps.setString(
                1,
                email);

        ps.setInt(
                2,
                requestId);

        success =
                ps.executeUpdate() > 0;

    } catch (Exception e) {

        e.printStackTrace();
    }

    return success;
}
    public boolean rejectRequest(
        int requestId) {

    boolean success = false;

    String sql =
            "UPDATE requests "
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

    } catch (Exception e) {

        e.printStackTrace();
    }

    return success;
}
    public List<Request> getSentRequests(
        int userId) {

    List<Request> requests =
            new ArrayList<>();

    String sql =
            "SELECT * FROM requests "
            + "WHERE sender_id=?";

    try (

        Connection con =
                DBConnection.getConnection();

        PreparedStatement ps =
                con.prepareStatement(sql)

    ) {

        ps.setInt(1, userId);

        ResultSet rs =
                ps.executeQuery();

        while (rs.next()) {

            Request request =
                    new Request();

            request.setRequestId(
                    rs.getInt("request_id"));

            request.setSenderId(
                    rs.getInt("sender_id"));

            request.setReceiverId(
                    rs.getInt("receiver_id"));

            request.setRequestType(
                    rs.getString("request_type"));

            request.setTeamId(
                    rs.getInt("team_id"));

            request.setProjectId(
                    rs.getInt("project_id"));

            request.setMessage(
                    rs.getString("message"));

            request.setStatus(
                    rs.getString("status"));
            request.setContactEmail(
        rs.getString(
                "contact_email"));

            requests.add(request);
        }

    } catch (Exception e) {

        e.printStackTrace();
    }

    return requests;
}
    public List<Request> getReceivedRequests(
        int userId) {

    List<Request> requests =
            new ArrayList<>();

    String sql =
            "SELECT * FROM requests "
            + "WHERE receiver_id=?";

    try (

        Connection con =
                DBConnection.getConnection();

        PreparedStatement ps =
                con.prepareStatement(sql)

    ) {

        ps.setInt(1, userId);

        ResultSet rs =
                ps.executeQuery();

        while (rs.next()) {

            Request request =
                    new Request();

            request.setRequestId(
                    rs.getInt("request_id"));

            request.setSenderId(
                    rs.getInt("sender_id"));

            request.setReceiverId(
                    rs.getInt("receiver_id"));

            request.setRequestType(
                    rs.getString("request_type"));

            request.setTeamId(
                    rs.getInt("team_id"));

            request.setProjectId(
                    rs.getInt("project_id"));

            request.setMessage(
                    rs.getString("message"));

            request.setStatus(
                    rs.getString("status"));
            request.setContactEmail(
        rs.getString(
                "contact_email"));

            requests.add(request);
        }

    } catch (Exception e) {

        e.printStackTrace();
    }

    return requests;
}
}