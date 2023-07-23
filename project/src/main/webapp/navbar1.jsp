<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="navbar1.css">
    <style>
        /* Add any additional styles specific to this HTML file */
    </style>
</head>
<body>
<%
//allow access only if session exists
String user1 = null;
user1 = (String) session.getAttribute("username");
String fullname=(String)session.getAttribute("fullname");
String userName1 = null;
String sessionID1 = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("username")) userName1 = cookie.getValue();
	if(cookie.getName().equals("JSESSIONID")) sessionID1 = cookie.getValue();
}
}
  
%>
    <header>
        <nav class="navbar">
            <a class="navbar-logo" href="#">
                <img src="logo.jpeg" alt="UTM bank">
            </a>
            <ul class="left-menu">
                <li>
                    <a href="#" onclick="postToServletAccount()">Accounts</a>
    <form id="fundsFormAccount" action="ui" method="post" style="display: none;">
        <!-- Add any form data if needed -->
        <!-- For example, <input type="hidden" name="paramName" value="paramValue"> -->
    </form>
                </li>
                <li>
    <a href="#" onclick="postToServlet()">Funds Transfer</a>
    <form id="fundsForm" action="FundsServlet" method="post" style="display: none;">
        <!-- Add any form data if needed -->
        <!-- For example, <input type="hidden" name="paramName" value="paramValue"> -->
    </form>
</li>
                <li><a href="#" onclick="postToServletTransaction()">Transactions</a>
    <form id="fundsFormTransaction" action="TransactionServlet" method="post" style="display: none;">
        <!-- Add any form data if needed -->
        <!-- For example, <input type="hidden" name="paramName" value="paramValue"> -->
    </form></li>
                <li>
    <a href="#" onclick="postToServletcards()">Cards</a>
    <form id="fundsFormcards" action="cards" method="post" style="display: none;">
        <!-- Add any form data if needed -->
        <!-- For example, <input type="hidden" name="paramName" value="paramValue"> -->
    </form>
</li>
                <li><a href="loans.jsp">Loans</a></li>
            </ul>
            <ul class="right-menu">
                
                <li>
    <a href="#" onclick="postToServletprofile()"><%=fullname %></a>
    <form id="fundsFormprofile" action="profile" method="post" style="display: none;">
        <!-- Add any form data if needed -->
        <!-- For example, <input type="hidden" name="paramName" value="paramValue"> -->
    </form>
</li>
                <li><a href="#" onclick="logout()">Logout</a></li>
            </ul>
        </nav>
    </header>

    <script>
        function logout() {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "LogoutServlet", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    window.location.href = "index.jsp";
                }
            };
            xhr.send();
        }
        function postToServlet() {
            // Submit the form to initiate the POST request
            document.getElementById("fundsForm").submit();
        }
        function postToServletAccount() {
            // Submit the form to initiate the POST request
            document.getElementById("fundsFormAccount").submit();
        }
        function postToServletTransaction() {
            // Submit the form to initiate the POST request
            document.getElementById("fundsFormTransaction").submit();
        }
        function postToServletprofile() {
            // Submit the form to initiate the POST request
            document.getElementById("fundsFormprofile").submit();
        }
        function postToServletcards() {
            // Submit the form to initiate the POST request
            document.getElementById("fundsFormcards").submit();
        }
    </script>
</body>
</html>
