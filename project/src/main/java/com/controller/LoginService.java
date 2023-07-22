  package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;
@WebServlet("/LoginService")
public class LoginService extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Database connection details
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/cse";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "uday2acc";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("uname");
        String password = request.getParameter("pass");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Create a database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);

            // Prepare the SQL statement to check user credentials
            String sql = "SELECT * FROM project WHERE username = ? AND password = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            // Check if the user exists
            if (rs.next()) {
            	HttpSession session = request.getSession();
    			session.setAttribute("username",username);
    			session.setAttribute("fullname", rs.getString("fullname"));
    			session.setAttribute("account",rs.getInt("accountnumber"));
    			System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$"+rs.getInt("accountnumber"));
    			//setting session to expiry in 30 mins
    			session.setMaxInactiveInterval(30*60);
    			Cookie userName = new Cookie("username", username);
    			userName.setMaxAge(30*60);
    			response.addCookie(userName);
                // User exists, redirect to a success page
    			  RequestDispatcher dispatcher = request.getRequestDispatcher("ui");
    			    dispatcher.forward(request, response);
            } else {
                // User does not exist, redirect to an error page
                response.sendRedirect("error.jsp");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Handle any exceptions here
        } finally {
            // Close the resources
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
                // Handle any exceptions here
            }
        }
    }
}