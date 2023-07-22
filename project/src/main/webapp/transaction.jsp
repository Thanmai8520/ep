<!DOCTYPE html>
<html>
<head>
    <title>Transaction Details</title>
    <%@ include file="navbar1.jsp" %>
</head>

<body>
<style type="text/css">
/* Replace the styles with your desired purple shades */
body {
    background-color: #f2e6ff;
}

table {
    border-collapse: collapse;
    width: 100%;
    margin-top: 20px;
}

th, td {
    border: 1px solid #9933ff;
    padding: 8px;
    text-align: left;
}

th {
    background-color: #b280ff;
    color: white;
}</style>
<%
//allow access only if session exists
String user = null;
if(session.getAttribute("username") == null){
	response.sendRedirect("index.jsp");
}

%>
<%
//allow access only if session exists
String user2 = null;
user1 = (String) session.getAttribute("username");
String fullname1=(String)session.getAttribute("fullname");
int account=(int)session.getAttribute("account");
String userName2 = null;
String sessionID2 = null;
Cookie[] cookies1 = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("username")) userName2 = cookie.getValue();
	if(cookie.getName().equals("JSESSIONID")) sessionID2 = cookie.getValue();
}
}
  
%>
    <h1>Transaction Details for Account <%=account %></h1>
    <table border="1">
        <tr>
            <th>transaction id</th>
            <th>Account</th>
            <th>transaction_time</th>
            <th>transaction_type</th>
            <th>Amount</th>
             <th>receiver id</th>
            <!-- Add other table headers for additional fields if needed -->
        </tr>
        <%-- Access the data from the attribute in the request --%>
        <%@ page language="java" import="java.util.ArrayList" %>
        <%@ page import="com.controller.Transaction" %>
        <% ArrayList<Transaction> transactions = (ArrayList<Transaction>) request.getAttribute("transactions"); %>
        <% if (transactions != null && !transactions.isEmpty()) { %>
            <% for (Transaction transaction : transactions) { %>
                <tr>
                <td><%= transaction.getTransaction_id() %></td>
                    <td><%= transaction.getAccount() %></td>
                    <td><%= transaction.getTransaction_date() %></td>
                    <td><%= transaction.getTransaction_type() %></td>
                    <td><%= transaction.getAmount() %></td>
                   <td><%= transaction.getReceiver() %></td>
                    
                    <!-- Add other table data cells for additional fields if needed -->
                </tr>
            <% } %>
        <% } else { %>
            <tr>
                <td colspan="2">No transactions found for Account 1234.</td>
            </tr>
        <% } %>
    </table>
</body>
</html>
