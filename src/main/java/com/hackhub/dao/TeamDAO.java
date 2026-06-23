/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hackhub.dao;

import com.hackhub.model.Team;
import com.hackhub.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author acer
 */
public class TeamDAO {

    public boolean createTeam(Team team) {

        boolean success = false;

        String sql
                = "INSERT INTO teams(team_name,hackathon_id,leader_id) VALUES(?,?,?)";

        try (
                Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql);) {

            ps.setString(1, team.getTeamName());
            ps.setInt(2, team.getHackathonId());
            ps.setInt(3, team.getLeaderId());

            success = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }

    public List<Team> getAllTeams() {

        List<Team> teams
                = new ArrayList<>();

        String sql
                = "SELECT t.*, "
                + "h.title AS hackathon_name, "
                + "u.name AS leader_name "
                + "FROM teams t "
                + "LEFT JOIN hackathons h "
                + "ON t.hackathon_id = h.hackathon_id "
                + "LEFT JOIN users u "
                + "ON t.leader_id = u.user_id";

        try (
                Connection con
                = DBConnection.getConnection(); PreparedStatement ps
                = con.prepareStatement(sql); ResultSet rs
                = ps.executeQuery();) {

            while (rs.next()) {

                Team team
                        = new Team();

                team.setTeamId(
                        rs.getInt("team_id"));

                team.setTeamName(
                        rs.getString("team_name"));

                team.setHackathonId(
                        rs.getInt("hackathon_id"));

                team.setLeaderId(
                        rs.getInt("leader_id"));

                team.setHackathonName(
                        rs.getString("hackathon_name"));

                team.setLeaderName(
                        rs.getString("leader_name"));

                teams.add(team);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return teams;
    }
    public Team getTeamById(int teamId) {


Team team = null;

String sql =
        "SELECT * FROM teams WHERE team_id=?";

try (

    Connection con =
            DBConnection.getConnection();

    PreparedStatement ps =
            con.prepareStatement(sql)

) {

    ps.setInt(1, teamId);

    ResultSet rs =
            ps.executeQuery();

    if(rs.next()) {

        team = new Team();

        team.setTeamId(
                rs.getInt("team_id"));

        team.setTeamName(
                rs.getString("team_name"));

        team.setHackathonId(
                rs.getInt("hackathon_id"));

        team.setLeaderId(
                rs.getInt("leader_id"));
    }

} catch(Exception e) {

    e.printStackTrace();
}

return team;

}

}
