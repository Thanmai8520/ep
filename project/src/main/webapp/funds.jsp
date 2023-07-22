<!DOCTYPE html>
<html>
<head>
    <title>Funds Transfer</title>
     <%@ include file="navbar1.jsp" %>
</head>

    <%
//allow access only if session exists
String user = null;
if(session.getAttribute("username") == null){
	response.sendRedirect("index.jsp");
}

%>
   <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f9f9f9;
        }

        h1 {
            text-align: center;
            color: #007BFF;
        }

        .balance {
            text-align: center;
            font-weight: bold;
            margin-bottom: 20px;
        }

        form {
            border: 1px solid #ccc;
            padding: 20px;
            margin-bottom: 20px;
            width: 80%;
            max-width: 400px;
            margin-left: auto;
            margin-right: auto;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"] {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #007BFF;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
            align-self: flex-end;
            width: fit-content;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        h2 {
            color: #007BFF;
            margin-top: 30px;
        }
    </style>

<body>
    <h1>Funds Transfer</h1>
    <div class="balance">Available Balance: $1500.00</div>

    <h2>Add Funds</h2>
    <form id="addFundsForm">
        <label for="addAmount">Amount:</label>
        <input type="number" id="addAmount" required>
        <input type="submit" value="Add Funds">
    </form>

    <h2>Withdraw Funds</h2>
    <form id="withdrawFundsForm">
        <label for="withdrawAmount">Amount:</label>
        <input type="number" id="withdrawAmount" required>
        <input type="submit" value="Withdraw Funds">
    </form>

    <h2>Send Funds</h2>
    <form id="sendFundsForm">
        <label for="receiverAccountNumber">Receiver Account Number:</label>
        <input type="text" id="receiverAccountNumber" required>
        <label for="sendAmount">Amount:</label>
        <input type="number" id="sendAmount" required>
        <input type="submit" value="Send Funds">
    </form>

    <script>
        // JavaScript code for handling form submissions will remain the same
    </script>
</body>
</html>
