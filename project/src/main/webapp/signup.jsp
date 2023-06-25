<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
   <head>
      <meta charset="utf-8">
      <title>Signup</title>
      <link rel="stylesheet" href="signup.css">
      <script>
         function validateSignupForm() {
        	 var accno = document.getElementById("accno").value;
        	 var acctype = document.getElementById("acctype").value;
            var fullName = document.getElementById("fullName").value;
            var username = document.getElementById("username").value;
            var email = document.getElementById("email").value;
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            var agreeCheckbox = document.getElementById("agree");


            if (accno.trim() === "") {
                alert("Please enter your Account number.");
                return false;
             }

            if (acctype.trim() === "") {
                alert("Please enter your Account type.");
                return false;
             }
            
            if (fullName.trim() === "") {
               alert("Please enter your full name.");
               return false;
            }

            if (username.trim() === "") {
               alert("Please enter a username.");
               return false;
            }

            if (email.trim() === "") {
               alert("Please enter your email address.");
               return false;
            }

            if (password.trim() === "") {
               alert("Please enter a password.");
               return false;
            }

            if (confirmPassword.trim() === "") {
               alert("Please confirm your password.");
               return false;
            }

            if (password !== confirmPassword) {
               alert("Passwords do not match.");
               return false;
            }

            if (!agreeCheckbox.checked) {
               alert("Please agree to the terms and conditions.");
               return false;
            }

            return true;
         }
      </script>
   </head>
   <body>
   <jsp:include page="navbar.jsp" />
      <div class="wrapper">
         <div class="title">
            Signup Form
         </div>
         <form action="RegisterService" method="get">
                     <div class="field">
               <input type="text" id="accno" name="accno" required>
               <label>Account Number</label>
            </div>
                        <div class="field">
               <input type="text" id="acctype" name="acctype" required>
               <label>Account Type</label>
            </div>
            <div class="field">
               <input type="text" id="fullName" name="fullname" required>
               <label>Full Name</label>
            </div>
            <div class="field">
               <input type="text" id="username" name="username" required>
               <label>Username</label>
            </div>
            <div class="field">
               <input type="text" id="email" name="email" required>
               <label>Email Address</label>
            </div>
            <div class="field">
               <input type="password" id="password" name="password"  required>
               <label>Password</label>
            </div>
            <div class="field">
               <input type="password" id="confirmPassword" required>
               <label>Confirm Password</label>
            </div>
            <div class="content">
               <div class="checkbox">
                  <input type="checkbox" id="agree">
                  <label for="agree">I agree to the terms and conditions</label>
               </div>
            </div>
            <div class="field">
               <input type="submit" value="Signup">
            </div>
            <div class="signup-link">
               Already have an account? <a href="/project">Login now</a>
            </div>
         </form>
      </div>
   </body>
</html>
