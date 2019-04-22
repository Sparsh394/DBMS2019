package com.company;
import java.sql.*;
public class DatabaseConnector {
    public static Connection getConnect() throws SQLException
    {
        Connection conn = null;
        try {
            String url = "jdbc:mysql://localhost:3306/dbmsproject";
            String user = "root";
            String password = "mysql";
            conn = DriverManager.getConnection(url, user, password);

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {

                if (conn != null) {
                    System.out.println(1);



                }
            }


        return conn;

    }
}

