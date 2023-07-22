<!DOCTYPE html>
<html>
<head>
    <title>Transaction Details</title>
    <%@ include file="navbar1.jsp" %>
</head>
<body>
    <h1>Transaction Details for Account 1234</h1>
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
