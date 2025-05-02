<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Shopping | Register</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 50%;
            margin: 0 auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        label {
            font-size: 16px;
            color: #555;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 14px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #45a049;
        }

        .signin {
            text-align: center;
            margin-top: 20px;
        }

        .signin a {
            color: #4CAF50;
            text-decoration: none;
        }

        .signin a:hover {
            text-decoration: underline;
        }

        hr {
            margin: 20px 0;
        }

        p {
            font-size: 14px;
            color: #666;
            text-align: center;
        }
    </style>

</head>
<body>

    <div class="container">
        <h1>Welcome to E-Shopping!</h1>
        <p>Please fill in this form to create an account.</p>
        <hr>

        <form action="action_page.php">
            <label for="Name"><b>Enter Name</b></label>
            <input type="text" placeholder="Enter Full Name" name="Name" id="Name" required>
            <br>

            <label for="mobile"><b>Enter mobile</b></label>
            <input type="text" placeholder="Enter mobile number" name="mobile" id="mobile" required>
            <br>

            <label for="email"><b>Enter Email</b></label>
            <input type="text" placeholder="Enter Email" name="email" id="email" required>
            <br>

            <label for="psw"><b>Password</b></label>
            <input type="password" placeholder="Enter Password" name="psw" id="psw" required>
            <br>

            <label for="psw-repeat"><b>Repeat Password</b></label>
            <input type="password" placeholder="Repeat Password" name="psw-repeat" id="psw-repeat" required>
            <hr>

            <button type="submit" class="registerbtn">Register</button>
        </form>

        <div class="signin">
            <p>Already have an account? <a href="#">Sign in</a>.</p>
        </div>

        <h1>Thank You!</h1>
        <h1>Happy Learning. See You Again.</h1>
    </div>

</body>
</html>
