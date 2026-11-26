package com.hackhub.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static final String URL =
        "jdbc:mysql://gateway01.ap-southeast-1.prod.aws.tidbcloud.com:4000/hackhub"
        + "?sslMode=REQUIRED";

    private static final String USER =
        "2cuCc6JtzY6ojYv.root";

    private static final String PASSWORD =
        System.getenv("DB_PASSWORD");

    public static Connection getConnection() {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            return DriverManager.getConnection(
                URL,
                USER,
                PASSWORD
            );

        } catch (Exception e) {
            System.out.println("DATABASE CONNECTION ERROR:");
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}