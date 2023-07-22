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
public class TransferfundsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private static final String JDBC_URL = "jdbc:mysql://localhost:3306/cse";
	    private static final String JDBC_USERNAME = "root";
	    private static final String JDBC_PASSWORD = "uday2acc";

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html");
		HttpSession session = request.getSession(false);
      String username=(String) session.getAttribute("username");
      int account=(int)session.getAttribute("account");
      int reciveraccount = Integer.parseInt( request.getParameter("receiver"));
      int amount = Integer.parseInt( request.getParameter("amount"));
      System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$"+username);
      System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$"+account);
      System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$"+amount);
      Connection conn = null;
      PreparedStatement pstmt1 = null;
      PreparedStatement pstmt2 = null;
      PreparedStatement pstmt3 = null;
      PreparedStatement pstmt4 = null;
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
          
          pstmt1 = conn.prepareStatement(sql);
          
          pstmt1.setInt(1, amount);
          pstmt1.setInt(2, account);
 int rowsAffected = pstmt1.executeUpdate();
          
          System.out.println("Rows affected: " + rowsAffected);
          
  String sql1 = "UPDATE account SET savings=savings + ? WHERE account=? ";
          
          pstmt2 = conn.prepareStatement(sql1);
          
          pstmt2.setInt(1, amount);
          pstmt2.setInt(2, reciveraccount);
          int rowsAffected1 = pstmt2.executeUpdate();
          
          System.out.println("Rows affected: " + rowsAffected1);
          
          String transactionId = UUID.randomUUID().toString();
          String sql3 = "insert into transaction_history1 values(?,?,?,?,?,?)";
          pstmt3 = conn.prepareStatement(sql3);
          pstmt3.setString(1, transactionId);
          pstmt3.setInt(2, account);
          pstmt3.setTimestamp(3, currentTimestamp);
          pstmt3.setString(4, "Money Transfered");
          pstmt3.setInt(5, amount);
          pstmt3.setInt(6,reciveraccount);
          pstmt3.executeUpdate();
          String transactionId1 = UUID.randomUUID().toString();
          String sql4 = "insert into transaction_history1 values(?,?,?,?,?,?)";
          pstmt4 = conn.prepareStatement(sql4);
          pstmt4.setString(1, transactionId1);
          pstmt4.setInt(2, reciveraccount);
          pstmt4.setTimestamp(3, currentTimestamp);
          pstmt4.setString(4, "Money Credited");
          pstmt4.setInt(5, amount);
          pstmt4.setNull(6, Types.INTEGER);
          pstmt4.executeUpdate();
          
          
          
          
          
      }catch(ClassNotFoundException | SQLException e) {
          e.printStackTrace();
          
      } 
      
      response.sendRedirect("transaction_success.jsp");
//      RequestDispatcher dispatcher = request.getRequestDispatcher("/funds");
//
//      // Forward the request and response to ServletB
//      dispatcher.forward(request, response);
//      RequestDispatcher dispatcher = request.getRequestDispatcher("ui.jsp");
//      dispatcher.forward(request, response);
      
	}

}
