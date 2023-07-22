<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Transaction History</title>
    <link rel="stylesheet" type="text/css" href="transhistory.css">
</head>
<body>
    <h1>Transaction History</h1>
    <table>
        <tr>
            <th>Account Number</th>
            <th>Transaction Type</th>
            <th>Amount</th>
            <th>Time</th>
        </tr>
        <c:forEach var="transaction" items="${transactionsList}">
            <tr>
                <td>${transaction.accountNumber}</td>
                <td>${transaction.transactionType}</td>
                <td>${transaction.amount}</td>
                <td>${transaction.time}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
