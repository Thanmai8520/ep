package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Transaction;

public class HistoryServlet extends HttpServlet {
    private final String JDBC_URL = "jdbc:mysql://localhost:3306/cse";
    private final String DB_USER = "root";
    private final String DB_PASSWORD = "Thanmaikora@2003";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // List to store transaction data
        List<Transaction> transactionsList = new ArrayList<>();

        // Database connection variables
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish the database connection
            conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);

            // Prepare the SQL query to retrieve transaction history
            String sqlQuery = "SELECT accountNumber, transactionType, amount, time FROM history";

            // Create a prepared statement
            stmt = conn.prepareStatement(sqlQuery);

            // Execute the query and get the result set
            rs = stmt.executeQuery();

            // Loop through the result set and populate the transactionsList
            while (rs.next()) {
                int accountNumber = rs.getInt("accountNumber");
                String transactionType = rs.getString("transactionType");
                int amount = rs.getInt("amount");
                Timestamp time = rs.getTimestamp("time");

                Transaction transaction = new Transaction(accountNumber, transactionType, amount, time);
                transactionsList.add(transaction);
            }

            // Set the transactionsList as an attribute to be accessed in the JSP
            request.setAttribute("transactionsList", transactionsList);

            // Forward the request to the JSP page for rendering
            request.getRequestDispatcher("transhistory.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Handle exceptions as needed
        } finally {
            // Close the database resources
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
                // Handle exceptions as needed
            }
        }
    }
}
