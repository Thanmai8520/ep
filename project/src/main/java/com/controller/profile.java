package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class profile
 */
public class profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private static final String JDBC_URL = "jdbc:mysql://localhost:3306/cse";
	    private static final String JDBC_USERNAME = "root";
	    private static final String JDBC_PASSWORD = "uday2acc";
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html");
		HttpSession session = request.getSession(false);
       String username=(String) session.getAttribute("username");
       System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$"+username);
       int account=(int)session.getAttribute("account");
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       
       try {
           // Create a database connection
           Class.forName("com.mysql.cj.jdbc.Driver");
           conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);

           // Prepare the SQL statement to check user credentials
           String sql = "SELECT * FROM project WHERE username = ?";
           pstmt = conn.prepareStatement(sql);
           
           pstmt.setString(1, username);
           
           rs = pstmt.executeQuery();
           if (rs.next()) {
           request.setAttribute("fullname",rs.getString("fullname"));
           request.setAttribute("accountnumber", rs.getInt("accountnumber"));
           request.setAttribute("accounttype",rs.getString("accounttype"));
           request.setAttribute("username",username);
           request.setAttribute("email", rs.getString("email"));
           
           
           
           }else {
           	System.out.println("query problem");
           }
           
       }catch(ClassNotFoundException | SQLException e) {
           e.printStackTrace();
           
       } 
       
       
       RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
       dispatcher.forward(request, response);
       
	}

}
