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
import java.util.UUID;
import java.sql.Timestamp;
import java.util.Date;
import java.sql.Types;
/**
 * Servlet implementation class withdraw
 */
public class WithdrawServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private static final String JDBC_URL = "jdbc:mysql://localhost:3306/cse";
	    private static final String JDBC_USERNAME = "root";
	    private static final String JDBC_PASSWORD = "uday2acc";

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html");
		HttpSession session = request.getSession(false);
      String username=(String) session.getAttribute("username");
      int account=(int)session.getAttribute("account");
      int amount = Integer.parseInt( request.getParameter("amount"));
      System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$"+username);
      System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$"+account);
      System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$"+amount);
      Connection conn = null;
      PreparedStatement pstmt = null;
      PreparedStatement pstmt1 = null;
      ResultSet rs = null;
      
      try {
    	  Date currentDate = new Date();

          // Step 2: Convert the Date object to a java.sql.Timestamp object
          Timestamp currentTimestamp = new Timestamp(currentDate.getTime());
          // Create a database connection
          Class.forName("com.mysql.cj.jdbc.Driver");
          conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);

          // Prepare the SQL statement to check user credentials
          String sql = "UPDATE account SET savings=savings - ? WHERE account=? ";
          pstmt = conn.prepareStatement(sql);
          
          pstmt.setInt(1, amount);
          pstmt.setInt(2, account);
          
          int rowsAffected = pstmt.executeUpdate();
          String transactionId = UUID.randomUUID().toString();
          String sql1 = "insert into transaction_history1 values(?,?,?,?,?,?)";
          pstmt1 = conn.prepareStatement(sql1);
          pstmt1.setString(1, transactionId);
          pstmt1.setInt(2, account);
          pstmt1.setTimestamp(3, currentTimestamp);
          pstmt1.setString(4, "Money WithDrawed");
          pstmt1.setInt(5, amount);
          pstmt1.setNull(6, Types.INTEGER);
          pstmt1.executeUpdate();
          
          
          
          
          System.out.println("Rows affected: " + rowsAffected);
          
      }catch(ClassNotFoundException | SQLException e) {
          e.printStackTrace();
          
      } 
      RequestDispatcher dispatcher = request.getRequestDispatcher("/FundsServlet");

      // Forward the request and response to ServletB
      dispatcher.forward(request, response);
     // response.sendRedirect("funds");
//      RequestDispatcher dispatcher = request.getRequestDispatcher("ui.jsp");
//      dispatcher.forward(request, response);
      
	}

}
