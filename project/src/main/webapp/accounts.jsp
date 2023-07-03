<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Bank UI</title>
    <%@ include file="navbar1.jsp" %>
    <link rel="stylesheet" href="accounts.css">
    
</head>
<body>
    

    <div class="container">
        <section class="financial-summary">
            <h2>Financial Summary</h2>
            <!-- Add summary details here (e.g., balance, account details) -->
        </section>

        <section class="holdings">
            <h2>Holdings</h2>
            <table>
                <thead>
                    <tr>
                        <th>Account Type</th>
                        <th>Balance</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Savings Account</td>
                        <td>INR.10,000</td>
                    </tr>
                    <tr>
                        <td>Current Account</td>
                        <td>INR.5,000</td>
                    </tr>
                    <tr>
                        <td>Fixed Deposit</td>
                        <td>INR.20,000</td>
                    </tr>
                </tbody>
            </table>
        </section>
    </div>

    <footer>
        <!-- Add footer content here -->
    </footer>
</body>
</html>
