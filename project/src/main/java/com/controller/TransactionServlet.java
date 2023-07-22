package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class TransactionServlet
 */
public class TransactionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Define variables
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        HttpSession session = request.getSession(false);
        int account=(int)session.getAttribute("account");
        try {
            // Connect to the database (Replace with your actual database connection details)
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/cse";
            String user = "root";
            String password = "uday2acc";
            conn = DriverManager.getConnection(url, user, password);

            // Prepare the SQL query with a placeholder for the account column
            String sql = "SELECT * FROM transaction_history1 WHERE account = ?";
            pstmt = conn.prepareStatement(sql);

            // Replace the parameter placeholder with the actual value (in this case, 1234)
            pstmt.setInt(1, account);

            // Execute the prepared statement
            rs = pstmt.executeQuery();

            // Create a list to store the results
            ArrayList<Transaction> transactions = new ArrayList<>();

            // Process the result set and store data in the list
            while (rs.next()) {
                Transaction transaction = new Transaction();
                transaction.setTransaction_id(rs.getString("transaction_id"));
                transaction.setAccount(rs.getInt("account"));
                transaction.setTransaction_date(rs.getTimestamp("transaction_date"));
                transaction.setTransaction_type(rs.getString("transaction_type"));

                transaction.setAmount(rs.getDouble("amount"));
                transaction.setReceiver(rs.getInt("receiver"));

                // Set other fields as needed
                transactions.add(transaction);
            }

            // Set the list as an attribute in the request
            request.setAttribute("transactions", transactions);

            // Forward the request to the JSP
            request.getRequestDispatcher("transaction.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            // Close the resources (database connection, prepared statement, and result set)
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
