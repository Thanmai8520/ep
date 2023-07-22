<!DOCTYPE html>
<html>
<head>
    <title>Transaction Successful</title>
</head>
<body>
    <h1>Transaction Successful!</h1>
    <p>You will be redirected to the funds servlet in 5 seconds...</p>

    <script>
        // Function to redirect to another servlet after a delay
        function redirectWithDelay(url, delay) {
            setTimeout(function () {
                var form = document.createElement('form');
                form.method = 'post';
                form.action = url;
                document.body.appendChild(form);
                form.submit();
            }, delay);
        }

        // Redirect to the funds servlet after 5 seconds
        var redirectURL = 'FundsServlet'; // Replace with the actual URL of the funds servlet
        var delayInMilliseconds = 5000; // 5 seconds
        redirectWithDelay(redirectURL, delayInMilliseconds);
    </script>
</body>
</html>
