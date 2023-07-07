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
                    <a href="#">Accounts</a>
                </li>
                <li><a href="#">Funds Transfer</a></li>
                <li><a href="#">Transactions</a></li>
                <li><a href="#">Cards</a></li>
                <li><a href="#">Loans</a></li>
            </ul>
            <ul class="right-menu">
                <li><a href="#"><%=fullname %></a></li>
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
    </script>
</body>
</html>
