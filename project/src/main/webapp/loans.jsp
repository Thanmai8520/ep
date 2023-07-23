<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Loan Details</title>
  <%@ include file="navbar1.jsp" %>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f3f0fd;
      color: #333;
    }

    .container {
      max-width: 800px;
      margin: 0 auto;
      padding: 20px;
    }

    h1 {
      text-align: center;
      color: #6a0dad;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    th, td {
      padding: 10px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }

    th {
      background-color: #6a0dad;
      color: #fff;
    }

    tr:hover {
      background-color: #f5e7ff;
    }

    /* Custom purple shades CSS */
    .purple-bg {
      background-color: #6a0dad;
      color: #fff;
    }

    .light-purple-bg {
      background-color: #9d67ff;
      color: #fff;
    }

    .dark-purple-bg {
      background-color: #4d007a;
      color: #fff;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Loan Details</h1>
    <table>
       <tr>
        <th>Loan Type</th>
        <th>Interest Rate</th>
        <th>Advantages</th>
        <th>Apply Now</th>
      </tr>
      <tr class="purple-bg">
        <td>Home Loan</td>
        <td>4.5%</td>
        <td>
          <ul>
            <li>Low-interest rates</li>
            <li>Flexible repayment options</li>
            <li>Long repayment tenure</li>
            <li>Tax benefits on interest payments*</li>
          </ul>
        </td>
        <td><a href="#">Apply Now</a></td>
      </tr>
      <tr class="light-purple-bg">
        <td>Education Loan</td>
        <td>3.9%</td>
        <td>
          <ul>
            <li>No processing fee</li>
            <li>Grace period after course completion</li>
            <li>Flexible repayment after securing a job</li>
            <li>Interest subsidy for eligible candidates*</li>
          </ul>
        </td>
        <td><a href="#">Apply Now</a></td>
      </tr>
      <tr class="dark-purple-bg">
        <td>Vehicle Loan</td>
        <td>5.2%</td>
        <td>
          <ul>
            <li>100% financing on select models</li>
            <li>Quick loan approval</li>
            <li>Low down payment options</li>
            <li>Special offers for existing customers*</li>
          </ul>
        </td>
        <td><a href="#">Apply Now</a></td>
      </tr>
      <tr class="purple-bg">
        <td>Personal Loan</td>
        <td>7.8%</td>
        <td>
          <ul>
            <li>No collateral required</li>
            <li>Instant approval and disbursal</li>
            <li>Flexible repayment tenure</li>
            <li>Pre-approved offers for eligible customers*</li>
          </ul>
        </td>
        <td><a href="#">Apply Now</a></td>
      </tr>
    </table>
    <p style="font-size: 12px; margin-top: 20px;">*Terms and conditions apply. Interest rates are subject to change.</p>
    
 

<!-- Loan Calculator Section -->
<div class="loan-calculator">
  <h2>Loan Calculator</h2>
  <form id="loanForm">
    <label for="loanType">Loan Type:</label>
    <select id="loanType" name="loanType">
      <option value="home">Home Loan</option>
      <option value="education">Education Loan</option>
      <option value="vehicle">Vehicle Loan</option>
      <option value="personal">Personal Loan</option>
    </select>
    <br>
    <label for="loanAmount">Loan Amount:</label>
    <input type="number" id="loanAmount" name="loanAmount" required>
    <br>
    <label for="numberOfYears">Number of Years:</label>
    <input type="number" id="numberOfYears" name="numberOfYears" required>
    <br>
    <button type="button" onclick="calculateLoan()">Calculate</button>
  </form>
  <div id="result" style="display: none;">
    <h3>Calculated Amount with Interest:</h3>
    <p id="calculatedAmount"></p>
  </div>
</div>

<!-- Previous CSS and JavaScript content remains unchanged -->



  <!-- CSS for Loan Calculator Section -->
  <style>
    .loan-calculator {
      margin-top: 30px;
      border: 1px solid #ccc;
      padding: 20px;
    }

    .loan-calculator h2 {
      color: #6a0dad;
      margin-bottom: 10px;
    }

    .loan-calculator label {
      display: block;
      margin-bottom: 5px;
      color: #333;
    }

    .loan-calculator select, .loan-calculator input {
      width: 100%;
      padding: 8px;
      margin-bottom: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    .loan-calculator button {
      background-color: #6a0dad;
      color: #fff;
      padding: 10px 20px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    .loan-calculator button:hover {
      background-color: #4d007a;
    }

    #result {
      margin-top: 20px;
    }

    #result h3 {
      color: #6a0dad;
      margin-bottom: 10px;
    }
  </style>

 <!-- Previous JavaScript content remains unchanged -->

<!-- JavaScript to Calculate Loan Amount with Interest -->
<script>
  function calculateLoan() {
    const loanType = document.getElementById("loanType").value;
    const loanAmount = parseFloat(document.getElementById("loanAmount").value);
    const numberOfYears = parseInt(document.getElementById("numberOfYears").value);
    let interestRate;

    // Set interest rates based on loan type (simplified for demonstration)
    switch (loanType) {
      case "home":
        interestRate = 4.5;
        break;
      case "education":
        interestRate = 3.9;
        break;
      case "vehicle":
        interestRate = 5.2;
        break;
      case "personal":
        interestRate = 7.8;
        break;
      default:
        interestRate = 0;
    }

    const interestAmount = (loanAmount * interestRate * numberOfYears) / 100;
    const totalAmount = loanAmount + interestAmount;

    document.getElementById("calculatedAmount").innerText = `Total Amount with Interest: ${totalAmount.toFixed(2)}`;
    document.getElementById("result").style.display = "block";
  }
</script>

</body>
</html>
