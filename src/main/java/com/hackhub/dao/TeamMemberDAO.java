package com.hackhub.dao;

import com.hackhub.model.TeamMember;
import com.hackhub.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TeamMemberDAO {

    public boolean joinTeam(
            TeamMember member) {

        boolean success = false;

        String sql
                = "INSERT INTO team_members "
                + "(team_id, user_id, role) "
                + "VALUES (?, ?, ?)";

        try (
                Connection con
                = DBConnection.getConnection(); PreparedStatement ps
                = con.prepareStatement(sql)) {

            ps.setInt(
                    1,
                    member.getTeamId());

            ps.setInt(
                    2,
                    member.getUserId());

            ps.setString(
                    3,
                    member.getRole());

            success
                    = ps.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return success;
    }

    public List<TeamMember> getMembersByTeamId(int teamId) {

        List<TeamMember> members
                = new ArrayList<>();

        String sql
                = "SELECT tm.*, "
                + "u.name, "
                + "u.email, "
                + "u.college "
                + "FROM team_members tm "
                + "JOIN users u "
                + "ON tm.user_id = u.user_id "
                + "WHERE tm.team_id=?";

        try (
                Connection con
                = DBConnection.getConnection(); PreparedStatement ps
                = con.prepareStatement(sql)) {

            ps.setInt(1, teamId);

            ResultSet rs
                    = ps.executeQuery();

            while (rs.next()) {

                TeamMember member
                        = new TeamMember();

                member.setId(
                        rs.getInt("id"));

                member.setTeamId(
                        rs.getInt("team_id"));

                member.setUserId(
                        rs.getInt("user_id"));

                member.setRole(
                        rs.getString("role"));

                member.setName(
                        rs.getString("name"));

                member.setEmail(
                        rs.getString("email"));

                member.setCollege(
                        rs.getString("college"));

                members.add(member);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return members;
    }
}
