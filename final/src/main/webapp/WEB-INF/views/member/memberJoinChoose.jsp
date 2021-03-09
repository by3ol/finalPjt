<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>loginForm</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel= "stylesheet" type="text/css" href="joinChoose.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
    <div class="login-form">
        <form action="/examples/actions/confirmation.php" method="post">
            <h2 class="text-center">Welcome</h2>
            <h2 class="text-center">Drommetur !!</h2>
            <br>
            <div class="text-center social-btn2">
                <a href="#" class="btn btn-info btn-block"><b>Drommetur</b> 가입하기</a>
            </div>
            <div class="or-seperator"><i>또는</i></div>
            <div class="text-center social-btn">
                <a href="#" class="btn btn-primary btn-block"><i class="fa fa-facebook"></i> Sign Up with
                    <b>Facebook</b></a>
                <a href="#" class="btn btn-info btn-block"><i class="fa fa-twitter"></i> Sign Up with <b>Twitter</b></a>
                <a href="#" class="btn btn-danger btn-block"><i class="fa fa-google"></i> Sign Up with <b>Google</b></a>
            </div>
        </form>
    </div>
</body>

</html>