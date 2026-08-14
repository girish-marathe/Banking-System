<%-- 
    Document   : login
    Created on : Nov 27, 2017, 3:20:16 AM
    Author     : PTPL-02
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
    <head>
        <title>Login Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Modern Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
        <!-- Custom CSS -->
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <link href="css/font-awesome.css" rel="stylesheet"> 
        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>
        <!----webfonts--->
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
        <!---//webfonts--->  
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>


       

    </head>
    <body id="login">
        <div class="login-logo">
            <!-- <a href="index.html"><img src="images/logo.png" alt=""/></a>-->
        </div>
        <h2 class="form-heading">login</h2>
        <div class="app-cam">
            <form action="Login" method="post">
                <input type="text" class="text" value="Username" name="uname" onfocus="this.value = '';" onblur="if (this.value == '') {
                            this.value = 'E-mail address';
                        }" name="username">
                <input type="password" value="Password" name="pass"  onfocus="this.value = '';" onblur="if (this.value == '') {
                            this.value = 'Password';
                        }" name="password">
                <div class="submit"><input type="submit" onclick="myFunction()" value="Login"></div>
                <div class="login-social-link">
                    
                </div>
                <ul class="new">
                    <li class="new_left"><p><a href="forgot.jsp">Forgot Password ?</a></p></li>
                    <li class="new_right"><p class="sign">New here ?<a href="userRegister.jsp"> Sign Up</a></p></li>
                    <li class="new_right"><p class="sign"><a href="bankLogin.jsp">Manager Login</a></p></li>
                    <div class="clearfix"></div>
                </ul>
            </form>
        </div>
        <div class="copy_layout login">
            <p>Copyright &copy; 2026 Modern. All Rights Reserved | Design by <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
        </div>
    </body>
</html>
