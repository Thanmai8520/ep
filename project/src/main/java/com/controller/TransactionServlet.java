package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class TransactionServlet
 */
public class TransactionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        // Define variables
	        Connection conn = null;
	        java.sql.Statement stmt = null;
	        ResultSet rs = null;

	        try {
	            // Connect to the database (Replace with your actual database connection details)
	            Class.forName("com.mysql.jdbc.Driver");
	            String url = "jdbc:mysql://localhost:3306/cse";
	            String user = "root";
	            String password = "uday2acc";
	            conn = DriverManager.getConnection(url, user, password);

	            // Execute the SQL query
	            String sql = "SELECT * FROM transaction_history1 WHERE account = 1234";
	            stmt = conn.createStatement();
	            rs = stmt.executeQuery(sql);

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
	            // Close the resources (database connection, statement, and result set)
	            try {
	                if (rs != null) rs.close();
	                if (stmt != null) stmt.close();
	                if (conn != null) conn.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }

}
