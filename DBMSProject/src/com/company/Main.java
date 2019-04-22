package com.company;
import java.sql.*;

public class Main {

    public static void main(String[] args) {
        // write your code here
        try (Connection conn = DatabaseConnector.getConnect()) {
            System.out.println("Connected "+ conn.getCatalog());
            LoginScreen newLogin= new LoginScreen();


        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }
}

