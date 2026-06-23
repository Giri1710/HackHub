package com.hackhub.dao;

import com.hackhub.model.Project;
import com.hackhub.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProjectDAO {

    public boolean createProject(Project project) {

        boolean success = false;

        String sql =
                "INSERT INTO projects "
                + "(title, description, domain, college, region, status, created_by) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql)

        ) {

            ps.setString(
                    1,
                    project.getTitle());

            ps.setString(
                    2,
                    project.getDescription());

            ps.setString(
                    3,
                    project.getDomain());

            ps.setString(
                    4,
                    project.getCollege());

            ps.setString(
                    5,
                    project.getRegion());

            ps.setString(
                    6,
                    project.getStatus());

            ps.setInt(
                    7,
                    project.getCreatedBy());

            success =
                    ps.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return success;
    }

    public List<Project> getAllProjects() {

        List<Project> projects =
                new ArrayList<>();

        String sql =
                "SELECT * FROM projects";

        try (

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery()

        ) {

            while (rs.next()) {

                Project project =
                        new Project();

                project.setProjectId(
                        rs.getInt("project_id"));

                project.setTitle(
                        rs.getString("title"));

                project.setDescription(
                        rs.getString("description"));

                project.setDomain(
                        rs.getString("domain"));

                project.setCollege(
                        rs.getString("college"));

                project.setRegion(
                        rs.getString("region"));

                project.setStatus(
                        rs.getString("status"));

                project.setCreatedBy(
                        rs.getInt("created_by"));

                projects.add(project);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return projects;
    }
    
    public Project getProjectById(
int projectId) {


Project project = null;

String sql =
        "SELECT * FROM projects "
        + "WHERE project_id=?";

try (

    Connection con =
            DBConnection.getConnection();

    PreparedStatement ps =
            con.prepareStatement(sql)

) {

    ps.setInt(1, projectId);

    ResultSet rs =
            ps.executeQuery();

    if(rs.next()) {

        project =
                new Project();

        project.setProjectId(
                rs.getInt("project_id"));

        project.setCreatedBy(
                rs.getInt("created_by"));
    }

} catch(Exception e) {

    e.printStackTrace();
}

return project;


}

}