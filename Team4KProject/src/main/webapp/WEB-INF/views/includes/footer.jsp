<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer</title>
    <style>
        .footer {
            background: #333;
            color: #fff;
            padding: 0;
            margin: 0;
            text-align: center;
            border-top-left-radius: 40%;
            border-top-right-radius: 40%;
    		position: fixed;
    		z-index: 998;
    		width: 100vw;
    		height: 5vh;
    		bottom: 0;
        }
        .footer > .container{
            width: 90%;
            margin: 0 auto;
            max-width: 1200px;
            font-size: calc( 2vw + 2vh );
        }
    </style>
</head>
<body>
    <footer class="footer">
        <div class="container">
            <p>&copy; 2024 AiaaS8 Team4K. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>