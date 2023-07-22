<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Online Banking - Profile</title>
  <link rel="stylesheet" href="profile.css">
  <%@ include file="navbar1.jsp" %>
</head>
<body>
 <%
//allow access only if session exists
String user = null;
if(session.getAttribute("username") == null){
	response.sendRedirect("index.jsp");
}

%>
  <div class="container">
    <div class="profile">
      <div class="profile-image">
        <!-- Add a real profile picture here later -->
        <img src="logo.jpeg" alt="Profile Picture">
      </div>
      <h1>Welcome, <%= request.getAttribute("fullname") %></h1>
      <div class="profile-details">
        <p><strong>Account Number:</strong> <%= request.getAttribute("accountnumber") %></p>
        <p><strong>Account Type:</strong> <%= request.getAttribute("accounttype") %></p>
        <p><strong>Username:</strong> <%= request.getAttribute("username") %></p>
        <p><strong>Email:</strong> <%= request.getAttribute("email") %></p>
        <!-- Password should never be displayed like this in a real system -->
        <p><strong>Password:</strong> *********</p>
      </div>
      <div class="edit-button">
        <a href="#">Edit Profile</a>
      </div>
    </div>
  </div>
</body>
</html>
