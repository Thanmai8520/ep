<!DOCTYPE html>
<html>
<head>
    <title>Transaction Successful</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            text-align: center;
        }

        h1 {
            color: #009933; /* Green color for the heading */
        }

        p {
            color: #006600; /* Slightly darker green color for the paragraph */
        }

        /* Optional: Add a subtle animation to the heading */
        h1 {
            animation: colorChange 2s infinite alternate;
        }

        @keyframes colorChange {
            from {
                color: #009933;
            }
            to {
                color: #003300;
            }
        }

        /* Styling for the green tick in a circle */
        .tick-circle {
            display: inline-block;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background-color: #009933;
            position: relative;
        }

        .tick {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 0;
            height: 0;
            border-style: solid;
            border-width: 0 7px 14px 0;
            border-color: transparent #f0f0f0 transparent transparent;
        }
    </style>
</head>
<body>
    <div class="tick-circle">
        <div class="tick"></div>
    </div>
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
